import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline

//Contorol and State Registers
//to ID and WB, csr is just like another regfile
/*
__________________________________________
| csr[11:0] | rs1 | funct3 | rd  | opcode |
    12          5     3       5     7(1110011). when rd(0) = 0, this ends with 0x73
*/

class CSR extends Module{
    def toIsa(s: String): Int = {
        s.map(c => 1 << (c - 'A')).fold(0)(_ | _)
    }
    val io = IO(new Bundle{
        val ID_2_CSR     = Input(new ID_2_CSR)
        val writeOp      = Input(new writeCSROp)
        val exception    = Input(new exception)

        val CSR_2_ID     = Output(new CSR_2_ID)
        val CSR_2_IF     = Output(new CSR_2_IF)
    })

    val csr     = Mem(0x400, UInt(64.W))        //registers
    // Don't use `for(i <- 0 until 0x400)` to iterate all CSRs. It may generate many unused D-triggers,(10000 lines of code...)
    when(reset.asBool){
        loadMemoryFromFileInline(csr,  CONST.RV_HOME + "csr.data")       //all zeroes, a kind of reset...
    }
    val csrAddr   = io.ID_2_CSR.addr
    //priv is changed only when an exception happens. default is M mode
    val nextPriv  = Wire(Bits(2.W))
    val priv      = RegNext(nextPriv, init = Priv.M)
    nextPriv     := priv     //default

    //use inst like: csrrw t0, 0x320, t1 to access instead of csrrw t0, mtime, t1. since these 2 registers are not strictly defined in mamual
    val mtime     =  csr(ADDR.mtime);    mtime    :=  mtime + 1.U
    val mtimecmp  =  csr(ADDR.mtimecmp)
    //read only
    csr(ADDR.misa)      := (Cat(1.U(1.W), 0.U(63.W)) | (toIsa("IMUS").U))
    csr(ADDR.mvendorid) := CONST.MVENDORID
    csr(ADDR.marchid)   := CONST.MARCHID
    csr(ADDR.mhartid)   := 0.U
    csr(ADDR.nishiyige) := CONST.NISHIYIGE
    //val mstatus     =   csr(ADDR.mstatus)     //can't use this. Because csr type is UInt(64.W)
    val mie     =   csr(ADDR.mie)
    val mip     =   csr(ADDR.mip)
    val mtvec   =   csr(ADDR.mtvec)
    val stvec   =   csr(ADDR.stvec)
    val utvec   =   csr(ADDR.utvec)
    val mtval   =   csr(ADDR.mtval)
    val stval   =   csr(ADDR.stval)
    val utval   =   csr(ADDR.utval)
    val mepc    =   csr(ADDR.mepc)
    val sepc    =   csr(ADDR.sepc)
    val uepc    =   csr(ADDR.uepc)
    val mcause  =   csr(ADDR.mcause)
    val scause  =   csr(ADDR.scause) 
    val ucause  =   csr(ADDR.ucause)
    //deleg
    val medeleg =   csr(ADDR.medeleg)
    val sedeleg =   csr(ADDR.sedeleg)
    val mideleg =   csr(ADDR.mideleg)
    val sideleg =   csr(ADDR.sideleg)

    //default setup
    val mstatus  = RegInit(0.U.asTypeOf(new MStatus))
    mie         := "b101010101010".U
    mip         := 0.U
    //xtvec: base62 + mode2
    mtvec       := CONST.TRAP_M << 2        //FIXED
    stvec       := CONST.TRAP_S << 2
    utvec       := CONST.TRAP_U << 2
    //set a bit in deleg reg will send the corrensponding i/e to lower level handler. For example, set medeleg(2) to be 1 will send #2 i/e to S handler
    medeleg     := 0.U
    mideleg     := 0.U
    sedeleg     := 0.U
    sideleg     := 0.U

    val R_ONLY          = csrAddr(11,10).andR   //11 is read only
    val privRequired    = csrAddr(9,8)
    val legalRead       = priv >= privRequired
    val legalWrite      = (!R_ONLY)   | (R_ONLY & io.ID_2_CSR.wdata === 0.U)//determined in ID stage
    //Currently illegal write will set en to be false in ID
    when(io.writeOp.en){    
        csr(csrAddr)    := io.writeOp.data
    }
    //exception or interrupt relevent
    //use nextPriv
    val xtvec = MuxLookup(nextPriv, 0.U, Seq(   //which register to choose
        Priv.M -> mtvec,
        Priv.S -> stvec,
        Priv.U -> utvec
    ))
    val xepc  = MuxLookup(nextPriv, 0.U, Seq(
        Priv.M  -> mepc,
        Priv.S  -> sepc,
        Priv.U  -> uepc,
    ))
    val is_Int      = io.exception.int
    val cause       = io.exception.cause
    val write_cause = Cat(is_Int, 0.U(58.W), io.exception.cause)    //1 + 58 + 5
    val epc         = io.exception.pc
    val xtval       = io.exception.xtval
    val xtvec_mode  = xtvec(0) | xtvec(1)        //1 for vector, 0 for direct. the mode field is 2-bit wide
    val base        = xtvec(63, 2)

