import chisel3._
import chisel3.util._
//2-way set associative cache. Size = 4 KB/group * 2 group = 8KB(only data included)
/*      63__________________12_11_________4_3______________0
        |       tag           |   group   |   offset      |   Addr: 64-bit
    
*/
class ICache_Entry extends Bundle{
    val tag     = Bits(52.W)        //too many bits for tag?
    val inst    = Bits(32.W)
    val valid   = Bool()
}
/*
class ICache_Line extends Bundle{
    val CacheLine   = VecInit(16, new ICache_Entry)
}

class ICache_Set extends Bundle{
    val set     = VecInit(256, new ICache_Line)     //4KB per set(group), and 16B per line. So #entries = 4KB / 16B = 256
}*/
//need to connect with IF to update the cache
class InstCache extends Module{
    val io = IO(new Bundle{
        val pc      = Input(Bits(64.W))
        val inst    = Output(Bits(32.W))
    })
    //val ICache  = Mem(32, new ICache_Entry)
}