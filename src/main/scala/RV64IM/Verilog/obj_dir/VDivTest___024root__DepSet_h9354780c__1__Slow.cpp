// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VDivTest.h for the primary calling header

#include "verilated.h"

#include "VDivTest___024root.h"

VL_ATTR_COLD void VDivTest___024root___eval_initial(VDivTest___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root___eval_initial\n"); );
    // Body
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

VL_ATTR_COLD void VDivTest___024root___settle__TOP__0(VDivTest___024root* vlSelf);

VL_ATTR_COLD void VDivTest___024root___eval_settle(VDivTest___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root___eval_settle\n"); );
    // Body
    VDivTest___024root___settle__TOP__0(vlSelf);
    vlSelf->__Vm_traceActivity[1U] = 1U;
    vlSelf->__Vm_traceActivity[0U] = 1U;
}

VL_ATTR_COLD void VDivTest___024root___final(VDivTest___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root___final\n"); );
}

VL_ATTR_COLD void VDivTest___024root___ctor_var_reset(VDivTest___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clock = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->io_a = VL_RAND_RESET_I(8);
    vlSelf->io_b = VL_RAND_RESET_I(8);
    vlSelf->io_start = VL_RAND_RESET_I(1);
    vlSelf->io_rem = VL_RAND_RESET_I(8);
    vlSelf->io_quo = VL_RAND_RESET_I(8);
    vlSelf->io_finish = VL_RAND_RESET_I(1);
    vlSelf->io_state = VL_RAND_RESET_I(2);
    vlSelf->io_PA = VL_RAND_RESET_I(17);
    vlSelf->io_cnt = VL_RAND_RESET_I(6);
    vlSelf->io_B = VL_RAND_RESET_I(8);
    vlSelf->io_qNeg2 = VL_RAND_RESET_I(1);
    vlSelf->io_qNeg1 = VL_RAND_RESET_I(1);
    vlSelf->io_q0 = VL_RAND_RESET_I(1);
    vlSelf->io_q1 = VL_RAND_RESET_I(1);
    vlSelf->io_q2 = VL_RAND_RESET_I(1);
    vlSelf->io_offset = VL_RAND_RESET_I(7);
    vlSelf->io_p = VL_RAND_RESET_I(9);
    vlSelf->io_whichTable = VL_RAND_RESET_I(4);
    vlSelf->DivTest__DOT__state = VL_RAND_RESET_I(2);
    vlSelf->DivTest__DOT__PA = VL_RAND_RESET_I(17);
    vlSelf->DivTest__DOT__B = VL_RAND_RESET_I(8);
    vlSelf->DivTest__DOT__clz = VL_RAND_RESET_I(3);
    vlSelf->DivTest__DOT__cnt = VL_RAND_RESET_I(6);
    vlSelf->DivTest__DOT__pos_quo = VL_RAND_RESET_I(8);
    vlSelf->DivTest__DOT__neg_quo = VL_RAND_RESET_I(8);
    vlSelf->DivTest__DOT___GEN_79 = VL_RAND_RESET_I(6);
    vlSelf->DivTest__DOT___GEN_159 = VL_RAND_RESET_I(6);
    vlSelf->DivTest__DOT___GEN_239 = VL_RAND_RESET_I(6);
    vlSelf->DivTest__DOT___GEN_319 = VL_RAND_RESET_I(6);
    vlSelf->DivTest__DOT___GEN_399 = VL_RAND_RESET_I(6);
    vlSelf->DivTest__DOT___GEN_479 = VL_RAND_RESET_I(6);
    vlSelf->DivTest__DOT___GEN_559 = VL_RAND_RESET_I(6);
    vlSelf->DivTest__DOT___GEN_639 = VL_RAND_RESET_I(6);
    vlSelf->DivTest__DOT__qSel = VL_RAND_RESET_I(3);
    VL_RAND_RESET_W(65, vlSelf->DivTest__DOT___neg_quo_T_3);
    vlSelf->DivTest__DOT___neg_quo_T_6 = VL_RAND_RESET_Q(64);
    vlSelf->DivTest__DOT___PA_T_17 = VL_RAND_RESET_I(19);
    vlSelf->DivTest__DOT___cnt_T_1 = VL_RAND_RESET_I(6);
    vlSelf->DivTest__DOT___GEN_815 = VL_RAND_RESET_I(2);
    vlSelf->DivTest__DOT___GEN_816 = VL_RAND_RESET_I(6);
    vlSelf->DivTest__DOT___GEN_853 = VL_RAND_RESET_I(24);
    vlSelf->DivTest__DOT___GEN_854 = VL_RAND_RESET_I(15);
    VL_RAND_RESET_W(65, vlSelf->DivTest__DOT___GEN_855);
    VL_RAND_RESET_W(65, vlSelf->DivTest__DOT___GEN_856);
    for (int __Vi0=0; __Vi0<2; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = VL_RAND_RESET_I(1);
    }
}