    when(io.exception.happen){
        //interrupt, exception. default go to M mode
        when(Cause.isRet(cause)){     //recover from a trap. The behavior of XRet is defined in document, p21
            switch(Cause.RetX(cause)){
                is(Priv.M) {
                    mstatus.MIE  := mstatus.MPIE
                    mstatus.MPIE := true.B
                    mstatus.MPP  := Priv.U
                    nextPriv     := mstatus.MPP
                }
                is(Priv.S) {
                    mstatus.SIE  := mstatus.SPIE
                    mstatus.SPIE := true.B
                    mstatus.SPP  := Priv.U
                    nextPriv     := mstatus.SPP
                }
                is(Priv.U) {
                    mstatus.UIE  := mstatus.MPIE
                    mstatus.UPIE := true.B
                    nextPriv     := Priv.U  //no other posibilities
                }
            }        //elsewhen()
        }.otherwise{
            nextPriv :=  PriorityMux(Seq(
                (!is_Int && !medeleg(cause(4,0)), Priv.M),
                ( is_Int && !mideleg(cause(4,0)), Priv.M),
                (!is_Int && !sedeleg(cause(4,0)), Priv.S),
                ( is_Int && !sideleg(cause(4,0)), Priv.S),
                (true.B,                          Priv.U)
            ))

            switch(nextPriv) {
                is(Priv.M) {
                    mstatus.MPIE := mstatus.MIE
                    mstatus.MIE  := 0.U                         //turn off interrupt before entering handler
                    mstatus.MPP  := priv
                    mepc         := epc
                    mcause       := write_cause
                    mtval        := xtval
                }
                is(Priv.S) {
                    mstatus.SPIE := mstatus.SIE
                    mstatus.SIE  := 0.U
                    mstatus.SPP  := (priv === Priv.S)   //1 bit wide
                    sepc         := epc
                    scause       := write_cause
                    stval        := xtval
                }
                is(Priv.U) {
                    mstatus.UPIE := mstatus.UIE
                    mstatus.UIE  := 0.U
                    uepc         := epc
                    ucause       := write_cause
                    utval        := xtval
                }
            }
        }
    }

    io.CSR_2_ID.xepc        :=  xepc
    io.CSR_2_ID.data        :=  csr(csrAddr)
    io.CSR_2_ID.legalWrite  :=  legalWrite
    io.CSR_2_ID.legalRead   :=  legalRead

    io.CSR_2_IF.xtvec       :=  Mux(is_Int & xtvec_mode, base + cause << 2, base)
    io.CSR_2_IF.priv        :=  priv

    val ie = MuxLookup(priv, false.B, Seq(
        Priv.M  -> mstatus.MIE,
        Priv.S  -> mstatus.SIE,
        Priv.U  -> mstatus.UIE
    ))
    val ei  = false.B       //external interrupt
    val timer_inter = ie & mie(MIE.MTIE) & (mtime >= mtimecmp)


}
//xideg: send trap to be handled by the x-1 mode trap handler
object ADDR{
    //M Info,                       MRO
    val mvendorid = "hF11".U    //Vendor ID. Ientifies the manufacturer of the RISC-V chip.
    val marchid   = "hF12".U    //Architecture ID.
    val mimpid    = "hF13".U    //Implementation ID.
    val mhartid   = "hF14".U    //Hardware thread ID.

