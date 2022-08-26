import chisel3._
import chisel3.util._

object OptCode {
    //let Alu know what to do
    val ADD  = 0.U(5.W) //default op
    val SUB  = 1.U(5.W)
    val SLT  = 2.U(5.W)
    val SLTU = 3.U(5.W)
    val XOR  = 4.U(5.W)
    val OR   = 5.U(5.W)
    val AND  = 6.U(5.W)
    val SLL  = 7.U(5.W)
    val SRL  = 8.U(5.W)
    val SRA  = 9.U(5.W)

    val JALR = 10.U(5.W)

    val MUL    = 11.U(5.W)
    val MULH   = 12.U(5.W)
    val MULHSU = 13.U(5.W)
    val MULHU  = 14.U(5.W)
//alu don't do division, but EX needs this information so we just encode it here and pass 
    val REMW   = 21.U(5.W)
    val DIVW   = 22.U(5.W)
    val DIVUW  = 23.U(5.W)
    val DIV    = 26.U(5.W)
    val DIVU   = 27.U(5.W)
    val REM    = 28.U(5.W)
    val REMU   = 29.U(5.W)
    val REMUW  = 30.U(5.W)

    //RV64
    val MULW = 15.U(5.W)
    val ADDW = 16.U(5.W)
    val SUBW = 17.U(5.W)
    val SLLW = 18.U(5.W)
    val SRLW = 19.U(5.W)
    val SRAW = 20.U(5.W)

    val LUI     = 24.U(5.W)
    val AUIPC   = 25.U(5.W)

    //not alu's job, funct3
    //used in ID to specify a inst
    val BEQ  = 0.U(3.W)
    val BNE  = 1.U(3.W)
    val BLT  = 4.U(3.W)
    val BGE  = 5.U(3.W)
    val BLTU = 6.U(3.W)
    val BGEU = 7.U(3.W)

    val LB   = 0.U(3.W)
    val LH   = 1.U(3.W)
    val LW   = 2.U(3.W)
    val LD   = 3.U(3.W)
    val LBU  = 4.U(3.W)
    val LHU  = 5.U(3.W)
    val LWU  = 6.U(3.W)

    val SB   = 0.U(3.W)
    val SH   = 1.U(3.W)
    val SW   = 2.U(3.W)
    val SD   = 3.U(3.W)
}

object CSRMODE {
    val NOP = 0.U(3.W)
    val RW  = 1.U(3.W)  //only these 3 types. others are all psedo insts
    val RS  = 2.U(3.W)
    val RC  = 3.U(3.W)
}

object CONST {
    val PC_INIT = "h400".U(64.W)

    val TRAP_M  = "h000".U(64.W)
    val TRAP_S  = "h100".U(64.W)
    val TRAP_U  = "h200".U(64.W)

    val MVENDORID   = "h114514".U
    val MARCHID     = "h1919810".U
    val NISHIYIGE   = "h1145141919810".U
    val MIMPID      = "h2333".U

    val RV_HOME     = "/home/s081/Downloads/chisel-template/src/main/scala/RV64IM/"
}

object SYS_INST {   //inst(21, 20)
    val XRet    = "b10".U(2.W)   
    val ecall   = "b00".U(2.W)   
    val ebreak  = "b01".U(2.W)   
}

object InstType {
    // R,I,S,B,U,J
    val BAD = 0.U(4.W)
    val R = 1.U(4.W)
    val I = 2.U(4.W)
    val S = 3.U(4.W)
    val B = 4.U(4.W)
    val U = 5.U(4.W)
    val J = 6.U(4.W)

    val SYS = 7.U(4.W) // CSR or ECALL
    val FENCE = 8.U(4.W)
}

