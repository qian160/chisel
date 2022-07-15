package Wallace

import chisel3._
import chisel3.util._
/*  difference between signed and unsigned multiplication:
        zero extension vs sign extension

    the calculate steps is the same
    guess: neg things need to be sign extended when calculating.
        and the only thing to produce a neg thing is to offer a neg weight to ppg
        When ppg receives a neg signal, it inverts the income data, which automatically
        performs a sign extension?
*/
class Mult extends Module{
    val io = IO(new Bundle{
        val a      = Input(Bits(64.W))
        val b      = Input(Bits(64.W))
        val sign   = Input(Bool())
        val result = Output(Bits(128.W))
        
        val unsigned = Output(Bits(128.W))
        val signed   = Output(SInt(128.W))
    })

    io.unsigned   := io.a * io.b    //unsigned multiplication, generate 258(maybe) bits and extract lower 256 bits as result
    io.signed     := io.a.asSInt * io.b.asSInt

//high level modules

    val be8_0 = Module(new BoothEncoder8)
    val be8_1 = Module(new BoothEncoder8)
    val be8_2 = Module(new BoothEncoder8)
    val be8_3 = Module(new BoothEncoder8)
    val be8_4 = Module(new BoothEncoder8)
    val be8_5 = Module(new BoothEncoder8)
    val be8_6 = Module(new BoothEncoder8)
    val be8_7 = Module(new BoothEncoder8)

    val ppg8_1 = Module(new Ppg8)
    val ppg8_2 = Module(new Ppg8)
    val ppg8_3 = Module(new Ppg8)
    val ppg8_4 = Module(new Ppg8)
    val ppg8_5 = Module(new Ppg8)
    val ppg8_6 = Module(new Ppg8)
    val ppg8_7 = Module(new Ppg8)

    val csa0 = Module(new Csa)
    val csa1 = Module(new Csa)
    val csa2 = Module(new Csa)
    val csa3 = Module(new Csa)
    val csa4 = Module(new Csa)
    val csa5 = Module(new Csa)

    val shift0  = io.b;           val shift1  = shift0 << 8;    val shift2  = shift1 << 8
    val shift3  = shift2 << 8;    val shift4  = shift3 << 8;    val shift5  = shift4 << 8
    val shift6  = shift5 << 8;    val shift7  = shift6 << 8
//ppg8's job is to peform be8.weight * some shifts of b. It's similar to normal mult,
//but a neg signal appears here. To deal it with normal mult, we could modify the oprand in advance
//so that the influence of neg can disappear, and we can therefore deal it with normal mult
    val data0   = Mux(be8_0.io.neg, ~shift0 + 1.U, shift0)
    val data1   = Mux(be8_1.io.neg, ~shift1 + 1.U, shift1)
    val data2   = Mux(be8_2.io.neg, ~shift2 + 1.U, shift2)
    val data3   = Mux(be8_3.io.neg, ~shift3 + 1.U, shift3)
    val data4   = Mux(be8_4.io.neg, ~shift4 + 1.U, shift4)
    val data5   = Mux(be8_5.io.neg, ~shift5 + 1.U, shift5)
    val data6   = Mux(be8_6.io.neg, ~shift6 + 1.U, shift6)
    val data7   = Mux(be8_7.io.neg, ~shift7 + 1.U, shift7)

    val b64 = data0;    val b66 = b64 << 2;    val b68 = b66 << 2;     val b70 = b68 << 2
//ppg8_0's implementation
//ppg8's organization: 4 be2, 4 ppg2, 2 csa, 1 ha
    val be2_0_0 = Module(new BoothEncoder2)
    val be2_0_1 = Module(new BoothEncoder2)
    val be2_0_2 = Module(new BoothEncoder2)
    val be2_0_3 = Module(new BoothEncoder2)

    val ppg2_0_0  = Module(new Ppg2)
    val ppg2_0_1  = Module(new Ppg2)
    val ppg2_0_2  = Module(new Ppg2)
    val ppg2_0_3  = Module(new Ppg2)

