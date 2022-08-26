import org.scalatest._
import Arith._
import chisel3._
import chisel3.iotesters._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class Top extends Module{
    val io = IO(new Bundle{
        //debug
        val o1 = Output(UInt(64.W))
        val o2 = Output(UInt(32.W))
        val o3 = Output(UInt(64.W))
        val o4 = Output(UInt(64.W))
    })

    val IF          = Module(new If())
    val CSR         = Module(new CSR())
    val REGFILE     = Module(new Regfile())
    val IF_ID       = Module(new If_Id())
    val ID          = Module(new Id())
    val ID_EX       = Module(new Id_Ex())
    val EX          = Module(new Ex())
    val EX_MEM      = Module(new Ex_Mem())
    val MEM         = Module(new MEM())
    val MEM_WB      = Module(new Mem_Wb())
    val WB          = Module(new Wb())
    val CTRL        = Module(new Ctrl())
    val DIV         = Module(new Div())

    IF.io.stall         := CTRL.io.stall(0)
    IF_ID.io.stall      := CTRL.io.stall(1)
    ID_EX.io.stall      := CTRL.io.stall(2)
    EX_MEM.io.stall     := CTRL.io.stall(3)
    MEM_WB.io.stall     := CTRL.io.stall(4)

    //IF.io.flush         := CTRL.io.flush(0)
    IF_ID.io.flush      := CTRL.io.flush(1)
    ID_EX.io.flush      := CTRL.io.flush(2)
    EX_MEM.io.flush     := CTRL.io.flush(3)
    MEM_WB.io.flush     := CTRL.io.flush(4)

    IF.io.branchOp      := ID.io.decInfo.branchOp
    IF.io.excep         := WB.io.if_excep
    IF.io.fromCSR       := CSR.io.CSR_2_IF
/*pipeline registers------------------------------------------------------------------------------------------------------*/
    IF_ID.io.inst_i     := IF.io.inst_o
    IF_ID.io.exception_i:= IF.io.exception

    ID.io.inst_i        := IF_ID.io.inst_o
    ID.io.exception_i   := IF_ID.io.exception_o
    //read after load
    ID.io.prev_rd       := ID_EX.io.decInfo_o.rd
    ID.io.prev_is_load  := ID_EX.io.decInfo_o.loadOp.isLoad
//ID & REGFILE
    REGFILE.io.id2Rf        <>  ID.io.id2Rf
    ID.io.rf2Id             <>  REGFILE.io.rf2Id
//ID & CSR
    CSR.io.ID_2_CSR         <>  ID.io.ID_2_CSR
    ID.io.CSR_2_ID          <>  CSR.io.CSR_2_ID

    ID_EX.io.decInfo_i      <>  ID.io.decInfo
    ID_EX.io.exception_i    <>  ID.io.exception_o

    EX.io.decInfo           <>  ID_EX.io.decInfo_o
    EX.io.exception_i       <>  ID_EX.io.exception_o

    EX_MEM.io.storeOp_i     <>  EX.io.storeOp
    EX_MEM.io.writeRfOp_i   <>  EX.io.writeRfOp
    EX_MEM.io.loadOp_i      <>  EX.io.loadOp
    EX_MEM.io.writeCSROp_i  <>  EX.io.writeCSROp
    EX_MEM.io.exception_i   <>  EX.io.exception_o

    MEM.io.loadOp           <>  EX_MEM.io.loadOp_o
    MEM.io.storeOp          <>  EX_MEM.io.storeOp_o
    MEM.io.writeRfOp_i      <>  EX_MEM.io.writeRfOp_o
    MEM.io.writeCSROp_i     <>  EX_MEM.io.writeCSROp_o
    MEM.io.exception_i      <>  EX_MEM.io.exception_o

    MEM_WB.io.writeRfOp_i   <>  MEM.io.writeRfOp_o
    MEM_WB.io.writeCSROp_i  <>  MEM.io.writeCSROp_o
    MEM_WB.io.exception_i   <>  MEM.io.exception_o

    WB.io.writeRfOp_i       <>  MEM_WB.io.writeRfOp_o
    WB.io.writeCSROp_i      <>  MEM_WB.io.writeCSROp_o
    WB.io.exception_i       <>  MEM_WB.io.exception_o
/*------------------------------------------------------------------------------------------------------*/
//write back
    REGFILE.io.writeRfOp    <>  WB.io.writeRfOp_o
    CSR.io.writeOp          <>  WB.io.writeCSROp_o
    CSR.io.exception        <>  WB.io.exception_o
//forwarding
    ID.io.fwd.rf.wb      <> WB.io.rf_fwd
    ID.io.fwd.rf.mem     <> MEM.io.rf_fwd
    ID.io.fwd.rf.ex      <> EX.io.rf_fwd
    ID.io.fwd.csr.wb     <> WB.io.csr_fwd
    ID.io.fwd.csr.mem    <> MEM.io.csr_fwd
    ID.io.fwd.csr.ex     <> EX.io.csr_fwd
//control
    CTRL.io.id_stall_req    := ID.io.stall_req
    CTRL.io.ex_stall_req    := EX.io.stall_req
    CTRL.io.id_flush_req    := ID.io.flush_req

    CTRL.io.excep           := WB.io.exception_o.happen

//DIV, temporarily put it outside the ex as an individual module
    DIV.io.a      := EX.io.divOP.a
    DIV.io.b      := EX.io.divOP.b
    //DIV.io.sign   := EX.io.divOP.sign
    DIV.io.start  := EX.io.divOP.start

    EX.io.divRes.quo    := DIV.io.quo
    EX.io.divRes.rem    := DIV.io.rem
    EX.io.divRes.finish := DIV.io.finish
    EX.io.divRes.err    := DIV.io.div_err

//avoid dead-code-elimination and debug
io.o1 := WB.io.writeRfOp_o.data
io.o2 := WB.io.writeCSROp_o.data
io.o3 := 0.U
io.o4 := 0.U

}