    //M Trap Setup,                 MRW
    val mstatus   = "h300".U    //Machine status register. (r/w, only accessible in M mode)
    val misa      = "h301".U    //ISA and extensions
    //setting a bit in medeleg or mideleg will delegate the corresponding trap, when occurring in S-mode or U-mode, to the S-mode trap handler
    val medeleg   = "h302".U    //Machine exception delegation register.
    val mideleg   = "h303".U    //Machine interrupt delegation register.
    val mie       = "h304".U    //Machine interrupt-enable register.
    val mtvec     = "h305".U    //Machine trap-handler base address.
    val mcounteren= "h306".U    //Machine counter enable.
    //M Trap Hangding,              MRW
    val mscratch  = "h340".U    //Scratch register for machine trap handlers. (A temp place)
    val mepc      = "h341".U    //Machine exception program counter. return address
    val mcause    = "h342".U    //Machine trap cause.
    val mtval     = "h343".U    //Machine bad address or instruction.
    val mip       = "h344".U    //Machine interrupt pending.
    val mtinst    = "h34A".U    //Machine trap instruction (transformed).
    val mtval2    = "h34B".U    //Machine bad guest physical address.
    //An interrupt i will be taken if bit i is set in both mip and mie,
    //S Trap Setup,                 SRW
    val sstatus   = "h100".U    
    val sedeleg   = "h102".U
    val sideleg   = "h103".U
    val sie       = "h104".U
    val stvec     = "h105".U
    val scounteren= "h106".U
    //S Trap Hangding,              SRW
    val sscratch  = "h140".U
    val sepc      = "h141".U
    val scause    = "h142".U
    val stval     = "h143".U
    val sip       = "h144".U
    //S Protection and Translation, SRW
    val satp      = "h180".U    //Supervisor address translation and protection.
    //U Trap Setup,                 URW
    val ustatus   = "h000".U
    val uie       = "h004".U
    val utvec     = "h005".U    
    //U Trap Hangding,              URW
    val uscratch  = "h040".U
    val uepc      = "h041".U
    val ucause    = "h042".U
    val utval     = "h043".U
    val uip       = "h044".U

    //User Counter/Timers,          URO
    val time      = "hC01".U    //Timer for RDTIME instruction.
    val cycle     = "hC00".U    //Cycle counter for RDCYCLE instruction.
    //emmmm......
    val mtime     = "h320".U
    val mtimecmp  = "h321".U
    //hahaha
    val nishiyige = "h114".U
}

object MIE{         //index
    val SSIE = 1.U  //software int
    val MSIE = 3.U
    val STIE = 5.U  //timer int
    val MTIE = 7.U
    val SEIE = 9.U  //external int
    val MEIE = 11.U
}

object MIP{         //index. mideleg has same layout as mip
    val SSIP = 1.U  //software int
    val MSIP = 3.U
    val STIP = 5.U  //timer int
    val MTIP = 7.U
    val SEIP = 9.U  //external int
    val MEIP = 11.U
}

object Priv{
    val U = 0.U(2.W)
    val S = 1.U(2.W)    //2 is reserved
    val M = 3.U(2.W)
}

class MStatus extends Bundle {  //M means the machine, not M mode
    val SD      = Bool()        //if FS or XS encode a Dirty State
    val WPRI25  = UInt(25.W)    //Write Preserve & Read Ignore, reserved for future use
    val MBE     = Bool()        //Endianness in non-instruction-fetch memory accesses in M mode. 0 for small endian
    val SBE     = Bool()
    val SXL     = UInt(2.W)     //XLEN in S mode. may be helpful when running 32-bit code in 64-bit mode
    val UXL     = UInt(2.W)     //XLEN in U mode. just be same with the MXL in misa
    val WPRI9   = UInt(9.W)
    val TSR     = Bool()        //Trap SRET
    val TW      = Bool()        //Timeout Wait
    val TVM     = Bool()        //Trap Virtual Memory. protect the satp csr. when TVM = 1, attempts to read or write the satp CSR or execute the SFENCE.VMA instruction while executing in S-mode will raise an illegal instruction exception.
    val MXR     = Bool()        //Make eXecutable Readable. When MXR=0, only loads from pages marked readable (R=1 in Figure 4.17) will succeed
    val SUM     = Bool()        //permit Supervisor to User Memory access
    val MPRV    = Bool()        //memory privilege. When MPRV=1, load and store memory addresses are translated and protected, and endianness is applied, as though the current privilege mode were set to MPP.
    val XS      = UInt(2.W)     //hardwired to 0
    val FS      = UInt(2.W)     //floating point unit's state
/*the fileds above are not implemented...*/
    val MPP     = UInt(2.W)     //P: prior to
    val WPRI2   = UInt(2.W)
    val SPP     = UInt(1.W)
    val MPIE    = Bool()
    val UBE     = Bool()
    val SPIE    = Bool()        //higher level int is always allowed regardless of the ie bit. And lower level ie always disabled
    val UPIE    = Bool()        //not standard, in fact this field is WPRI
    val MIE     = Bool()
    val WPRI1_2 = Bool()
    val SIE     = Bool()
    val UIE     = Bool()        //also WPRI
}

/*
An MRET or SRET instruction is used to return from a trap in M-mode or S-mode respectively.
When executing an xRET instruction, supposing xPP holds the value y, x IE is set to x PIE; the
privilege mode is changed to y; x PIE is set to 1; and x PP is set to U (or M if user-mode is not
supported). If x PP̸ =M, x RET also sets MPRV=0.
*/

//Traps never transition from a more-privileged mode to a less-privileged mode.p30