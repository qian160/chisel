package Arith

import chisel3._
import chisel3.util._
import Helpers._
/*  difference between signed and unsigned multiplication:
        zero extension vs sign extension
*/
class Mult extends Module{
    val io = IO(new Bundle{
        val a      = Input(Bits(64.W))
        val b      = Input(Bits(64.W))
        val sign   = Input(Bool())
        val result = Output(Bits(128.W))
    })
//high level modules
    val be8_0 = Module(new BoothEncoder8)
    val be8_1 = Module(new BoothEncoder8)
    val be8_2 = Module(new BoothEncoder8)
    val be8_3 = Module(new BoothEncoder8)
    val be8_4 = Module(new BoothEncoder8)
    val be8_5 = Module(new BoothEncoder8)
    val be8_6 = Module(new BoothEncoder8)
    val be8_7 = Module(new BoothEncoder8)

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

    val b64  = data0; val b66  = b64  << 2; val b68  = b66  << 2; val b70  = b68  << 2  //used by ppg0
    val b72  = data1; val b74  = b72  << 2; val b76  = b74  << 2; val b78  = b76  << 2  //used by ppg1
    val b80  = data2; val b82  = b80  << 2; val b84  = b82  << 2; val b86  = b84  << 2
    val b88  = data3; val b90  = b88  << 2; val b92  = b90  << 2; val b94  = b90  << 2
    val b96  = data4; val b98  = b96  << 2; val b100 = b98  << 2; val b102 = b100 << 2
    val b104 = data5; val b106 = b104 << 2; val b108 = b106 << 2; val b110 = b108 << 2
    val b112 = data6; val b114 = b112 << 2; val b116 = b114 << 2; val b118 = b116 << 2
    val b120 = data7; val b122 = b120 << 2; val b124 = b122 << 2; val b126 = b124 << 2

//ppg8_0's implementation
//ppg8's organization: 4 be2, 4 ppg2, 2 csa, 1 ha
//ppg0
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
//ppg1
    val be2_1_0 = Module(new BoothEncoder2)
    val be2_1_1 = Module(new BoothEncoder2)
    val be2_1_2 = Module(new BoothEncoder2)
    val be2_1_3 = Module(new BoothEncoder2)
    val ppg2_1_0  = Module(new Ppg2)
    val ppg2_1_1  = Module(new Ppg2)
    val ppg2_1_2  = Module(new Ppg2)
    val ppg2_1_3  = Module(new Ppg2)
    val csa1_0    = Module(new Csa)
    val csa1_1    = Module(new Csa)

    val be2_2_0 = Module(new BoothEncoder2)
    val be2_2_1 = Module(new BoothEncoder2)
    val be2_2_2 = Module(new BoothEncoder2)
    val be2_2_3 = Module(new BoothEncoder2)
    val ppg2_2_0  = Module(new Ppg2)
    val ppg2_2_1  = Module(new Ppg2)
    val ppg2_2_2  = Module(new Ppg2)
    val ppg2_2_3  = Module(new Ppg2)
    val csa2_0    = Module(new Csa)
    val csa2_1    = Module(new Csa)

    val be2_3_0 = Module(new BoothEncoder2)
    val be2_3_1 = Module(new BoothEncoder2)
    val be2_3_2 = Module(new BoothEncoder2)
    val be2_3_3 = Module(new BoothEncoder2)
    val ppg2_3_0  = Module(new Ppg2)
    val ppg2_3_1  = Module(new Ppg2)
    val ppg2_3_2  = Module(new Ppg2)
    val ppg2_3_3  = Module(new Ppg2)
    val csa3_0    = Module(new Csa)
    val csa3_1    = Module(new Csa)

    val be2_4_0 = Module(new BoothEncoder2)
    val be2_4_1 = Module(new BoothEncoder2)
    val be2_4_2 = Module(new BoothEncoder2)
    val be2_4_3 = Module(new BoothEncoder2)
    val ppg2_4_0  = Module(new Ppg2)
    val ppg2_4_1  = Module(new Ppg2)
    val ppg2_4_2  = Module(new Ppg2)
    val ppg2_4_3  = Module(new Ppg2)
    val csa4_0    = Module(new Csa)
    val csa4_1    = Module(new Csa)