    val csa0_0    = Module(new Csa)
    val csa0_1    = Module(new Csa)


    be2_0_0.io.data := Cat(be8_0.io.weight(1,0),0.U)
    be2_0_1.io.data  := be8_0.io.weight(3,1)
    be2_0_2.io.data  := be8_0.io.weight(5,3)
    be2_0_3.io.data  := be8_0.io.weight(7,5)

    ppg2_0_0.io.weight  := be2_0_0.io.weight
    ppg2_0_0.io.neg     := be2_0_0.io.neg
    ppg2_0_0.io.data    := b64

    ppg2_0_1.io.weight  := be2_0_1.io.weight
    ppg2_0_1.io.neg     := be2_0_1.io.neg
    ppg2_0_1.io.data    := b66

    ppg2_0_2.io.weight  := be2_0_2.io.weight
    ppg2_0_2.io.neg     := be2_0_2.io.neg
    ppg2_0_2.io.data    := b68

    ppg2_0_3.io.weight  := be2_0_3.io.weight
    ppg2_0_3.io.neg     := be2_0_3.io.neg
    ppg2_0_3.io.data    := b70

    csa0_0.io.a         := ppg2_0_0.io.output
    csa0_0.io.b         := ppg2_0_1.io.output
    csa0_0.io.c         := ppg2_0_2.io.output

    csa0_1.io.a         := csa0_0.io.carry
    csa0_1.io.b         := csa0_0.io.temp_sum
    csa0_1.io.c         := ppg2_0_3.io.output

    val p0 = csa0_1.io.temp_sum + csa0_1.io.carry


//end of ppg8 

    be8_0.io.data   :=  Cat(io.a(7,0), 0.U)
    be8_1.io.data   :=  io.a(15,7)
    be8_2.io.data   :=  io.a(23,15)
    be8_3.io.data   :=  io.a(31,23)
    be8_4.io.data   :=  io.a(39,31)
    be8_5.io.data   :=  io.a(47,39)
    be8_6.io.data   :=  io.a(55,47)
    be8_7.io.data   :=  io.a(63,55)

//replace ppg8 with be2 and ppg2 later

    ppg8_1.io.weight    :=  be8_1.io.weight
    ppg8_1.io.data      :=  shift1
    ppg8_1.io.neg       :=  be8_1.io.neg

    ppg8_2.io.weight    :=  be8_2.io.weight
    ppg8_2.io.data      :=  shift2
    ppg8_2.io.neg       :=  be8_2.io.neg

    ppg8_3.io.weight    :=  be8_3.io.weight
    ppg8_3.io.data      :=  shift3
    ppg8_3.io.neg       :=  be8_3.io.neg

    ppg8_4.io.weight    :=  be8_4.io.weight
    ppg8_4.io.data      :=  shift4
    ppg8_4.io.neg       :=  be8_4.io.neg

    ppg8_5.io.weight    :=  be8_5.io.weight
    ppg8_5.io.data      :=  shift5
    ppg8_5.io.neg       :=  be8_5.io.neg

    ppg8_6.io.weight    :=  be8_6.io.weight
    ppg8_6.io.data      :=  shift6
    ppg8_6.io.neg       :=  be8_6.io.neg

    ppg8_7.io.weight    :=  be8_7.io.weight
    ppg8_7.io.data      :=  shift7
    ppg8_7.io.neg       :=  be8_7.io.neg


//`````````````````````````````````````````````````````
    //substitute ppg8 later. ppg8 is an abstruction which is implemented by lower level be2 and ppg2
    csa0.io.a   := ppg8_2.io.output
    csa0.io.b   := ppg8_1.io.output
/**/    csa0.io.c   := p0

    csa1.io.a   := ppg8_5.io.output
    csa1.io.b   := ppg8_4.io.output
    csa1.io.c   := ppg8_3.io.output

