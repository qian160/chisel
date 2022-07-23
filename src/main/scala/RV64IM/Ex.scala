package RV64
import chisel3._
import chisel3.util._
import OptCode._

class Ex extends RawModule{
    val io = IO(new Bundle{
        val decInfo        = Input(new decInfo())

        val exForwarding   = Output(new Forwarding)
        val writeRfOp      = Output(new writeRfOp)
        val loadOp         = Output(new loadOp)
        val storeOp        = Output(new storeOp)
    })

    val oprand1 =  io.decInfo.oprand1
    val oprand2 =  io.decInfo.oprand2
    io.storeOp  := io.decInfo.storeOp
    io.loadOp   := io.decInfo.loadOp
    //ALU'S job, always produce one result
    val aluRes = MuxLookup(io.decInfo.aluop, oprand1 + oprand2, Seq(
        ADD  -> (oprand1 + oprand2),
        SUB  -> (oprand1 - oprand2),
        SLT  -> Mux(oprand1.asSInt < oprand2.asSInt, 1.U, 0.U),
        SLTU -> Mux(oprand1 < oprand2, 1.U, 0.U),
        XOR  -> (oprand1 ^ oprand2),
        OR   -> (oprand1 | oprand2),
        AND  -> (oprand1 & oprand2),
        SLL  -> (oprand1 << oprand2(4,0)),    //shift left don't cause extension problems
        SRL  -> (oprand1 >> oprand2(4,0)),
        SRA  -> (oprand1.asSInt >> oprand2(4,0)).asUInt,

        //the rest are about calculating the address, and the default opt is add. so not necessary to list them here
        )
    )

    io.writeRfOp    := 0.U.asTypeOf(new writeRfOp)    
    //use InstType instead. Load is also I-type, but just assign aluRes to it and midify it in mem
    switch(io.decInfo.InstType){
        is(InstType.R) {
            io.writeRfOp.data  := aluRes
            io.writeRfOp.en    := true.B
            io.writeRfOp.addr  := io.decInfo.rd
        }
        is(InstType.I){     
            //we assign aluRes to load, it seems unreasonable, but this will be modified in mem stage
            //for I-type arith insts, aluRes is exactly the result, but for load it's the load address
            io.writeRfOp.data  := aluRes        //
            io.writeRfOp.en    := true.B
            io.writeRfOp.addr  := io.decInfo.rd
            io.loadOp.addr     := aluRes
        }
        is(InstType.S){
            io.storeOp.addr    := aluRes
            //Width, en and data have already be confirmed in id stage
        }

    }
    //disable bypass when load, because it's just an address and not a reg-oprand
    io.exForwarding.data   := aluRes        //address?
    io.exForwarding.addr   := Mux(io.decInfo.loadOp.isLoad, 0.U, io.decInfo.rd) 
}