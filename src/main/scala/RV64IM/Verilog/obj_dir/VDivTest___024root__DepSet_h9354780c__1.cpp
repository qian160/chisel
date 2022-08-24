// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VDivTest.h for the primary calling header

#include "verilated.h"

#include "VDivTest___024root.h"

VL_INLINE_OPT void VDivTest___024root___combo__TOP__0(VDivTest___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root___combo__TOP__0\n"); );
    // Init
    CData/*7:0*/ DivTest__DOT___clz_T_8;
    CData/*7:0*/ DivTest__DOT___clz_T_18;
    CData/*7:0*/ DivTest__DOT___clz_T_28;
    VlWide<3>/*95:0*/ __Vtemp_hd930716e__0;
    VlWide<3>/*95:0*/ __Vtemp_hd930716e__1;
    VlWide<3>/*95:0*/ __Vtemp_hd930716e__2;
    VlWide<3>/*95:0*/ __Vtemp_h8025e7a2__0;
    VlWide<3>/*95:0*/ __Vtemp_hd930716e__3;
    VlWide<3>/*95:0*/ __Vtemp_hd930716e__4;
    VlWide<3>/*95:0*/ __Vtemp_h0ae4750c__0;
    VlWide<3>/*95:0*/ __Vtemp_h92c57fd8__0;
    // Body
    DivTest__DOT___clz_T_8 = ((0xfU & ((IData)(vlSelf->io_b) 
                                       >> 4U)) | (0xf0U 
                                                  & ((IData)(vlSelf->io_b) 
                                                     << 4U)));
    VL_EXTEND_WI(65,8, __Vtemp_hd930716e__0, (IData)(vlSelf->DivTest__DOT__pos_quo));
    VL_EXTEND_WI(65,8, __Vtemp_hd930716e__1, (IData)(vlSelf->DivTest__DOT__pos_quo));
    VL_EXTEND_WI(65,8, __Vtemp_hd930716e__2, (IData)(vlSelf->DivTest__DOT__pos_quo));
    VL_EXTEND_WQ(65,64, __Vtemp_h8025e7a2__0, vlSelf->DivTest__DOT___neg_quo_T_6);
    VL_EXTEND_WI(65,8, __Vtemp_hd930716e__3, (IData)(vlSelf->DivTest__DOT__pos_quo));
    VL_EXTEND_WI(65,8, __Vtemp_hd930716e__4, (IData)(vlSelf->DivTest__DOT__pos_quo));
    if (vlSelf->reset) {
        vlSelf->DivTest__DOT___GEN_855[0U] = 0U;
        vlSelf->DivTest__DOT___GEN_855[1U] = 0U;
        vlSelf->DivTest__DOT___GEN_855[2U] = 0U;
    } else if ((0U == (IData)(vlSelf->DivTest__DOT__state))) {
        vlSelf->DivTest__DOT___GEN_855[0U] = 0U;
        vlSelf->DivTest__DOT___GEN_855[1U] = 0U;
        vlSelf->DivTest__DOT___GEN_855[2U] = 0U;
    } else if ((1U == (IData)(vlSelf->DivTest__DOT__state))) {
        if ((6U == (IData)(vlSelf->DivTest__DOT__qSel))) {
            vlSelf->DivTest__DOT___GEN_855[0U] = __Vtemp_hd930716e__0[0U];
            vlSelf->DivTest__DOT___GEN_855[1U] = __Vtemp_hd930716e__0[1U];
            vlSelf->DivTest__DOT___GEN_855[2U] = __Vtemp_hd930716e__0[2U];
        } else if ((7U == (IData)(vlSelf->DivTest__DOT__qSel))) {
            vlSelf->DivTest__DOT___GEN_855[0U] = __Vtemp_hd930716e__1[0U];
            vlSelf->DivTest__DOT___GEN_855[1U] = __Vtemp_hd930716e__1[1U];
            vlSelf->DivTest__DOT___GEN_855[2U] = __Vtemp_hd930716e__1[2U];
        } else if ((0U == (IData)(vlSelf->DivTest__DOT__qSel))) {
            vlSelf->DivTest__DOT___GEN_855[0U] = __Vtemp_hd930716e__2[0U];
            vlSelf->DivTest__DOT___GEN_855[1U] = __Vtemp_hd930716e__2[1U];
            vlSelf->DivTest__DOT___GEN_855[2U] = __Vtemp_hd930716e__2[2U];
        } else if ((1U == (IData)(vlSelf->DivTest__DOT__qSel))) {
            vlSelf->DivTest__DOT___GEN_855[0U] = __Vtemp_h8025e7a2__0[0U];
            vlSelf->DivTest__DOT___GEN_855[1U] = __Vtemp_h8025e7a2__0[1U];
            vlSelf->DivTest__DOT___GEN_855[2U] = __Vtemp_h8025e7a2__0[2U];
        } else if ((2U == (IData)(vlSelf->DivTest__DOT__qSel))) {
            vlSelf->DivTest__DOT___GEN_855[0U] = vlSelf->DivTest__DOT___neg_quo_T_3[0U];
            vlSelf->DivTest__DOT___GEN_855[1U] = vlSelf->DivTest__DOT___neg_quo_T_3[1U];
            vlSelf->DivTest__DOT___GEN_855[2U] = vlSelf->DivTest__DOT___neg_quo_T_3[2U];
        } else {
            vlSelf->DivTest__DOT___GEN_855[0U] = __Vtemp_hd930716e__3[0U];
            vlSelf->DivTest__DOT___GEN_855[1U] = __Vtemp_hd930716e__3[1U];
            vlSelf->DivTest__DOT___GEN_855[2U] = __Vtemp_hd930716e__3[2U];
        }
    } else {
        vlSelf->DivTest__DOT___GEN_855[0U] = __Vtemp_hd930716e__4[0U];
        vlSelf->DivTest__DOT___GEN_855[1U] = __Vtemp_hd930716e__4[1U];
        vlSelf->DivTest__DOT___GEN_855[2U] = __Vtemp_hd930716e__4[2U];
    }
    VL_EXTEND_WQ(65,64, __Vtemp_h0ae4750c__0, ((7U 
                                                == (IData)(vlSelf->DivTest__DOT__qSel))
                                                ? vlSelf->DivTest__DOT___neg_quo_T_6
                                                : (QData)((IData)(vlSelf->DivTest__DOT__neg_quo))));
    VL_EXTEND_WI(65,8, __Vtemp_h92c57fd8__0, (IData)(vlSelf->DivTest__DOT__neg_quo));
    if (vlSelf->reset) {
        vlSelf->DivTest__DOT___GEN_856[0U] = 0U;
        vlSelf->DivTest__DOT___GEN_856[1U] = 0U;
        vlSelf->DivTest__DOT___GEN_856[2U] = 0U;
    } else if ((0U == (IData)(vlSelf->DivTest__DOT__state))) {
        vlSelf->DivTest__DOT___GEN_856[0U] = 0U;
        vlSelf->DivTest__DOT___GEN_856[1U] = 0U;
        vlSelf->DivTest__DOT___GEN_856[2U] = 0U;
    } else if ((1U == (IData)(vlSelf->DivTest__DOT__state))) {
        if ((6U == (IData)(vlSelf->DivTest__DOT__qSel))) {
            vlSelf->DivTest__DOT___GEN_856[0U] = vlSelf->DivTest__DOT___neg_quo_T_3[0U];
            vlSelf->DivTest__DOT___GEN_856[1U] = vlSelf->DivTest__DOT___neg_quo_T_3[1U];
            vlSelf->DivTest__DOT___GEN_856[2U] = vlSelf->DivTest__DOT___neg_quo_T_3[2U];
        } else {
            vlSelf->DivTest__DOT___GEN_856[0U] = __Vtemp_h0ae4750c__0[0U];
            vlSelf->DivTest__DOT___GEN_856[1U] = __Vtemp_h0ae4750c__0[1U];
            vlSelf->DivTest__DOT___GEN_856[2U] = __Vtemp_h0ae4750c__0[2U];
        }
    } else {
        vlSelf->DivTest__DOT___GEN_856[0U] = __Vtemp_h92c57fd8__0[0U];
        vlSelf->DivTest__DOT___GEN_856[1U] = __Vtemp_h92c57fd8__0[1U];
        vlSelf->DivTest__DOT___GEN_856[2U] = __Vtemp_h92c57fd8__0[2U];
    }
    DivTest__DOT___clz_T_18 = ((0x33U & ((IData)(DivTest__DOT___clz_T_8) 
                                         >> 2U)) | 
                               (0xccU & ((IData)(DivTest__DOT___clz_T_8) 
                                         << 2U)));
    DivTest__DOT___clz_T_28 = ((0x55U & ((IData)(DivTest__DOT___clz_T_18) 
                                         >> 1U)) | 
                               (0xaaU & ((IData)(DivTest__DOT___clz_T_18) 
                                         << 1U)));
    vlSelf->DivTest__DOT__clz = ((1U & (IData)(DivTest__DOT___clz_T_28))
                                  ? 0U : ((2U & (IData)(DivTest__DOT___clz_T_28))
                                           ? 1U : (
                                                   (4U 
                                                    & (IData)(DivTest__DOT___clz_T_28))
                                                    ? 2U
                                                    : 
                                                   ((8U 
                                                     & (IData)(DivTest__DOT___clz_T_28))
                                                     ? 3U
                                                     : 
                                                    ((0x10U 
                                                      & (IData)(DivTest__DOT___clz_T_28))
                                                      ? 4U
                                                      : 
                                                     ((0x20U 
                                                       & (IData)(DivTest__DOT___clz_T_28))
                                                       ? 5U
                                                       : 
                                                      ((0x40U 
                                                        & (IData)(DivTest__DOT___clz_T_28))
                                                        ? 6U
                                                        : 7U)))))));
    vlSelf->io_rem = (0xffU & ((0U == (IData)(vlSelf->DivTest__DOT__state))
                                ? (vlSelf->DivTest__DOT__PA 
                                   >> 8U) : ((1U == (IData)(vlSelf->DivTest__DOT__state))
                                              ? (vlSelf->DivTest__DOT__PA 
                                                 >> 8U)
                                              : ((3U 
                                                  == (IData)(vlSelf->DivTest__DOT__state))
                                                  ? 0U
                                                  : 
                                                 ((2U 
                                                   == (IData)(vlSelf->DivTest__DOT__state))
                                                   ? 
                                                  (0xffU 
                                                   & ((0x10000U 
                                                       & vlSelf->DivTest__DOT__PA)
                                                       ? 
                                                      ((0xffU 
                                                        & ((vlSelf->DivTest__DOT__PA 
                                                            >> 8U) 
                                                           + (IData)(vlSelf->DivTest__DOT__B))) 
                                                       >> (IData)(vlSelf->DivTest__DOT__clz))
                                                       : 
                                                      ((0xffU 
                                                        & (vlSelf->DivTest__DOT__PA 
                                                           >> 8U)) 
                                                       >> (IData)(vlSelf->DivTest__DOT__clz))))
                                                   : 
                                                  (vlSelf->DivTest__DOT__PA 
                                                   >> 8U))))));
    if (vlSelf->reset) {
        vlSelf->DivTest__DOT___GEN_854 = 0U;
        vlSelf->DivTest__DOT___GEN_853 = 0U;
    } else if ((0U == (IData)(vlSelf->DivTest__DOT__state))) {
        if (vlSelf->io_start) {
            vlSelf->DivTest__DOT___GEN_854 = (0x7fffU 
                                              & ((IData)(vlSelf->io_b) 
                                                 << (IData)(vlSelf->DivTest__DOT__clz)));
            vlSelf->DivTest__DOT___GEN_853 = (0xffffffU 
                                              & ((IData)(vlSelf->io_a) 
                                                 << (IData)(vlSelf->DivTest__DOT__clz)));
        } else {
            vlSelf->DivTest__DOT___GEN_854 = (0x7fffU 
                                              & (IData)(vlSelf->DivTest__DOT__B));
            vlSelf->DivTest__DOT___GEN_853 = (0xffffffU 
                                              & vlSelf->DivTest__DOT__PA);
        }
    } else {
        vlSelf->DivTest__DOT___GEN_854 = (0x7fffU & (IData)(vlSelf->DivTest__DOT__B));
        vlSelf->DivTest__DOT___GEN_853 = (0xffffffU 
                                          & (0x7ffffU 
                                             & ((1U 
                                                 == (IData)(vlSelf->DivTest__DOT__state))
                                                 ? 
                                                ((6U 
                                                  == (IData)(vlSelf->DivTest__DOT__qSel))
                                                  ? 
                                                 ((vlSelf->DivTest__DOT__PA 
                                                   << 2U) 
                                                  + 
                                                  (0x1ff00U 
                                                   & (((IData)(1U) 
                                                       + 
                                                       (~ 
                                                        ((IData)(vlSelf->DivTest__DOT__B) 
                                                         << 1U))) 
                                                      << 8U)))
                                                  : 
                                                 ((7U 
                                                   == (IData)(vlSelf->DivTest__DOT__qSel))
                                                   ? 
                                                  ((vlSelf->DivTest__DOT__PA 
                                                    << 2U) 
                                                   + 
                                                   (0xff00U 
                                                    & (((IData)(1U) 
                                                        + 
                                                        (~ (IData)(vlSelf->DivTest__DOT__B))) 
                                                       << 8U)))
                                                   : 
                                                  ((0U 
                                                    == (IData)(vlSelf->DivTest__DOT__qSel))
                                                    ? 
                                                   (vlSelf->DivTest__DOT__PA 
                                                    << 2U)
                                                    : 
                                                   ((1U 
                                                     == (IData)(vlSelf->DivTest__DOT__qSel))
                                                     ? vlSelf->DivTest__DOT___PA_T_17
                                                     : 
                                                    ((2U 
                                                      == (IData)(vlSelf->DivTest__DOT__qSel))
                                                      ? vlSelf->DivTest__DOT___PA_T_17
                                                      : vlSelf->DivTest__DOT__PA)))))
                                                 : vlSelf->DivTest__DOT__PA)));
    }
}

void VDivTest___024root___sequent__TOP__0(VDivTest___024root* vlSelf);

void VDivTest___024root___eval(VDivTest___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root___eval\n"); );
    // Body
    if (((IData)(vlSelf->clock) & (~ (IData)(vlSelf->__Vclklast__TOP__clock)))) {
        VDivTest___024root___sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
    }
    VDivTest___024root___combo__TOP__0(vlSelf);
    // Final
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

#ifdef VL_DEBUG
void VDivTest___024root___eval_debug_assertions(VDivTest___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDivTest___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((vlSelf->io_start & 0xfeU))) {
        Verilated::overWidthError("io_start");}
}
#endif  // VL_DEBUG