    val be2_5_0 = Module(new BoothEncoder2)
    val be2_5_1 = Module(new BoothEncoder2)
    val be2_5_2 = Module(new BoothEncoder2)
    val be2_5_3 = Module(new BoothEncoder2)
    val ppg2_5_0  = Module(new Ppg2)
    val ppg2_5_1  = Module(new Ppg2)
    val ppg2_5_2  = Module(new Ppg2)
    val ppg2_5_3  = Module(new Ppg2)
    val csa5_0    = Module(new Csa)
    val csa5_1    = Module(new Csa)

    val be2_6_0 = Module(new BoothEncoder2)
    val be2_6_1 = Module(new BoothEncoder2)
    val be2_6_2 = Module(new BoothEncoder2)
    val be2_6_3 = Module(new BoothEncoder2)
    val ppg2_6_0  = Module(new Ppg2)
    val ppg2_6_1  = Module(new Ppg2)
    val ppg2_6_2  = Module(new Ppg2)
    val ppg2_6_3  = Module(new Ppg2)
    val csa6_0    = Module(new Csa)
    val csa6_1    = Module(new Csa)

    val be2_7_0 = Module(new BoothEncoder2)
    val be2_7_1 = Module(new BoothEncoder2)
    val be2_7_2 = Module(new BoothEncoder2)
    val be2_7_3 = Module(new BoothEncoder2)
    val ppg2_7_0  = Module(new Ppg2)
    val ppg2_7_1  = Module(new Ppg2)
    val ppg2_7_2  = Module(new Ppg2)
    val ppg2_7_3  = Module(new Ppg2)
    val csa7_0    = Module(new Csa)
    val csa7_1    = Module(new Csa)


    be2_0_0.io.data  := Cat(be8_0.io.weight(1,0),0.U)
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


    be2_1_0.io.data := Cat(be8_1.io.weight(1,0),0.U)
    be2_1_1.io.data  := be8_1.io.weight(3,1)
    be2_1_2.io.data  := be8_1.io.weight(5,3)
    be2_1_3.io.data  := be8_1.io.weight(7,5)

    ppg2_1_0.io.weight  := be2_1_0.io.weight
    ppg2_1_0.io.neg     := be2_1_0.io.neg
    ppg2_1_0.io.data    := b72

    ppg2_1_1.io.weight  := be2_1_1.io.weight
    ppg2_1_1.io.neg     := be2_1_1.io.neg
    ppg2_1_1.io.data    := b74

    ppg2_1_2.io.weight  := be2_1_2.io.weight
    ppg2_1_2.io.neg     := be2_1_2.io.neg
    ppg2_1_2.io.data    := b76

    ppg2_1_3.io.weight  := be2_1_3.io.weight
    ppg2_1_3.io.neg     := be2_1_3.io.neg
    ppg2_1_3.io.data    := b78

    csa1_0.io.a         := ppg2_1_0.io.output
    csa1_0.io.b         := ppg2_1_1.io.output
    csa1_0.io.c         := ppg2_1_2.io.output

    csa1_1.io.a         := csa1_0.io.carry
    csa1_1.io.b         := csa1_0.io.temp_sum
    csa1_1.io.c         := ppg2_1_3.io.output

    val p1 = csa1_1.io.temp_sum + csa1_1.io.carry


    be2_2_0.io.data := Cat(be8_2.io.weight(1,0),0.U)
    be2_2_1.io.data  := be8_2.io.weight(3,1)
    be2_2_2.io.data  := be8_2.io.weight(5,3)
    be2_2_3.io.data  := be8_2.io.weight(7,5)

    ppg2_2_0.io.weight  := be2_2_0.io.weight
    ppg2_2_0.io.neg     := be2_2_0.io.neg
    ppg2_2_0.io.data    := b80

    ppg2_2_1.io.weight  := be2_2_1.io.weight
    ppg2_2_1.io.neg     := be2_2_1.io.neg
    ppg2_2_1.io.data    := b82

    ppg2_2_2.io.weight  := be2_2_2.io.weight
    ppg2_2_2.io.neg     := be2_2_2.io.neg
    ppg2_2_2.io.data    := b84

