import chisel3._
import chisel3.util._
//2-way set associative cache. Size = 4 KB/group * 2 group = 8KB(only data included)
/*      63__________________12_11_________4_3______________0
        |       tag           |   group   |   offset      |   Addr: 64-bit
    
*/

object CahceOP{
    val NOP     = 0.U
    val INSERT  = 1.U
    val SEARCH  = 2.U
    val DELETE  = 3.U
}

class ICache_Entry extends Bundle{
    val tag     = Bits(52.W)        //too many bits for tag?
    val inst    = Bits(32.W)
    val valid   = Bool()
}

//need to connect with IF to update the cache
class InstCache extends Module{
    val io = IO(new Bundle{
        val pc      = Input(Bits(64.W))
        val inst    = Output(Bits(32.W))
    })
    //val ICache  = Mem(32, new ICache_Entry)
}