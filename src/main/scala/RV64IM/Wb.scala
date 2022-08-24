import chisel3._
//write back to the regfile
//precise interrupt. In the previous stages we just gather the excep info and don't react to it.
//this makes exception be processed in order(early comes early handled)
//exception: write some CSRs and change PC to xtvec
class Wb extends RawModule{
    val io = IO(new Bundle{
        val writeRfOp_i     = Input(new writeRfOp)
        val writeCSROp_i    = Input(new writeCSROp)
        val exception_i     = Input(new exception)

        val writeRfOp_o     = Output(new writeRfOp)
        val writeCSROp_o    = Output(new writeCSROp)
        val exception_o     = Output(new exception)

        val rf_fwd          = Output(new rf_fwd)
        val csr_fwd         = Output(new csr_fwd)

        val if_excep        = Output(new IF_excep)
    })
//write back
    io.writeRfOp_o  := io.writeRfOp_i
    io.writeCSROp_o := io.writeCSROp_i
//fwd
    io.rf_fwd       := io.writeRfOp_i
    io.csr_fwd      := io.writeCSROp_i

    io.exception_o  := io.exception_i
    io.if_excep     := io.exception_i      //happen and new pc
}