    ppg2_2_3.io.weight  := be2_2_3.io.weight
    ppg2_2_3.io.neg     := be2_2_3.io.neg
    ppg2_2_3.io.data    := b86

    csa2_0.io.a         := ppg2_2_0.io.output
    csa2_0.io.b         := ppg2_2_1.io.output
    csa2_0.io.c         := ppg2_2_2.io.output

    csa2_1.io.a         := csa2_0.io.carry
    csa2_1.io.b         := csa2_0.io.temp_sum
    csa2_1.io.c         := ppg2_2_3.io.output

    val p2 = csa2_1.io.temp_sum + csa2_1.io.carry


    be2_3_0.io.data := Cat(be8_3.io.weight(1,0),0.U)
    be2_3_1.io.data  := be8_3.io.weight(3,1)
    be2_3_2.io.data  := be8_3.io.weight(5,3)
    be2_3_3.io.data  := be8_3.io.weight(7,5)

    ppg2_3_0.io.weight  := be2_3_0.io.weight
    ppg2_3_0.io.neg     := be2_3_0.io.neg
    ppg2_3_0.io.data    := b88

    ppg2_3_1.io.weight  := be2_3_1.io.weight
    ppg2_3_1.io.neg     := be2_3_1.io.neg
    ppg2_3_1.io.data    := b90

    ppg2_3_2.io.weight  := be2_3_2.io.weight
    ppg2_3_2.io.neg     := be2_3_2.io.neg
    ppg2_3_2.io.data    := b92

    ppg2_3_3.io.weight  := be2_3_3.io.weight
    ppg2_3_3.io.neg     := be2_3_3.io.neg
    ppg2_3_3.io.data    := b94

    csa3_0.io.a         := ppg2_3_0.io.output
    csa3_0.io.b         := ppg2_3_1.io.output
    csa3_0.io.c         := ppg2_3_2.io.output

    csa3_1.io.a         := csa3_0.io.carry
    csa3_1.io.b         := csa3_0.io.temp_sum
    csa3_1.io.c         := ppg2_3_3.io.output

    val p3 = csa3_1.io.temp_sum + csa3_1.io.carry


    be2_4_0.io.data  := Cat(be8_4.io.weight(1,0),0.U)
    be2_4_1.io.data  := be8_4.io.weight(3,1)
    be2_4_2.io.data  := be8_4.io.weight(5,3)
    be2_4_3.io.data  := be8_4.io.weight(7,5)

    ppg2_4_0.io.weight  := be2_4_0.io.weight
    ppg2_4_0.io.neg     := be2_4_0.io.neg
    ppg2_4_0.io.data    := b96

    ppg2_4_1.io.weight  := be2_4_1.io.weight
    ppg2_4_1.io.neg     := be2_4_1.io.neg
    ppg2_4_1.io.data    := b98

    ppg2_4_2.io.weight  := be2_4_2.io.weight
    ppg2_4_2.io.neg     := be2_4_2.io.neg
    ppg2_4_2.io.data    := b100

    ppg2_4_3.io.weight  := be2_4_3.io.weight
    ppg2_4_3.io.neg     := be2_4_3.io.neg
    ppg2_4_3.io.data    := b102

    csa4_0.io.a         := ppg2_4_0.io.output
    csa4_0.io.b         := ppg2_4_1.io.output
    csa4_0.io.c         := ppg2_4_2.io.output

    csa4_1.io.a         := csa4_0.io.carry
    csa4_1.io.b         := csa4_0.io.temp_sum
    csa4_1.io.c         := ppg2_4_3.io.output

    val p4 = csa4_1.io.temp_sum + csa4_1.io.carry


    be2_5_0.io.data  := Cat(be8_5.io.weight(1,0),0.U)
    be2_5_1.io.data  := be8_5.io.weight(3,1)
    be2_5_2.io.data  := be8_5.io.weight(5,3)
    be2_5_3.io.data  := be8_5.io.weight(7,5)

    ppg2_5_0.io.weight  := be2_5_0.io.weight
    ppg2_5_0.io.neg     := be2_5_0.io.neg
    ppg2_5_0.io.data    := b104