    csa2.io.a   := ppg8_6.io.output
    csa2.io.b   := csa1.io.carry
    csa2.io.c   := csa1.io.temp_sum

    csa3.io.a   := csa2.io.carry
    csa3.io.b   := csa0.io.temp_sum
    csa3.io.c   := csa0.io.carry

    csa4.io.a   := csa2.io.temp_sum
    csa4.io.b   := csa3.io.temp_sum
    csa4.io.c   := csa3.io.carry

    csa5.io.a   := ppg8_7.io.output
    csa5.io.b   := csa4.io.temp_sum
    csa5.io.c   := csa4.io.carry

    //last step
    io.result   := csa5.io.temp_sum + csa5.io.carry

//``````````````````````````````````````````````````````
//wires

}

//carry + temp_sum should be equal to a + b + c

class Csa extends Module{
    val io = IO(new Bundle{
        val a = Input(Bits(128.W))
        val b = Input(Bits(128.W))
        val c = Input(Bits(128.W))

        val carry = Output(Bits(128.W))
        val temp_sum = Output(Bits(128.W))
    })

    io.carry := ((io.a & io.b) | (io.a & io.c) | (io.b & io.c)) << 1
    io.temp_sum := io.a ^ io.b ^ io.c
}
//generate partial product, negative the input if neg == true
class Ppg8 extends Module{
    val io = IO(new Bundle{
        val weight  = Input(Bits(8.W))  //range: [0, 128]
        val data   = Input(Bits(128.W))
        val neg = Input(Bool())

        val output = Output(Bits((128.W)))
    })

    val tmp    = Mux(io.neg, ~(io.data) + 1.U, io.data)
    io.output := io.weight * tmp      //substitute it with low level multiplication
}
//it's like a transform from base 2 to maybe base 8?
//booth-8, or radix 128, 
//examine 9 bits and encode 8 bits at one time
//multicipand need to shifts left 8 bits every time to fit in th new base

class BoothEncoder8 extends Module{
//weight should always be postive, but the formula may 
//give a neg result, so a transform is needed here
/*
    weight table:
    signed  : -128 64 32 16 8 4 2 1 1
*/
    def GenerateWeight(data:Bits):Bits= {
        val tmp = 
            ~(data(8) << 7) + 1.U +
            (data(7) << 6) + 
            (data(6) << 5) + 
            (data(5) << 4) + 
            (data(4) << 3) + 
            (data(3) << 2) + 
            (data(2) << 1) + 
            data(1) + data(0)
        Mux(io.data(8), 256.U - tmp, tmp)
    }

    val io = IO(new Bundle{
        val data   = Input(Bits(9.W))
        val neg    = Output(Bool())
        val weight = Output(Bits(8.W))
    })

    io.weight := GenerateWeight(io.data)
    io.neg    := Mux(io.data(8), true.B, false.B)
}

class BoothEncoder2 extends Module{
    //Weight: -2 1 1
    def GenerateWeight(data:Bits)={
        val tmp =Mux(data(2),"b10".U,"b00".U) + data(1) + data(0)
        Mux(io.data(2), 4.U - tmp, tmp)
    }
    val io = IO(new Bundle{
        val data    = Input(Bits(3.W))
        val weight  = Output(Bits(2.W))     //range: [0, 2]
        val neg     = Output(Bool()) 
    })
    io.weight := GenerateWeight(io.data)
    io.neg    := io.data(2)
}

class Ppg2 extends Module{
    val io = IO(new Bundle{
        val weight = Input(Bits(2.W))
        val neg    = Input(Bool())
        val data   = Input(Bits(128.W))
        val output = Output(Bits((128).W))
    })

    val tmp   = Mux(io.neg, ~io.data + 1.U, io.data)
    val res   = MuxLookup(io.weight,0.U,Seq(
        0.U ->  0.U,
        1.U ->  tmp,
        2.U ->  Cat(tmp, 0.U),      //weight range : [0, 2]
    ))
    io.output := res
}