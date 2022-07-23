package RV64

import chisel3._
import chisel3.util._
//flush should not also give out 0, but also reset the internal registers or it will still give information in the next cycle
class If_Id extends Module{
    val io = IO(new Bundle{
        val stall       = Input(Bool())
        val reset       = Input(Bool())
        val flush       = Input(Bool())
        val pc_i        = Input(Bits(64.W))
        val inst_i      = Input (Bits(32.W))

        val pc_o        = Output(Bits(64.W))
        val inst_o      = Output(Bits(32.W))
    })

    val inst = RegNext(io.inst_i)
    val pc   = RegNext(io.pc_i)

    when(io.reset | io.flush){
        inst    := 0.U
        pc      := 0.U
    }.elsewhen(io.stall){
        inst    := inst
        pc      := pc
    }
    io.inst_o := inst
    io.pc_o   := pc

}

class Id_Ex extends Module{
    val io = IO(new Bundle{
        val stall           = Input(Bool())
        val flush           = Input(Bool())
        val reset           = Input(Bool())
        val prev_is_load_i  = Input(Bool())
        val decInfo_i       = Input(new decInfo())

        val decInfo_o       = Output(new decInfo)
        val prev_is_load_o  = Output(Bool())
        val load_dest_o     = Output(Bits(5.W))
    })

    val decInfo       = RegNext(io.decInfo_i)
    val prev_is_load  = RegNext(io.prev_is_load_i)
    val load_dest     = RegNext(io.decInfo_i.loadOp.dest)

    when(io.reset | io.flush){
        decInfo        := 0.U.asTypeOf(new decInfo)
        prev_is_load   := false.B
        load_dest      := 0.U
    }.elsewhen(io.stall){
        decInfo        := decInfo
        prev_is_load   := prev_is_load
        load_dest      := load_dest
    }     
    io.decInfo_o       := decInfo
    io.prev_is_load_o  := prev_is_load
    io.load_dest_o     := load_dest

}

class Ex_Mem extends Module{
    val io = IO(new Bundle{
        val stall         = Input(Bool())
        val flush         = Input(Bool())
        val reset         = Input(Bool())
        val loadOp_i      = Input(new loadOp)
        val storeOp_i     = Input(new storeOp)
        val writeRfOp_i   = Input(new writeRfOp)

        val loadOp_o      = Output(new loadOp)
        val storeOp_o     = Output(new storeOp)
        val writeRfOp_o   = Output(new writeRfOp)
    })

    val writeRfOp      = RegNext(io.writeRfOp_i)
    val loadOp         = RegNext(io.loadOp_i)
    val storeOp        = RegNext(io.storeOp_i)

    when(io.reset | io.flush){
        writeRfOp    := 0.U.asTypeOf(new writeRfOp)
        loadOp       := 0.U.asTypeOf(new loadOp)
        storeOp      := 0.U.asTypeOf(new storeOp)
    }.elsewhen(io.stall){
        writeRfOp     := writeRfOp
        loadOp        := loadOp
        storeOp       := storeOp
    }
    io.writeRfOp_o    := writeRfOp
    io.loadOp_o       := loadOp
    io.storeOp_o      := storeOp
}

class Mem_Wb extends Module{
    val io = IO(new Bundle{
        val stall       = Input(Bool())
        val flush       = Input(Bool())
        val reset       = Input(Bool())
        val writeRfOp_i = Input(new writeRfOp)

        val writeRfOp_o = Output(new writeRfOp)
    })

    val writeRfOp   = RegNext(io.writeRfOp_i)
    when(io.reset | io.flush){
        writeRfOp   := 0.U.asTypeOf(new writeRfOp)
    }.elsewhen(io.stall){
        //writeRfOp  := 0.U.asTypeOf(new writeRfOp)
        writeRfOp   := writeRfOp
    }
    io.writeRfOp_o  := writeRfOp
}