    ppg2_5_1.io.weight  := be2_5_1.io.weight
    ppg2_5_1.io.neg     := be2_5_1.io.neg
    ppg2_5_1.io.data    := b106

    ppg2_5_2.io.weight  := be2_5_2.io.weight
    ppg2_5_2.io.neg     := be2_5_2.io.neg
    ppg2_5_2.io.data    := b108

    ppg2_5_3.io.weight  := be2_5_3.io.weight
    ppg2_5_3.io.neg     := be2_5_3.io.neg
    ppg2_5_3.io.data    := b110

    csa5_0.io.a         := ppg2_5_0.io.output
    csa5_0.io.b         := ppg2_5_1.io.output
    csa5_0.io.c         := ppg2_5_2.io.output

    csa5_1.io.a         := csa5_0.io.carry
    csa5_1.io.b         := csa5_0.io.temp_sum
    csa5_1.io.c         := ppg2_5_3.io.output

    val p5 = csa5_1.io.temp_sum + csa5_1.io.carry


    be2_6_0.io.data := Cat(be8_6.io.weight(1,0),0.U)
    be2_6_1.io.data  := be8_6.io.weight(3,1)
    be2_6_2.io.data  := be8_6.io.weight(5,3)
    be2_6_3.io.data  := be8_6.io.weight(7,5)

    ppg2_6_0.io.weight  := be2_6_0.io.weight
    ppg2_6_0.io.neg     := be2_6_0.io.neg
    ppg2_6_0.io.data    := b112

    ppg2_6_1.io.weight  := be2_6_1.io.weight
    ppg2_6_1.io.neg     := be2_6_1.io.neg
    ppg2_6_1.io.data    := b114

    ppg2_6_2.io.weight  := be2_6_2.io.weight
    ppg2_6_2.io.neg     := be2_6_2.io.neg
    ppg2_6_2.io.data    := b116

    ppg2_6_3.io.weight  := be2_6_3.io.weight
    ppg2_6_3.io.neg     := be2_6_3.io.neg
    ppg2_6_3.io.data    := b118

    csa6_0.io.a         := ppg2_6_0.io.output
    csa6_0.io.b         := ppg2_6_1.io.output
    csa6_0.io.c         := ppg2_6_2.io.output

    csa6_1.io.a         := csa6_0.io.carry
    csa6_1.io.b         := csa6_0.io.temp_sum
    csa6_1.io.c         := ppg2_6_3.io.output

    val p6 = csa6_1.io.temp_sum + csa6_1.io.carry


    be2_7_0.io.data := Cat(be8_7.io.weight(1,0),0.U)
    be2_7_1.io.data  := be8_7.io.weight(3,1)
    be2_7_2.io.data  := be8_7.io.weight(5,3)
    be2_7_3.io.data  := be8_7.io.weight(7,5)

    ppg2_7_0.io.weight  := be2_7_0.io.weight
    ppg2_7_0.io.neg     := be2_7_0.io.neg
    ppg2_7_0.io.data    := b120

    ppg2_7_1.io.weight  := be2_7_1.io.weight
    ppg2_7_1.io.neg     := be2_7_1.io.neg
    ppg2_7_1.io.data    := b122

    ppg2_7_2.io.weight  := be2_7_2.io.weight
    ppg2_7_2.io.neg     := be2_7_2.io.neg
    ppg2_7_2.io.data    := b124

    ppg2_7_3.io.weight  := be2_7_3.io.weight
    ppg2_7_3.io.neg     := be2_7_3.io.neg
    ppg2_7_3.io.data    := b126

    csa7_0.io.a         := ppg2_7_0.io.output
    csa7_0.io.b         := ppg2_7_1.io.output
    csa7_0.io.c         := ppg2_7_2.io.output

    csa7_1.io.a         := csa7_0.io.carry
    csa7_1.io.b         := csa7_0.io.temp_sum
    csa7_1.io.c         := ppg2_7_3.io.output

    val p7 = csa7_1.io.temp_sum + csa7_1.io.carry


//end of ppg8 

