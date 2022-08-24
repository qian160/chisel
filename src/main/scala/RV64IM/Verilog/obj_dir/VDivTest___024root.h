// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VDivTest.h for the primary calling header

#ifndef VERILATED_VDIVTEST___024ROOT_H_
#define VERILATED_VDIVTEST___024ROOT_H_  // guard

#include "verilated.h"

class VDivTest__Syms;
VL_MODULE(VDivTest___024root) {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(io_a,7,0);
    VL_IN8(io_b,7,0);
    VL_IN8(io_start,0,0);
    VL_OUT8(io_rem,7,0);
    VL_OUT8(io_quo,7,0);
    VL_OUT8(io_finish,0,0);
    VL_OUT8(io_state,1,0);
    VL_OUT8(io_cnt,5,0);
    VL_OUT8(io_B,7,0);
    VL_OUT8(io_qNeg2,0,0);
    VL_OUT8(io_qNeg1,0,0);
    VL_OUT8(io_q0,0,0);
    VL_OUT8(io_q1,0,0);
    VL_OUT8(io_q2,0,0);
    VL_OUT8(io_whichTable,3,0);
    VL_OUT8(io_pq,7,0);
    VL_OUT8(io_nq,7,0);
    CData/*1:0*/ DivTest__DOT__state;
    CData/*7:0*/ DivTest__DOT__B;
    CData/*2:0*/ DivTest__DOT__clz;
    CData/*5:0*/ DivTest__DOT___offset_T_4;
    CData/*5:0*/ DivTest__DOT__cnt;
    CData/*7:0*/ DivTest__DOT__pos_quo;
    CData/*7:0*/ DivTest__DOT__neg_quo;
    CData/*5:0*/ DivTest__DOT___GEN_846;
    CData/*5:0*/ DivTest__DOT___GEN_239;
    CData/*5:0*/ DivTest__DOT___GEN_319;
    CData/*5:0*/ DivTest__DOT___GEN_399;
    CData/*5:0*/ DivTest__DOT___GEN_479;
    CData/*5:0*/ DivTest__DOT___GEN_559;
    CData/*5:0*/ DivTest__DOT___GEN_639;
    CData/*5:0*/ DivTest__DOT___GEN_719;
    CData/*5:0*/ DivTest__DOT___GEN_799;
    CData/*2:0*/ DivTest__DOT__qSel;
    CData/*5:0*/ DivTest__DOT___cnt_T_1;
    CData/*1:0*/ DivTest__DOT___GEN_815;
    CData/*5:0*/ DivTest__DOT___GEN_816;
    CData/*0:0*/ __Vclklast__TOP__clock;
    VL_OUT16(io_p,8,0);
    VL_OUT16(io_negB,8,0);
    SData/*14:0*/ DivTest__DOT___GEN_866;
    VL_OUT(io_PA,16,0);
    IData/*16:0*/ DivTest__DOT__PA;
    IData/*23:0*/ DivTest__DOT___GEN_865;
    VlWide<3>/*64:0*/ DivTest__DOT___GEN_867;
    VlWide<3>/*64:0*/ DivTest__DOT___GEN_868;
    VlUnpacked<CData/*0:0*/, 2> __Vm_traceActivity;

    // INTERNAL VARIABLES
    VDivTest__Syms* const vlSymsp;

    // CONSTRUCTORS
    VDivTest___024root(VDivTest__Syms* symsp, const char* name);
    ~VDivTest___024root();
    VL_UNCOPYABLE(VDivTest___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
