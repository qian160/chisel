// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VDiv__Syms.h"


VL_ATTR_COLD void VDiv___024root__trace_init_sub__TOP__0(VDiv___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VDiv__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDiv___024root__trace_init_sub__TOP__0\n"); );
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBit(c+36,"clock", false,-1);
    tracep->declBit(c+37,"reset", false,-1);
    tracep->declQuad(c+38,"io_a", false,-1, 63,0);
    tracep->declQuad(c+40,"io_b", false,-1, 63,0);
    tracep->declBit(c+42,"io_start", false,-1);
    tracep->declQuad(c+43,"io_rem", false,-1, 63,0);
    tracep->declQuad(c+45,"io_quo", false,-1, 63,0);
    tracep->declBit(c+47,"io_finish", false,-1);
    tracep->pushNamePrefix("Div ");
    tracep->declBit(c+36,"clock", false,-1);
    tracep->declBit(c+37,"reset", false,-1);
    tracep->declQuad(c+38,"io_a", false,-1, 63,0);
    tracep->declQuad(c+40,"io_b", false,-1, 63,0);
    tracep->declBit(c+42,"io_start", false,-1);
    tracep->declQuad(c+43,"io_rem", false,-1, 63,0);
    tracep->declQuad(c+45,"io_quo", false,-1, 63,0);
    tracep->declBit(c+47,"io_finish", false,-1);
    tracep->declBus(c+1,"state", false,-1, 1,0);
    tracep->declArray(c+2,"PA", false,-1, 128,0);
    tracep->declArray(c+7,"P", false,-1, 64,0);
    tracep->declArray(c+10,"PASL2", false,-1, 130,0);
    tracep->declQuad(c+15,"B", false,-1, 63,0);
    tracep->declArray(c+17,"negB", false,-1, 64,0);
    tracep->declArray(c+20,"neg2B", false,-1, 65,0);
    tracep->declBus(c+48,"clz", false,-1, 5,0);
    tracep->declBus(c+23,"whichTable", false,-1, 3,0);
    tracep->declBus(c+24,"offset", false,-1, 6,0);
    tracep->declBus(c+25,"cnt", false,-1, 5,0);
    tracep->declBit(c+26,"P_neg", false,-1);
    tracep->declQuad(c+27,"pos_quo", false,-1, 63,0);
    tracep->declQuad(c+29,"neg_quo", false,-1, 63,0);
    tracep->declBit(c+31,"qNeg1", false,-1);
    tracep->declBit(c+32,"q0", false,-1);
    tracep->declBit(c+33,"q1", false,-1);
    tracep->declBit(c+34,"q2", false,-1);
    tracep->declBus(c+35,"qSel", false,-1, 2,0);
    tracep->popNamePrefix(1);
}

VL_ATTR_COLD void VDiv___024root__trace_init_top(VDiv___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VDiv__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDiv___024root__trace_init_top\n"); );
    // Body
    VDiv___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void VDiv___024root__trace_full_top_0(void* voidSelf, VerilatedVcd* tracep);
void VDiv___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd* tracep);
void VDiv___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void VDiv___024root__trace_register(VDiv___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VDiv__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDiv___024root__trace_register\n"); );
    // Body
    tracep->addFullCb(&VDiv___024root__trace_full_top_0, vlSelf);
    tracep->addChgCb(&VDiv___024root__trace_chg_top_0, vlSelf);
    tracep->addCleanupCb(&VDiv___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void VDiv___024root__trace_full_sub_0(VDiv___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void VDiv___024root__trace_full_top_0(void* voidSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDiv___024root__trace_full_top_0\n"); );
    // Init
    VDiv___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VDiv___024root*>(voidSelf);
    VDiv__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VDiv___024root__trace_full_sub_0((&vlSymsp->TOP), tracep);
}

VL_ATTR_COLD void VDiv___024root__trace_full_sub_0(VDiv___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VDiv__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDiv___024root__trace_full_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = tracep->oldp(vlSymsp->__Vm_baseCode);
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
    tracep->fullCData(oldp+1,(vlSelf->Div__DOT__state),2);
    tracep->fullWData(oldp+2,(vlSelf->Div__DOT__PA),129);
    __Vtemp_h3a8cc253__0[0U] = vlSelf->Div__DOT__PA[2U];
    __Vtemp_h3a8cc253__0[1U] = vlSelf->Div__DOT__PA[3U];
    __Vtemp_h3a8cc253__0[2U] = (1U & vlSelf->Div__DOT__PA[4U]);
    tracep->fullWData(oldp+7,(__Vtemp_h3a8cc253__0),65);
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
    tracep->fullWData(oldp+10,(__Vtemp_h39a32276__0),131);
    tracep->fullQData(oldp+15,(vlSelf->Div__DOT__B),64);
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
    tracep->fullWData(oldp+17,(__Vtemp_h7f27db8a__0),65);
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
                                 >> 0x1fU) | (2U & 
                                              (__Vtemp_hef05ea1e__0[2U] 
                                               << 1U)));
    tracep->fullWData(oldp+20,(__Vtemp_h57b3d82e__0),66);
    tracep->fullCData(oldp+23,((0xfU & (IData)((vlSelf->Div__DOT__B 
                                                >> 0x3cU)))),4);
    tracep->fullCData(oldp+24,((0x7eU & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                          - (IData)(8U)) 
                                         << 1U))),7);
    tracep->fullCData(oldp+25,(vlSelf->Div__DOT__cnt),6);
    tracep->fullBit(oldp+26,((1U & vlSelf->Div__DOT__PA[4U])));
    tracep->fullQData(oldp+27,(vlSelf->Div__DOT__pos_quo),64);
    tracep->fullQData(oldp+29,(vlSelf->Div__DOT__neg_quo),64);
    tracep->fullBit(oldp+31,(vlSelf->Div__DOT__qNeg1));
    tracep->fullBit(oldp+32,(vlSelf->Div__DOT__q0));
    tracep->fullBit(oldp+33,(vlSelf->Div__DOT__q1));
    tracep->fullBit(oldp+34,(vlSelf->Div__DOT__q2));
    tracep->fullCData(oldp+35,(vlSelf->Div__DOT__qSel),3);
    tracep->fullBit(oldp+36,(vlSelf->clock));
    tracep->fullBit(oldp+37,(vlSelf->reset));
    tracep->fullQData(oldp+38,(vlSelf->io_a),64);
    tracep->fullQData(oldp+40,(vlSelf->io_b),64);
    tracep->fullBit(oldp+42,(vlSelf->io_start));
    tracep->fullQData(oldp+43,(vlSelf->io_rem),64);
    tracep->fullQData(oldp+45,(vlSelf->io_quo),64);
    tracep->fullBit(oldp+47,(vlSelf->io_finish));
    tracep->fullCData(oldp+48,(vlSelf->Div__DOT__clz),6);
}