    be8_0.io.data   :=  Cat(io.a(7,0), 0.U)
    be8_1.io.data   :=  io.a(15,7)
    be8_2.io.data   :=  io.a(23,15)
    be8_3.io.data   :=  io.a(31,23)
    be8_4.io.data   :=  io.a(39,31)
    be8_5.io.data   :=  io.a(47,39)
    be8_6.io.data   :=  io.a(55,47)
    be8_7.io.data   :=  io.a(63,55)

//`````````````````````````````````````````````````````
    csa0.io.a   := p0
    csa0.io.b   := p1
    csa0.io.c   := p2

    csa1.io.a   := p5
    csa1.io.b   := p4
    csa1.io.c   := p3

    csa2.io.a   := p6
    csa2.io.b   := csa1.io.carry
    csa2.io.c   := csa1.io.temp_sum

    csa3.io.a   := csa2.io.carry
    csa3.io.b   := csa0.io.temp_sum
    csa3.io.c   := csa0.io.carry

    csa4.io.a   := csa2.io.temp_sum
    csa4.io.b   := csa3.io.temp_sum
    csa4.io.c   := csa3.io.carry

    csa5.io.a   := p7
    csa5.io.b   := csa4.io.temp_sum
    csa5.io.c   := csa4.io.carry

    //last step
    io.result   := csa5.io.temp_sum + csa5.io.carry

//``````````````````````````````````````````````````````
}

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
//it's like a transform from base 2 to maybe base 8?
//booth-8, or radix 128, 
//examine 9 bits and encode 8 bits at one time. 1 bit overlapped between 2 examines
//multicipand need to shifts left 8 bits every time to fit in th new base

class BoothEncoder8 extends Module{
//weight should always be postive, but the formula may give a neg result, so a transform is needed here
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
        0.U ->  0.U,    1.U ->  tmp,    2.U ->  Cat(tmp, 0.U),
        //weight range : [0, 2]
    ))
    io.output := res
}

/*1.shift b to make sure it's greater than 1/2 INT_MAX. Then compare b and the remainder in P to give quotient bit*/
//SRT-4, quotient set = {-2, -1, 0, 1, 2}. Examine 4 bits of B to choose the table we use 
//and 6 bits of P to choose the quotient bit. Can not simply use the high bits to 
class Div extends Module{
    def between(data:SInt, a:SInt, b:SInt):Bool = {
        data >= a & data <= b
    }
    val io = IO(new Bundle{
        val a,b      = Input(Bits(64.W))
        val start    = Input(Bool())//sign
        val rem,quo  = Output(Bits(64.W))
        val finish   = Output(Bool())
        val div_err  = Output(Bool())
    })

    //states
    val FREE   = 0.U(2.W)
    val BUSY   = 1.U(2.W)
    val FINISH = 2.U(2.W)
    val ERROR  = 3.U(2.W)

    //quotient
    val ZERO = 0.U(3.W)
    val ONE  = 1.U(3.W)
    val TWO  = 2.U(3.W)
    val NEG1 = 7.U(3.W)
    val NEG2 = 6.U(3.W)

    val state  =  RegInit(FREE)
    val PA     =  RegInit(0.U(129.W))                    //P[16:8], for remainder, A[7:0]
    val P      =  PA(128,64)
    val PASL2  =  PA << 2
    val B      =  RegInit(0.U(64.W))
    
    val negB   =  ~Cat(0.U(1.W), B) + 1.U
    val neg2B  =  negB << 1

    val clz    =  countLeadingZeros(io.b)

    val whichTable = B(63,60)
    //use 1 big table with offset
    val offset  = ((((whichTable - 8.U) << 2) + whichTable - 8.U) << 1)    //*5 * 2, 10 elems per table
    val cnt     = RegInit(0.U(6.W))
    val P_neg   = PA(128)
    val pos_quo = RegInit(0.U(64.W))    //accumulator for positive quotient
    val neg_quo = RegInit(0.U(64.W))
    io.finish  := false.B
    io.div_err := false.B
    io.rem     := PA(128, 64)
    io.quo     := pos_quo - neg_quo

    val table   = qSelTable.table

