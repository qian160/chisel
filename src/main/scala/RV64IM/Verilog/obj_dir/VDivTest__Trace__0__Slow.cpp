// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VDivTest__Syms.h"


VL_ATTR_COLD void VDivTest___024root__trace_init_sub__TOP__0(VDivTest___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root__trace_init_sub__TOP__0\n"); );
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBit(c+19,"clock", false,-1);
    tracep->declBit(c+20,"reset", false,-1);
    tracep->declBus(c+21,"io_a", false,-1, 7,0);
    tracep->declBus(c+22,"io_b", false,-1, 7,0);
    tracep->declBit(c+23,"io_start", false,-1);
    tracep->declBus(c+24,"io_rem", false,-1, 7,0);
    tracep->declBus(c+25,"io_quo", false,-1, 7,0);
    tracep->declBit(c+26,"io_finish", false,-1);
    tracep->declBus(c+27,"io_state", false,-1, 1,0);
    tracep->declBus(c+28,"io_PA", false,-1, 16,0);
    tracep->declBus(c+29,"io_cnt", false,-1, 5,0);
    tracep->declBus(c+30,"io_B", false,-1, 7,0);
    tracep->declBit(c+31,"io_qNeg2", false,-1);
    tracep->declBit(c+32,"io_qNeg1", false,-1);
    tracep->declBit(c+33,"io_q0", false,-1);
    tracep->declBit(c+34,"io_q1", false,-1);
    tracep->declBit(c+35,"io_q2", false,-1);
    tracep->declBus(c+36,"io_p", false,-1, 8,0);
    tracep->declBus(c+37,"io_whichTable", false,-1, 3,0);
    tracep->declBus(c+38,"io_pq", false,-1, 7,0);
    tracep->declBus(c+39,"io_nq", false,-1, 7,0);
    tracep->declBus(c+40,"io_negB", false,-1, 8,0);
    tracep->pushNamePrefix("DivTest ");
    tracep->declBit(c+19,"clock", false,-1);
    tracep->declBit(c+20,"reset", false,-1);
    tracep->declBus(c+21,"io_a", false,-1, 7,0);
    tracep->declBus(c+22,"io_b", false,-1, 7,0);
    tracep->declBit(c+23,"io_start", false,-1);
    tracep->declBus(c+24,"io_rem", false,-1, 7,0);
    tracep->declBus(c+25,"io_quo", false,-1, 7,0);
    tracep->declBit(c+26,"io_finish", false,-1);
    tracep->declBus(c+27,"io_state", false,-1, 1,0);
    tracep->declBus(c+28,"io_PA", false,-1, 16,0);
    tracep->declBus(c+29,"io_cnt", false,-1, 5,0);
    tracep->declBus(c+30,"io_B", false,-1, 7,0);
    tracep->declBit(c+31,"io_qNeg2", false,-1);
    tracep->declBit(c+32,"io_qNeg1", false,-1);
    tracep->declBit(c+33,"io_q0", false,-1);
    tracep->declBit(c+34,"io_q1", false,-1);
    tracep->declBit(c+35,"io_q2", false,-1);
    tracep->declBus(c+36,"io_p", false,-1, 8,0);
    tracep->declBus(c+37,"io_whichTable", false,-1, 3,0);
    tracep->declBus(c+38,"io_pq", false,-1, 7,0);
    tracep->declBus(c+39,"io_nq", false,-1, 7,0);
    tracep->declBus(c+40,"io_negB", false,-1, 8,0);
    tracep->declBus(c+1,"state", false,-1, 1,0);
    tracep->declBus(c+2,"PA", false,-1, 16,0);
    tracep->declBus(c+3,"P", false,-1, 8,0);
    tracep->declBus(c+4,"PASL2", false,-1, 18,0);
    tracep->declBus(c+5,"B", false,-1, 7,0);
    tracep->declBus(c+6,"negB", false,-1, 8,0);
    tracep->declBus(c+7,"neg2B", false,-1, 9,0);
    tracep->declBus(c+41,"clz", false,-1, 2,0);
    tracep->declBus(c+8,"whichTable", false,-1, 3,0);
    tracep->declBus(c+9,"offset", false,-1, 6,0);
    tracep->declBus(c+10,"cnt", false,-1, 5,0);
    tracep->declBit(c+11,"P_neg", false,-1);
    tracep->declBus(c+12,"pos_quo", false,-1, 7,0);
    tracep->declBus(c+13,"neg_quo", false,-1, 7,0);
    tracep->declBit(c+14,"qNeg1", false,-1);
    tracep->declBit(c+15,"q0", false,-1);
    tracep->declBit(c+16,"q1", false,-1);
    tracep->declBit(c+17,"q2", false,-1);
    tracep->declBus(c+18,"qSel", false,-1, 2,0);
    tracep->popNamePrefix(1);
}

