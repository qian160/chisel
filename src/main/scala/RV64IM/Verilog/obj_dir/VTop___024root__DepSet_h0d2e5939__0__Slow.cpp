// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTop.h for the primary calling header

#include "verilated.h"

#include "VTop___024root.h"

VL_ATTR_COLD void VTop___024root___initial__TOP__0(VTop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root___initial__TOP__0\n"); );
    // Init
    VlWide<4>/*127:0*/ __Vtemp_h85dc228c__0;
    // Body
    vlSelf->io_o3 = 0ULL;
    vlSelf->io_o4 = 0ULL;
    __Vtemp_h85dc228c__0[0U] = 0x64617461U;
    __Vtemp_h85dc228c__0[1U] = 0x526f6d2eU;
    __Vtemp_h85dc228c__0[2U] = 0x6e73745fU;
    __Vtemp_h85dc228c__0[3U] = 0x49U;
    VL_READMEM_N(true, 32, 8192, 0, VL_CVT_PACK_STR_NW(4, __Vtemp_h85dc228c__0)
                 ,  &(vlSelf->Top__DOT__INST_ROM__DOT__mem)
                 , 0, ~0ULL);
}

VL_ATTR_COLD void VTop___024root___settle__TOP__0(VTop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root___settle__TOP__0\n"); );
    // Body
    vlSelf->io_o1 = vlSelf->Top__DOT__MEM_WB__DOT__wdata;
    vlSelf->Top__DOT__IF__DOT___pc_T_1 = (4ULL + vlSelf->Top__DOT__IF__DOT__pc);
    vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_data 
        = vlSelf->Top__DOT__INST_ROM__DOT__mem[vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_addr_pipe_0];
    vlSelf->io_o2 = vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_data;
}

VL_ATTR_COLD void VTop___024root___eval_initial(VTop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root___eval_initial\n"); );
    // Body
    VTop___024root___initial__TOP__0(vlSelf);
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

VL_ATTR_COLD void VTop___024root___eval_settle(VTop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root___eval_settle\n"); );
    // Body
    VTop___024root___settle__TOP__0(vlSelf);
    vlSelf->__Vm_traceActivity[1U] = 1U;
    vlSelf->__Vm_traceActivity[0U] = 1U;
}

VL_ATTR_COLD void VTop___024root___final(VTop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root___final\n"); );
}

VL_ATTR_COLD void VTop___024root___ctor_var_reset(VTop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clock = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->io_o1 = VL_RAND_RESET_Q(64);
    vlSelf->io_o2 = VL_RAND_RESET_I(32);
    vlSelf->io_o3 = VL_RAND_RESET_Q(64);
    vlSelf->io_o4 = VL_RAND_RESET_Q(64);
    vlSelf->Top__DOT__IF__DOT__pc = VL_RAND_RESET_Q(64);
    vlSelf->Top__DOT__IF__DOT___pc_T_1 = VL_RAND_RESET_Q(64);
    for (int __Vi0=0; __Vi0<8192; ++__Vi0) {
        vlSelf->Top__DOT__INST_ROM__DOT__mem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_data = VL_RAND_RESET_I(32);
    vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_en_pipe_0 = VL_RAND_RESET_I(1);
    vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_addr_pipe_0 = VL_RAND_RESET_I(13);
    vlSelf->Top__DOT__INST_ROM__DOT__initvar = VL_RAND_RESET_I(32);
    for (int __Vi0=0; __Vi0<32; ++__Vi0) {
        vlSelf->Top__DOT__REGFILE__DOT__rf[__Vi0] = VL_RAND_RESET_Q(64);
    }
    vlSelf->Top__DOT__IF_ID__DOT__inst = VL_RAND_RESET_Q(64);
    vlSelf->Top__DOT__ID_EX__DOT__opcode = VL_RAND_RESET_I(7);
    vlSelf->Top__DOT__ID_EX__DOT__oprand1 = VL_RAND_RESET_Q(64);
    vlSelf->Top__DOT__ID_EX__DOT__oprand2 = VL_RAND_RESET_Q(64);
    vlSelf->Top__DOT__ID_EX__DOT__aluop = VL_RAND_RESET_I(4);
    vlSelf->Top__DOT__EX_MEM__DOT__wdata = VL_RAND_RESET_Q(64);
    vlSelf->Top__DOT__MEM_WB__DOT__wdata = VL_RAND_RESET_Q(64);
    for (int __Vi0=0; __Vi0<2; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = VL_RAND_RESET_I(1);
    }
}