    val qNeg2   = between(P(64,59).asSInt, table(offset)      ,table(offset + 1.U))
    val qNeg1   = between(P(64,59).asSInt, table(offset + 2.U),table(offset + 3.U))
    val q0      = between(P(64,59).asSInt, table(offset + 4.U),table(offset + 5.U))
    val q1      = between(P(64,59).asSInt, table(offset + 6.U),table(offset + 7.U))
    val q2      = between(P(64,59).asSInt, table(offset + 8.U),table(offset + 9.U))
    //here we takes 1 cycle to do the load, or to initialize the PA. To avoid this we can spread the start signal earlier
    switch(state){
        is(FREE){
            when(io.start){     //start up
                state :=  Mux(io.b === 0.U, ERROR, BUSY)
                PA    :=  Cat(0.U(65.W), io.a) << clz      // p = 0, A = a
                B     :=  io.b << clz
            }.otherwise{        //not started yet
                state :=  FREE
            }
            cnt        := 62.U
            io.finish  := false.B
            pos_quo    := 0.U
            neg_quo    := 0.U
        }
        is(BUSY){       //weight of each qi: 1, 4, 16, 64, ...
        /*
            1.observe the high bits of P to select a quotient
            2.apply r(i+1) = 4r(i) + qb to (P,A)
            2.accumulate (q * some_weight) to register pos_quo or neg_quo
        */
            state      := Mux(cnt === 0.U, FINISH, BUSY)
            io.finish  := false.B
            val qSel = PriorityMux(Seq(
                (q0,    ZERO),
                (q1,    ONE),
                (q2,    TWO),
                (qNeg1, NEG1),
                (qNeg2, NEG2),
            ))
            //r(i+1) = r(i) << 2 + qb
            //quotient += qi * some_weight
            switch(qSel){
                is(NEG2){
                    PA      := PASL2 + Cat((B << 1), 0.U(64.W))
                    neg_quo := neg_quo + (1.U << cnt << 1)
                }
                is(NEG1){
                    PA      := PASL2 + Cat(B, 0.U(64.W))
                    neg_quo := neg_quo + (1.U << cnt)
                }
                is(ZERO){
                    PA      := PASL2
                }
                is(ONE){
                    PA      := PASL2 + Cat(negB, 0.U(64.W))
                    pos_quo := pos_quo + (1.U << cnt)
                }
                is(TWO){
                    PA      := PASL2 + Cat(neg2B, 0.U(64.W))
                    pos_quo := pos_quo + (1.U << cnt << 1)
                }
            }

            cnt := cnt - 2.U
        }
        is(ERROR){
            //ADD SOME CONTROL SIGNAL
            state      := FINISH
            io.quo     := 0.U
            io.rem     := 0.U
            io.finish  := true.B
            io.div_err := true.B
        }
        is(FINISH){
            state      := FINISH    //modify this
            cnt        := 0.U
            io.rem     := Mux(P_neg, (P + B) >> clz, P >> clz)
            io.quo     := Mux(P_neg, pos_quo - neg_quo - 1.U, pos_quo - neg_quo)  //
            io.finish  := true.B
        }
    }
}

object qSelTable {  //look-up-table
        val table = VecInit(Array(
        //b[7:4] = 8
        -12.S, -7.S,     //-2
         -6.S, -3.S,     //-1
         -2.S,  1.S,     //0
          2.S,  5.S,     //1
          6.S, 11.S,     //2
        //b[7:4] =  9
        -14.S, -8.S,
         -7.S, -3.S,
         -3.S,  2.S,
          2.S,  6.S,
          7.S, 13.S,

        -15.S, -9.S,
         -8.S, -3.S,
         -3.S,  2.S,
          2.S,  7.S,
          8.S, 14.S,

        -16.S, -9.S,
         -9.S, -3.S,
         -3.S,  2.S,
          2.S,  8.S,
          8.S, 15.S,

        -18.S, -10.S,
        -10.S, -4.S,
         -4.S,  3.S,
          3.S,  9.S,
          9.S, 17.S,

        -19.S, -11.S,
        -10.S, -4.S,
         -4.S,  3.S,
          3.S,  9.S,
         10.S, 18.S,

        -20.S, -11.S,
        -11.S, -4.S,
         -4.S,  3.S,
          3.S,  10.S,
         10.S,  19.S,

        -22.S, -12.S,
        -12.S, -4.S,
         -5.S,  4.S,
          3.S, 11.S,
         11.S, 21.S,
    ))
}