object Insts { // idea from mini riscv
//  // Loads
    def LB     = BitPat("b?????????????????000?????0000011")
    def LH     = BitPat("b?????????????????001?????0000011")
    def LW     = BitPat("b?????????????????010?????0000011")
    def LBU    = BitPat("b?????????????????100?????0000011")
    def LHU    = BitPat("b?????????????????101?????0000011")
//  // Stores
    def SB     = BitPat("b?????????????????000?????0100011")
    def SH     = BitPat("b?????????????????001?????0100011")
    def SW     = BitPat("b?????????????????010?????0100011")
//  // Shifts
    def SLL    = BitPat("b0000000??????????001?????0110011")
    def SLLI   = BitPat("b0000000??????????001?????0010011")
    def SRL    = BitPat("b0000000??????????101?????0110011")
    def SRLI   = BitPat("b0000000??????????101?????0010011")
    def SRA    = BitPat("b0100000??????????101?????0110011")
    def SRAI   = BitPat("b0100000??????????101?????0010011")
//  // Arithmetic
    def ADD    = BitPat("b0000000??????????000?????0110011")
    def ADDI   = BitPat("b?????????????????000?????0010011")
    def SUB    = BitPat("b0100000??????????000?????0110011")
    def LUI    = BitPat("b?????????????????????????0110111")
    def AUIPC  = BitPat("b?????????????????????????0010111")
//  // Logical
    def XOR    = BitPat("b0000000??????????100?????0110011")
    def XORI   = BitPat("b?????????????????100?????0010011")
    def OR     = BitPat("b0000000??????????110?????0110011")
    def ORI    = BitPat("b?????????????????110?????0010011")
    def AND    = BitPat("b0000000??????????111?????0110011")
    def ANDI   = BitPat("b?????????????????111?????0010011")
//  // Compare
    def SLT    = BitPat("b0000000??????????010?????0110011")
    def SLTI   = BitPat("b?????????????????010?????0010011")
    def SLTU   = BitPat("b0000000??????????011?????0110011")
    def SLTIU  = BitPat("b?????????????????011?????0010011")
//  // Branches
    def BEQ    = BitPat("b?????????????????000?????1100011")
    def BNE    = BitPat("b?????????????????001?????1100011")
    def BLT    = BitPat("b?????????????????100?????1100011")
    def BGE    = BitPat("b?????????????????101?????1100011")
    def BLTU   = BitPat("b?????????????????110?????1100011")
    def BGEU   = BitPat("b?????????????????111?????1100011")
//  // Jump & Link
    def JAL    = BitPat("b?????????????????????????1101111")
    def JALR   = BitPat("b?????????????????000?????1100111")
//  SYS
    def SYS    = BitPat("b?????????????????????????1110011")
// FENCE
/*
    def FENCE  = BitPat("b0000????????00000000000000001111")
    def FENCE_I= BitPat("b00000000000000000001000000001111")
*/
// M-extension
    def MUL    = BitPat("b0000001??????????000?????0110011")
    def MULH   = BitPat("b0000001??????????001?????0110011")
    def MULHSU = BitPat("b0000001??????????010?????0110011")
    def MULHU  = BitPat("b0000001??????????011?????0110011")
    def DIV    = BitPat("b0000001??????????100?????0110011")
    def DIVU   = BitPat("b0000001??????????101?????0110011")
    def REM    = BitPat("b0000001??????????110?????0110011")
    def REMU   = BitPat("b0000001??????????111?????0110011")

//RV64I
    def ADDW   = BitPat("b0000000??????????000?????0111011")
    def SUBW   = BitPat("b0100000??????????000?????0111011")
    def SLLW   = BitPat("b0000000??????????001?????0111011")
    def SRLW   = BitPat("b0000000??????????101?????0111011")
    def SRAW   = BitPat("b0100000??????????101?????0111011")
    def LWU    = BitPat("b?????????????????110?????0000011")
    def LD     = BitPat("b?????????????????011?????0000011")
    def SD     = BitPat("b?????????????????011?????0100011")

    def ADDIW  = BitPat("b?????????????????000?????0011011")
    def SLLIW  = BitPat("b0000000??????????001?????0011011")
    def SRLIW  = BitPat("b0000000??????????101?????0011011")
    def SRAIW  = BitPat("b0100000??????????101?????0011011")
//RV64M
    def MULW   = BitPat("b0000001??????????000?????0111011")
    def DIVW   = BitPat("b0000001??????????100?????0111011")
    def DIVUW  = BitPat("b0000001??????????101?????0111011")
    def REMW   = BitPat("b0000001??????????110?????0111011")
    def REMUW  = BitPat("b0000001??????????111?????0111011")
}

object DecTable {
  // default decode signals
    val defaultDec  =   List(InstType.BAD, OptCode.ADD)

