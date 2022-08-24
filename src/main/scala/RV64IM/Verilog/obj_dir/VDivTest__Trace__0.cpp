// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VDivTest__Syms.h"


void VDivTest___024root__trace_chg_sub_0(VDivTest___024root* vlSelf, VerilatedVcd* tracep);

void VDivTest___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root__trace_chg_top_0\n"); );
    // Init
    VDivTest___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VDivTest___024root*>(voidSelf);
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    VDivTest___024root__trace_chg_sub_0((&vlSymsp->TOP), tracep);
}

void VDivTest___024root__trace_chg_sub_0(VDivTest___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root__trace_chg_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = tracep->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
        tracep->chgCData(oldp+0,(vlSelf->DivTest__DOT__state),2);
        tracep->chgIData(oldp+1,(vlSelf->DivTest__DOT__PA),17);
        tracep->chgSData(oldp+2,((0x1ffU & (vlSelf->DivTest__DOT__PA 
                                            >> 8U))),9);
        tracep->chgIData(oldp+3,((vlSelf->DivTest__DOT__PA 
                                  << 2U)),19);
        tracep->chgCData(oldp+4,(vlSelf->DivTest__DOT__B),8);
        tracep->chgSData(oldp+5,((0x1ffU & ((IData)(1U) 
                                            + (~ (IData)(vlSelf->DivTest__DOT__B))))),9);
        tracep->chgSData(oldp+6,((0x3feU & (((IData)(1U) 
                                             + (~ (IData)(vlSelf->DivTest__DOT__B))) 
                                            << 1U))),10);
        tracep->chgCData(oldp+7,((0xfU & ((IData)(vlSelf->DivTest__DOT__B) 
                                          >> 4U))),4);
        tracep->chgCData(oldp+8,((0x7eU & (((IData)(vlSelf->DivTest__DOT___offset_T_4) 
                                            - (IData)(8U)) 
                                           << 1U))),7);
        tracep->chgCData(oldp+9,(vlSelf->DivTest__DOT__cnt),6);
        tracep->chgBit(oldp+10,((1U & (vlSelf->DivTest__DOT__PA 
                                       >> 0x10U))));
        tracep->chgCData(oldp+11,(vlSelf->DivTest__DOT__pos_quo),8);
        tracep->chgCData(oldp+12,(vlSelf->DivTest__DOT__neg_quo),8);
        tracep->chgBit(oldp+13,((VL_GTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_239)) 
                                 & VL_LTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_319)))));
        tracep->chgBit(oldp+14,((VL_GTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_399)) 
                                 & VL_LTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_479)))));
        tracep->chgBit(oldp+15,((VL_GTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_559)) 
                                 & VL_LTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_639)))));
        tracep->chgBit(oldp+16,((VL_GTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_719)) 
                                 & VL_LTES_III(6, (IData)(vlSelf->DivTest__DOT___GEN_846), (IData)(vlSelf->DivTest__DOT___GEN_799)))));
        tracep->chgCData(oldp+17,(vlSelf->DivTest__DOT__qSel),3);
    }
    tracep->chgBit(oldp+18,(vlSelf->clock));
    tracep->chgBit(oldp+19,(vlSelf->reset));
    tracep->chgCData(oldp+20,(vlSelf->io_a),8);
    tracep->chgCData(oldp+21,(vlSelf->io_b),8);
    tracep->chgBit(oldp+22,(vlSelf->io_start));
    tracep->chgCData(oldp+23,(vlSelf->io_rem),8);
    tracep->chgCData(oldp+24,(vlSelf->io_quo),8);
    tracep->chgBit(oldp+25,(vlSelf->io_finish));
    tracep->chgCData(oldp+26,(vlSelf->io_state),2);
    tracep->chgIData(oldp+27,(vlSelf->io_PA),17);
    tracep->chgCData(oldp+28,(vlSelf->io_cnt),6);
    tracep->chgCData(oldp+29,(vlSelf->io_B),8);
    tracep->chgBit(oldp+30,(vlSelf->io_qNeg2));
    tracep->chgBit(oldp+31,(vlSelf->io_qNeg1));
    tracep->chgBit(oldp+32,(vlSelf->io_q0));
    tracep->chgBit(oldp+33,(vlSelf->io_q1));
    tracep->chgBit(oldp+34,(vlSelf->io_q2));
    tracep->chgSData(oldp+35,(vlSelf->io_p),9);
    tracep->chgCData(oldp+36,(vlSelf->io_whichTable),4);
    tracep->chgCData(oldp+37,(vlSelf->io_pq),8);
    tracep->chgCData(oldp+38,(vlSelf->io_nq),8);
    tracep->chgSData(oldp+39,(vlSelf->io_negB),9);
    tracep->chgCData(oldp+40,(vlSelf->DivTest__DOT__clz),3);
}

void VDivTest___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root__trace_cleanup\n"); );
    // Init
    VDivTest___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VDivTest___024root*>(voidSelf);
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
}
