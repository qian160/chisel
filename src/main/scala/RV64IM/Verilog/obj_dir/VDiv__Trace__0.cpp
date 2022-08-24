// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VDiv__Syms.h"


void VDiv___024root__trace_chg_sub_0(VDiv___024root* vlSelf, VerilatedVcd* tracep);

void VDiv___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDiv___024root__trace_chg_top_0\n"); );
    // Init
    VDiv___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VDiv___024root*>(voidSelf);
    VDiv__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    VDiv___024root__trace_chg_sub_0((&vlSymsp->TOP), tracep);
}

void VDiv___024root__trace_chg_sub_0(VDiv___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VDiv__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDiv___024root__trace_chg_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = tracep->oldp(vlSymsp->__Vm_baseCode + 1);
    VlWide<3>/*95:0*/ __Vtemp_h3a8cc253__0;
    VlWide<5>/*159:0*/ __Vtemp_h39a32276__0;
    VlWide<3>/*95:0*/ __Vtemp_h5e726cb9__0;
    VlWide<3>/*95:0*/ __Vtemp_h9f986060__0;
    VlWide<3>/*95:0*/ __Vtemp_h6e31414e__0;
    VlWide<3>/*95:0*/ __Vtemp_h676c64b4__0;
    VlWide<3>/*95:0*/ __Vtemp_h7f27db8a__0;
    VlWide<3>/*95:0*/ __Vtemp_h5e726cb9__1;
    VlWide<3>/*95:0*/ __Vtemp_h9f986060__1;
    VlWide<3>/*95:0*/ __Vtemp_h88b01313__0;
    VlWide<3>/*95:0*/ __Vtemp_hef05ea1e__0;
    VlWide<3>/*95:0*/ __Vtemp_h57b3d82e__0;
    // Body
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
        tracep->chgCData(oldp+0,(vlSelf->Div__DOT__state),2);
        tracep->chgWData(oldp+1,(vlSelf->Div__DOT__PA),129);
        __Vtemp_h3a8cc253__0[0U] = vlSelf->Div__DOT__PA[2U];
        __Vtemp_h3a8cc253__0[1U] = vlSelf->Div__DOT__PA[3U];
        __Vtemp_h3a8cc253__0[2U] = (1U & vlSelf->Div__DOT__PA[4U]);
        tracep->chgWData(oldp+6,(__Vtemp_h3a8cc253__0),65);
        __Vtemp_h39a32276__0[0U] = (vlSelf->Div__DOT__PA[0U] 
                                    << 2U);
        __Vtemp_h39a32276__0[1U] = ((vlSelf->Div__DOT__PA[0U] 
                                     >> 0x1eU) | (vlSelf->Div__DOT__PA[1U] 
                                                  << 2U));
        __Vtemp_h39a32276__0[2U] = ((vlSelf->Div__DOT__PA[1U] 
                                     >> 0x1eU) | (vlSelf->Div__DOT__PA[2U] 
                                                  << 2U));
        __Vtemp_h39a32276__0[3U] = ((vlSelf->Div__DOT__PA[2U] 
                                     >> 0x1eU) | (vlSelf->Div__DOT__PA[3U] 
                                                  << 2U));
        __Vtemp_h39a32276__0[4U] = ((vlSelf->Div__DOT__PA[3U] 
                                     >> 0x1eU) | (vlSelf->Div__DOT__PA[4U] 
                                                  << 2U));
        tracep->chgWData(oldp+9,(__Vtemp_h39a32276__0),131);
        tracep->chgQData(oldp+14,(vlSelf->Div__DOT__B),64);
        __Vtemp_h5e726cb9__0[0U] = 1U;
        __Vtemp_h5e726cb9__0[1U] = 0U;
        __Vtemp_h5e726cb9__0[2U] = 0U;
        VL_EXTEND_WQ(65,64, __Vtemp_h9f986060__0, vlSelf->Div__DOT__B);
        __Vtemp_h6e31414e__0[0U] = (~ __Vtemp_h9f986060__0[0U]);
        __Vtemp_h6e31414e__0[1U] = (~ __Vtemp_h9f986060__0[1U]);
        __Vtemp_h6e31414e__0[2U] = (~ __Vtemp_h9f986060__0[2U]);
        VL_ADD_W(3, __Vtemp_h676c64b4__0, __Vtemp_h5e726cb9__0, __Vtemp_h6e31414e__0);
        __Vtemp_h7f27db8a__0[0U] = __Vtemp_h676c64b4__0[0U];
        __Vtemp_h7f27db8a__0[1U] = __Vtemp_h676c64b4__0[1U];
        __Vtemp_h7f27db8a__0[2U] = (1U & __Vtemp_h676c64b4__0[2U]);
        tracep->chgWData(oldp+16,(__Vtemp_h7f27db8a__0),65);
        __Vtemp_h5e726cb9__1[0U] = 1U;
        __Vtemp_h5e726cb9__1[1U] = 0U;
        __Vtemp_h5e726cb9__1[2U] = 0U;
        VL_EXTEND_WQ(65,64, __Vtemp_h9f986060__1, vlSelf->Div__DOT__B);
        __Vtemp_h88b01313__0[0U] = (~ __Vtemp_h9f986060__1[0U]);
        __Vtemp_h88b01313__0[1U] = (~ __Vtemp_h9f986060__1[1U]);
        __Vtemp_h88b01313__0[2U] = (~ __Vtemp_h9f986060__1[2U]);
        VL_ADD_W(3, __Vtemp_hef05ea1e__0, __Vtemp_h5e726cb9__1, __Vtemp_h88b01313__0);
        __Vtemp_h57b3d82e__0[0U] = (__Vtemp_hef05ea1e__0[0U] 
                                    << 1U);
        __Vtemp_h57b3d82e__0[1U] = ((__Vtemp_hef05ea1e__0[0U] 
                                     >> 0x1fU) | (__Vtemp_hef05ea1e__0[1U] 
                                                  << 1U));
        __Vtemp_h57b3d82e__0[2U] = ((__Vtemp_hef05ea1e__0[1U] 
                                     >> 0x1fU) | (2U 
                                                  & (__Vtemp_hef05ea1e__0[2U] 
                                                     << 1U)));
        tracep->chgWData(oldp+19,(__Vtemp_h57b3d82e__0),66);
        tracep->chgCData(oldp+22,((0xfU & (IData)((vlSelf->Div__DOT__B 
                                                   >> 0x3cU)))),4);
        tracep->chgCData(oldp+23,((0x7eU & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                             - (IData)(8U)) 
                                            << 1U))),7);
        tracep->chgCData(oldp+24,(vlSelf->Div__DOT__cnt),6);
        tracep->chgBit(oldp+25,((1U & vlSelf->Div__DOT__PA[4U])));
        tracep->chgQData(oldp+26,(vlSelf->Div__DOT__pos_quo),64);
        tracep->chgQData(oldp+28,(vlSelf->Div__DOT__neg_quo),64);
        tracep->chgBit(oldp+30,(vlSelf->Div__DOT__qNeg1));
        tracep->chgBit(oldp+31,(vlSelf->Div__DOT__q0));
        tracep->chgBit(oldp+32,(vlSelf->Div__DOT__q1));
        tracep->chgBit(oldp+33,(vlSelf->Div__DOT__q2));
        tracep->chgCData(oldp+34,(vlSelf->Div__DOT__qSel),3);
    }
    tracep->chgBit(oldp+35,(vlSelf->clock));
    tracep->chgBit(oldp+36,(vlSelf->reset));
    tracep->chgQData(oldp+37,(vlSelf->io_a),64);
    tracep->chgQData(oldp+39,(vlSelf->io_b),64);
    tracep->chgBit(oldp+41,(vlSelf->io_start));
    tracep->chgQData(oldp+42,(vlSelf->io_rem),64);
    tracep->chgQData(oldp+44,(vlSelf->io_quo),64);
    tracep->chgBit(oldp+46,(vlSelf->io_finish));
    tracep->chgCData(oldp+47,(vlSelf->Div__DOT__clz),6);
}

void VDiv___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDiv___024root__trace_cleanup\n"); );
    // Init
    VDiv___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VDiv___024root*>(voidSelf);
    VDiv__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
}
