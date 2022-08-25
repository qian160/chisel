import chisel3._
import chisel3.util._
//flush should not also give out 0, but also reset the internal registers or it will still give information in the next cycle
class If_Id extends Module{
    val io = IO(new Bundle{
        val stall       = Input(Bool())
        val flush       = Input(Bool())
        val exception_i = Input(new exception)
        val inst_i      = Input (Bits(32.W))
        //pc is wrapped in exception
        val inst_o      = Output(Bits(32.W))
        val exception_o = Output(new exception)
    })

    val inst        = RegNext(io.inst_i)
    val exception   = RegNext(io.exception_i)

    when(reset.asBool | io.flush){
        inst        := 0.U
        exception   := 0.U.asTypeOf(new exception)
    }.elsewhen(io.stall){
        inst        := inst
        exception   := exception
    }
    io.inst_o       := inst
    io.exception_o  := exception

}

class Id_Ex extends Module{
    val io = IO(new Bundle{
        val stall           = Input(Bool())
        val flush           = Input(Bool())
        val decInfo_i       = Input(new decInfo())
        val exception_i     = Input(new exception)

        val decInfo_o       = Output(new decInfo)
        val exception_o     = Output(new exception)
    })

    val decInfo       = RegNext(io.decInfo_i)
    val exception     = RegNext(io.exception_i)
    when(reset.asBool | io.flush){
        decInfo        := 0.U.asTypeOf(new decInfo)
        exception      := 0.U.asTypeOf(new exception)
    }.elsewhen(io.stall){
        decInfo        := decInfo
        exception      := exception
    }     
    io.decInfo_o       := decInfo
    io.exception_o     := exception
}

class Ex_Mem extends Module{
    val io = IO(new Bundle{
        val stall         = Input(Bool())
        val flush         = Input(Bool())

        val loadOp_i      = Input(new loadOp)
        val storeOp_i     = Input(new storeOp)
        val writeRfOp_i   = Input(new writeRfOp)
        val writeCSROp_i  = Input(new writeCSROp)
        val exception_i   = Input(new exception)

        val loadOp_o      = Output(new loadOp)
        val storeOp_o     = Output(new storeOp)
        val writeRfOp_o   = Output(new writeRfOp)
        val writeCSROp_o  = Output(new writeCSROp)
        val exception_o   = Output(new exception)
    })

    val writeRfOp      = RegNext(io.writeRfOp_i)
    val loadOp         = RegNext(io.loadOp_i)
    val storeOp        = RegNext(io.storeOp_i)
    val writeCSROp     = RegNext(io.writeCSROp_i)
    val exception      = RegNext(io.exception_i)

    when(reset.asBool | io.flush){
        writeRfOp    := 0.U.asTypeOf(new writeRfOp)
        loadOp       := 0.U.asTypeOf(new loadOp)
        storeOp      := 0.U.asTypeOf(new storeOp)
        writeCSROp   := 0.U.asTypeOf(new writeCSROp)
        exception    := 0.U.asTypeOf(new exception)
    }.elsewhen(io.stall){
        writeRfOp     := writeRfOp
        loadOp        := loadOp
        storeOp       := storeOp
        writeCSROp    := writeCSROp
        exception    :=  exception
    }
    io.writeRfOp_o    := writeRfOp
    io.loadOp_o       := loadOp
    io.storeOp_o      := storeOp
    io.writeCSROp_o   := writeCSROp
    io.exception_o    := exception
}

class Mem_Wb extends Module{
    val io = IO(new Bundle{
        val stall        = Input(Bool())
        val flush        = Input(Bool())
        val writeRfOp_i  = Input(new writeRfOp)
        val writeCSROp_i = Input(new writeCSROp)
        val exception_i  = Input(new exception)

        val writeRfOp_o  = Output(new writeRfOp)
        val writeCSROp_o = Output(new writeCSROp)
        val exception_o  = Output(new exception)
    })

    val writeRfOp   = RegNext(io.writeRfOp_i)
    val writeCSROp  = RegNext(io.writeCSROp_i)
    val exception   = RegNext(io.exception_i)

    when(reset.asBool | io.flush){
        writeRfOp   := 0.U.asTypeOf(new writeRfOp)
        writeCSROp  := 0.U.asTypeOf(new writeCSROp)
        exception   := 0.U.asTypeOf(new exception)
    }.elsewhen(io.stall){
        writeRfOp   := writeRfOp
        writeCSROp  := writeCSROp
        exception   := exception
    }
    io.writeRfOp_o  := writeRfOp
    io.writeCSROp_o := writeCSROp
    io.exception_o  := exception
}