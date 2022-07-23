// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VTop.h for the primary calling header

#ifndef VERILATED_VTOP___024ROOT_H_
#define VERILATED_VTOP___024ROOT_H_  // guard

#include "verilated.h"

class VTop__Syms;
VL_MODULE(VTop___024root) {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    CData/*0:0*/ Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_en_pipe_0;
    CData/*6:0*/ Top__DOT__ID_EX__DOT__opcode;
    CData/*3:0*/ Top__DOT__ID_EX__DOT__aluop;
    CData/*0:0*/ __Vclklast__TOP__clock;
    SData/*12:0*/ Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_addr_pipe_0;
    VL_OUT(io_o2,31,0);
    IData/*31:0*/ Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_data;
    IData/*31:0*/ Top__DOT__INST_ROM__DOT__initvar;
    VL_OUT64(io_o1,63,0);
    VL_OUT64(io_o3,63,0);
    VL_OUT64(io_o4,63,0);
    QData/*63:0*/ Top__DOT__IF__DOT__pc;
    QData/*63:0*/ Top__DOT__IF__DOT___pc_T_1;
    QData/*63:0*/ Top__DOT__IF_ID__DOT__inst;
    QData/*63:0*/ Top__DOT__ID_EX__DOT__oprand1;
    QData/*63:0*/ Top__DOT__ID_EX__DOT__oprand2;
    QData/*63:0*/ Top__DOT__EX_MEM__DOT__wdata;
    QData/*63:0*/ Top__DOT__MEM_WB__DOT__wdata;
    VlUnpacked<IData/*31:0*/, 8192> Top__DOT__INST_ROM__DOT__mem;
    VlUnpacked<QData/*63:0*/, 32> Top__DOT__REGFILE__DOT__rf;
    VlUnpacked<CData/*0:0*/, 2> __Vm_traceActivity;

    // INTERNAL VARIABLES
    VTop__Syms* const vlSymsp;

    // CONSTRUCTORS
    VTop___024root(VTop__Syms* symsp, const char* name);
    ~VTop___024root();
    VL_UNCOPYABLE(VTop___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
