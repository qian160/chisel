// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VDiv.h for the primary calling header

#ifndef VERILATED_VDIV___024ROOT_H_
#define VERILATED_VDIV___024ROOT_H_  // guard

#include "verilated.h"

class VDiv__Syms;
VL_MODULE(VDiv___024root) {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(io_start,0,0);
    VL_OUT8(io_finish,0,0);
    CData/*1:0*/ Div__DOT__state;
    CData/*5:0*/ Div__DOT__clz;
    CData/*5:0*/ Div__DOT___offset_T_4;
    CData/*5:0*/ Div__DOT__cnt;
    CData/*0:0*/ Div__DOT__qNeg1;
    CData/*0:0*/ Div__DOT__q0;
    CData/*0:0*/ Div__DOT__q1;
    CData/*0:0*/ Div__DOT__q2;
    CData/*2:0*/ Div__DOT__qSel;
    CData/*5:0*/ Div__DOT___cnt_T_1;
    CData/*1:0*/ Div__DOT___GEN_815;
    CData/*5:0*/ Div__DOT___GEN_816;
    CData/*0:0*/ __Vclklast__TOP__clock;
    VlWide<5>/*128:0*/ Div__DOT__PA;
    VlWide<6>/*191:0*/ Div__DOT___GEN_856;
    VlWide<4>/*126:0*/ Div__DOT___GEN_857;
    VlWide<3>/*64:0*/ Div__DOT___GEN_858;
    VlWide<3>/*64:0*/ Div__DOT___GEN_859;
    VL_IN64(io_a,63,0);
    VL_IN64(io_b,63,0);
    VL_OUT64(io_rem,63,0);
    VL_OUT64(io_quo,63,0);
    QData/*63:0*/ Div__DOT__B;
    QData/*63:0*/ Div__DOT__pos_quo;
    QData/*63:0*/ Div__DOT__neg_quo;
    VlUnpacked<CData/*0:0*/, 2> __Vm_traceActivity;

    // INTERNAL VARIABLES
    VDiv__Syms* const vlSymsp;

    // CONSTRUCTORS
    VDiv___024root(VDiv__Syms* symsp, const char* name);
    ~VDiv___024root();
    VL_UNCOPYABLE(VDiv___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