    val decMap = Array(     //type         option
        Insts.ADD     ->  List(InstType.R, OptCode.ADD),
        Insts.SUB     ->  List(InstType.R, OptCode.SUB),
        Insts.SLL     ->  List(InstType.R, OptCode.SLL),
        Insts.SLT     ->  List(InstType.R, OptCode.SLT),
        Insts.SLTU    ->  List(InstType.R, OptCode.SLTU),
        Insts.XOR     ->  List(InstType.R, OptCode.XOR),
        Insts.SRL     ->  List(InstType.R, OptCode.SRL),
        Insts.SRA     ->  List(InstType.R, OptCode.SRA),
        Insts.OR      ->  List(InstType.R, OptCode.OR),
        Insts.AND     ->  List(InstType.R, OptCode.AND),

        Insts.ADDI    ->  List(InstType.I, OptCode.ADD),
        Insts.SLTI    ->  List(InstType.I, OptCode.SLT),
        Insts.SLTIU   ->  List(InstType.I, OptCode.SLTU),
        Insts.XORI    ->  List(InstType.I, OptCode.XOR),
        Insts.ORI     ->  List(InstType.I, OptCode.OR),
        Insts.ANDI    ->  List(InstType.I, OptCode.AND),
        Insts.SLLI    ->  List(InstType.I, OptCode.SLL),
        Insts.SRLI    ->  List(InstType.I, OptCode.SRL),
        Insts.SRAI    ->  List(InstType.I, OptCode.SRA),

        Insts.LB      ->  List(InstType.I, OptCode.ADD),
        Insts.LH      ->  List(InstType.I, OptCode.ADD),
        Insts.LW      ->  List(InstType.I, OptCode.ADD),
        Insts.LBU     ->  List(InstType.I, OptCode.ADD),
        Insts.LHU     ->  List(InstType.I, OptCode.ADD),

        Insts.SB      ->  List(InstType.S, OptCode.ADD),
        Insts.SH      ->  List(InstType.S, OptCode.ADD),
        Insts.SW      ->  List(InstType.S, OptCode.ADD),

        Insts.MUL     ->  List(InstType.R, OptCode.MUL),
        Insts.MULH    ->  List(InstType.R, OptCode.MULH),
        Insts.MULHSU  ->  List(InstType.R, OptCode.MULHSU),
        Insts.DIV     ->  List(InstType.R, OptCode.DIV),    //not alu's job
        Insts.DIVU    ->  List(InstType.R, OptCode.DIVU),
        Insts.REM     ->  List(InstType.R, OptCode.REM),
        Insts.REMU    ->  List(InstType.R, OptCode.REMU),

        //ex satge don't need its information, so opcode is not needed indeed. but 
        //maybe we could apply them to other usages?
        Insts.BEQ     ->  List(InstType.B, OptCode.BEQ),
        Insts.BNE     ->  List(InstType.B, OptCode.BNE),
        Insts.BLT     ->  List(InstType.B, OptCode.BLT),
        Insts.BGE     ->  List(InstType.B, OptCode.BGE),
        Insts.BLTU    ->  List(InstType.B, OptCode.BLTU),
        Insts.BGEU    ->  List(InstType.B, OptCode.BGEU),

        Insts.JAL     ->  List(InstType.J, OptCode.ADD),
        Insts.JALR    ->  List(InstType.I, OptCode.JALR),

        Insts.LUI     ->  List(InstType.U, OptCode.LUI),
        Insts.AUIPC   ->  List(InstType.U, OptCode.AUIPC),

        Insts.SYS     ->  List(InstType.SYS, OptCode.ADD), //ecall, csr, ebreak
//RV64I
        Insts.ADDIW   ->  List(InstType.I, OptCode.ADDW),
        Insts.SLLIW   ->  List(InstType.I, OptCode.SLLW),
        Insts.SRLIW   ->  List(InstType.I, OptCode.SRLW),
        Insts.SRAIW   ->  List(InstType.I, OptCode.SRAW),
        Insts.ADDW    ->  List(InstType.R, OptCode.ADDW),
        Insts.SUBW    ->  List(InstType.R, OptCode.SUBW),
        Insts.SLLW    ->  List(InstType.R, OptCode.SLLW),
        Insts.SRLW    ->  List(InstType.R, OptCode.SRLW),
        Insts.SRAW    ->  List(InstType.R, OptCode.SRAW),
        Insts.LWU     ->  List(InstType.I, OptCode.ADD),
        Insts.LD      ->  List(InstType.I, OptCode.ADD),
        Insts.SD      ->  List(InstType.S, OptCode.ADD),
//RV64M
        Insts.MULW    ->  List(InstType.R, OptCode.MUL),
        Insts.DIVW    ->  List(InstType.R, OptCode.ADD),
        Insts.DIVUW   ->  List(InstType.R, OptCode.ADD),
        Insts.REMW    ->  List(InstType.R, OptCode.ADD),
        Insts.REMUW   ->  List(InstType.R, OptCode.ADD),
/*
        Insts.FENCE   ->  List(InstType.FENCE, OptCode.ADD),
        Insts.FENCE_I ->  List(InstType.FENCE, OptCode.ADD),
*/

    )
    // fields, list index
    val TYPE = 0
    val OPT = 1
}

object Cause{
//int. software, timer, external
    val USI = 0.U
    val SSI = 1.U
    val MSI = 3.U
    val UTI = 4.U
    val STI = 5.U
    val MTI = 7.U
    val UEI = 8.U
    val SEI = 9.U
    val MEI = 11.U
//exception
    val InstAddrMisaligned  = 0.U       //IF
    val InstAccessFault     = 1.U       //IF?
    val IllegalInst         = 2.U       //ID?
    val BreakPoint          = 3.U       //ebreak
    val LoadAddrMisaligned  = 4.U       //MEM
    val LoadAccessFault     = 5.U
    val StoreAddrMisaligned = 6.U
    val StoreAccessFailed   = 7.U       
    val EcallFromUMode      = 8.U       //ID
    val EcallFromSMode      = 9.U
    val EcallFromMMode      = 11.U
    val InstPageFault       = 12.U      //IF
    val LoadPageFault       = 13.U
    val StorePageFault      = 15.U
    //not standards
    val URet                = 16.U
    val SRet                = 17.U
    val MRet                = 19.U

    def XRet(priv: UInt)  = 16.U | priv(1, 0)
    def RetX(cause: UInt) = cause(1, 0)     //0 -> U, 1 -> S, 3 -> M
}