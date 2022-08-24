import chisel3._
import chisel3.util._
//when a pipeline register is given a stall or flush, then in the *next* coming clock cycle,
//for example, when IF/ID is given a flush, then in the next cycle it will output 0. Since ID gets input from it, so ID will do nothing in that cycle
//manage all the {stall, flush} signals
//When stage x reports a flush or stall, all the registers before x need to be flushed or stalled, indicating that x won't receive things in the next cycle
class Ctrl extends RawModule{
    val io = IO(new Bundle{
        val excep          = Input(Bool())     //this changes PC, so flush is needed
        val id_stall_req   = Input(Bool())     //read after load 
        val id_flush_req   = Input(Bool())     //Branch
        val ex_stall_req   = Input(Bool())     //division
        //may add more requests in the future
        val stall          = Output(Bits(5.W))
        val flush          = Output(Bits(5.W))
        //IF  IF/ID  ID/EX  EX/MEM  MEM/WB
    })
    io.stall    := 0.U
    io.flush    := 0.U

    when(io.id_stall_req){        //read after load
        io.stall    :=  "b00011".U
    }
    when(io.ex_stall_req){
        io.stall    :=  "b00111".U
    }
    when(io.id_flush_req){        //branch or jump
        io.flush    :=  "b00011".U
        //jump still needs ID_EX's information to write rf, so dont flush id/ex
        //and B-Type inst will set writeRfop = 0, so no bad even though we dont flush ID/EX it won't produce bad effects
    }
    when(io.excep){               //need to modify PC,
        io.flush    :=  "b11111".U
    }
}