VL_ATTR_COLD void VDivTest___024root__trace_init_top(VDivTest___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root__trace_init_top\n"); );
    // Body
    VDivTest___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void VDivTest___024root__trace_full_top_0(void* voidSelf, VerilatedVcd* tracep);
void VDivTest___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd* tracep);
void VDivTest___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void VDivTest___024root__trace_register(VDivTest___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root__trace_register\n"); );
    // Body
    tracep->addFullCb(&VDivTest___024root__trace_full_top_0, vlSelf);
    tracep->addChgCb(&VDivTest___024root__trace_chg_top_0, vlSelf);
    tracep->addCleanupCb(&VDivTest___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void VDivTest___024root__trace_full_sub_0(VDivTest___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void VDivTest___024root__trace_full_top_0(void* voidSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root__trace_full_top_0\n"); );
    // Init
    VDivTest___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VDivTest___024root*>(voidSelf);
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VDivTest___024root__trace_full_sub_0((&vlSymsp->TOP), tracep);
}

VL_ATTR_COLD void VDivTest___024root__trace_full_sub_0(VDivTest___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root__trace_full_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = tracep->oldp(vlSymsp->__Vm_baseCode);
    // Body
    tracep->fullCData(oldp+1,(vlSelf->DivTest__DOT__state),2);
    tracep->fullIData(oldp+2,(vlSelf->DivTest__DOT__PA),17);
    tracep->fullSData(oldp+3,((0x1ffU & (vlSelf->DivTest__DOT__PA 
                                         >> 8U))),9);
    tracep->fullIData(oldp+4,((vlSelf->DivTest__DOT__PA 
                               << 2U)),19);
    tracep->fullCData(oldp+5,(vlSelf->DivTest__DOT__B),8);
    tracep->fullSData(oldp+6,((0x1ffU & ((IData)(1U) 
                                         + (~ (IData)(vlSelf->DivTest__DOT__B))))),9);
    tracep->fullSData(oldp+7,((0x3feU & (((IData)(1U) 
                                          + (~ (IData)(vlSelf->DivTest__DOT__B))) 
                                         << 1U))),10);
    tracep->fullCData(oldp+8,((0xfU & ((IData)(vlSelf->DivTest__DOT__B) 
                                       >> 4U))),4);
    tracep->fullCData(oldp+9,((0x7eU & (((IData)(vlSelf->DivTest__DOT___offset_T_4) 
                                         - (IData)(8U)) 
                                        << 1U))),7);
    tracep->fullCData(oldp+10,(vlSelf->DivTest__DOT__cnt),6);
    tracep->fullBit(oldp+11,((1U & (vlSelf->DivTest__DOT__PA 
                                    >> 0x10U))));
    tracep->fullCData(oldp+12,(vlSelf->DivTest__DOT__pos_quo),8);
    tracep->fullCData(oldp+13,(vlSelf->DivTest__DOT__neg_quo),8);
    tracep->fullBit(oldp+14,((VL_GTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_239)) 
                              & VL_LTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_319)))));
    tracep->fullBit(oldp+15,((VL_GTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_399)) 
                              & VL_LTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_479)))));
    tracep->fullBit(oldp+16,((VL_GTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_559)) 
                              & VL_LTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_639)))));
    tracep->fullBit(oldp+17,((VL_GTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_719)) 
                              & VL_LTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_799)))));
    tracep->fullCData(oldp+18,(vlSelf->DivTest__DOT__qSel),3);
    tracep->fullBit(oldp+19,(vlSelf->clock));
    tracep->fullBit(oldp+20,(vlSelf->reset));
    tracep->fullCData(oldp+21,(vlSelf->io_a),8);
    tracep->fullCData(oldp+22,(vlSelf->io_b),8);
    tracep->fullBit(oldp+23,(vlSelf->io_start));
    tracep->fullCData(oldp+24,(vlSelf->io_rem),8);
    tracep->fullCData(oldp+25,(vlSelf->io_quo),8);
    tracep->fullBit(oldp+26,(vlSelf->io_finish));
    tracep->fullCData(oldp+27,(vlSelf->io_state),2);
    tracep->fullIData(oldp+28,(vlSelf->io_PA),17);
    tracep->fullCData(oldp+29,(vlSelf->io_cnt),6);
    tracep->fullCData(oldp+30,(vlSelf->io_B),8);
    tracep->fullBit(oldp+31,(vlSelf->io_qNeg2));
    tracep->fullBit(oldp+32,(vlSelf->io_qNeg1));
    tracep->fullBit(oldp+33,(vlSelf->io_q0));
    tracep->fullBit(oldp+34,(vlSelf->io_q1));
    tracep->fullBit(oldp+35,(vlSelf->io_q2));
    tracep->fullSData(oldp+36,(vlSelf->io_p),9);
    tracep->fullCData(oldp+37,(vlSelf->io_whichTable),4);
    tracep->fullCData(oldp+38,(vlSelf->io_pq),8);
    tracep->fullCData(oldp+39,(vlSelf->io_nq),8);
    tracep->fullSData(oldp+40,(vlSelf->io_negB),9);
    tracep->fullCData(oldp+41,(vlSelf->DivTest__DOT__clz),3);
}
