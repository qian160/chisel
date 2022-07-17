package RV64

import chisel3._
import chisel3.util._

class If_Id extends Module{
    val io = IO(new Bundle{
        val stall       = Input(Bool())
        val reset       = Input(Bool())
        val if_inst_i   = Input (Bits(32.W))
        val if_inst_o   = Output(Bits(32.W))
    })

    val inst = RegInit(0.U(32.W))

    when(io.reset){
        io.if_inst_o := 0.U
    }.elsewhen(io.stall){
        inst    :=  inst
    }.otherwise{
        //update registers
        inst    :=  io.if_inst_i
    }
    io.if_inst_o := inst

}

class Id_Ex extends Module{
    val io = IO(new Bundle{
        val stall           = Input(Bool())
        val reset           = Input(Bool())
        val exInfo_i        = Input(new exInfo())
        val exInfo_o        = Output(new exInfo)
    })

    val exInfo  = RegInit(0.U.asTypeOf(new exInfo))

    when(io.reset){
        io.exInfo_o    := 0.U.asTypeOf(new exInfo)
    }.elsewhen(io.stall){
        exInfo  := exInfo   //keep old value, dont update
    }.otherwise{
        exInfo  :=  io.exInfo_i
    }        
    io.exInfo_o    :=   exInfo

}

class Ex_Mem extends Module{
    val io = IO(new Bundle{
        val stall         = Input(Bool())
        val reset         = Input(Bool())
        val loadOp_i      = Input(new loadOp)
        val storeOp_i     = Input(new storeOp)
        val writeRfOp_i   = Input(new writeRfOp)

        val loadOp_o      = Output(new loadOp)
        val storeOp_o     = Output(new storeOp)
        val writeRfOp_o   = Output(new writeRfOp)
    })

    val writeRfOp      = RegInit(0.U.asTypeOf(new writeRfOp))
    val loadOp         = RegInit(0.U.asTypeOf(new loadOp))
    val storeOp        = RegInit(0.U.asTypeOf(new storeOp))

    when(io.reset){
        io.writeRfOp_o    := 0.U.asTypeOf(new writeRfOp)
        io.loadOp_o       := 0.U.asTypeOf(new loadOp)
        io.storeOp_o      := 0.U.asTypeOf(new storeOp)
    }.elsewhen(io.stall){
        writeRfOp   := writeRfOp
        loadOp      := loadOp
        storeOp     := storeOp
    }.otherwise{
        //update registers
        writeRfOp   := io.writeRfOp_i
        loadOp      := io.loadOp_i
        storeOp     := io.storeOp_i
    }   
    io.writeRfOp_o    := writeRfOp
    io.loadOp_o       := loadOp
    io.storeOp_o      := storeOp
}

class Mem_Wb extends Module{
    val io = IO(new Bundle{
        val stall       = Input(Bool())
        val reset       = Input(Bool())
        val writeRfOp_i = Input(new writeRfOp)

        val writeRfOp_o = Output(new writeRfOp)
    })

    val writeRfOp   = RegInit(0.U.asTypeOf(new writeRfOp))
    when(io.reset){
        io.writeRfOp_o  := 0.U.asTypeOf(new writeRfOp)
    }.elsewhen(io.stall){
        writeRfOp   :=  writeRfOp
    }.otherwise{
        writeRfOp       := io.writeRfOp_i
    }
    io.writeRfOp_o  := writeRfOp
}