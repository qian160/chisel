// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VDiv.h for the primary calling header

#include "verilated.h"

#include "VDiv___024root.h"

VL_INLINE_OPT void VDiv___024root___sequent__TOP__0(VDiv___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDiv__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDiv___024root___sequent__TOP__0\n"); );
    // Init
    QData/*63:0*/ Div__DOT___io_quo_T_1;
    CData/*5:0*/ Div__DOT___GEN_170;
    CData/*5:0*/ Div__DOT___GEN_180;
    CData/*5:0*/ Div__DOT___GEN_190;
    CData/*5:0*/ Div__DOT___GEN_200;
    CData/*5:0*/ Div__DOT___GEN_210;
    CData/*5:0*/ Div__DOT___GEN_220;
    CData/*5:0*/ Div__DOT___GEN_230;
    CData/*5:0*/ Div__DOT___GEN_250;
    CData/*5:0*/ Div__DOT___GEN_260;
    CData/*5:0*/ Div__DOT___GEN_270;
    CData/*5:0*/ Div__DOT___GEN_280;
    CData/*5:0*/ Div__DOT___GEN_290;
    CData/*5:0*/ Div__DOT___GEN_300;
    CData/*5:0*/ Div__DOT___GEN_310;
    CData/*5:0*/ Div__DOT___GEN_330;
    CData/*5:0*/ Div__DOT___GEN_340;
    CData/*5:0*/ Div__DOT___GEN_350;
    CData/*5:0*/ Div__DOT___GEN_360;
    CData/*5:0*/ Div__DOT___GEN_370;
    CData/*5:0*/ Div__DOT___GEN_380;
    CData/*5:0*/ Div__DOT___GEN_390;
    CData/*5:0*/ Div__DOT___GEN_410;
    CData/*5:0*/ Div__DOT___GEN_420;
    CData/*5:0*/ Div__DOT___GEN_430;
    CData/*5:0*/ Div__DOT___GEN_440;
    CData/*5:0*/ Div__DOT___GEN_450;
    CData/*5:0*/ Div__DOT___GEN_460;
    CData/*5:0*/ Div__DOT___GEN_470;
    CData/*5:0*/ Div__DOT___GEN_490;
    CData/*5:0*/ Div__DOT___GEN_500;
    CData/*5:0*/ Div__DOT___GEN_510;
    CData/*5:0*/ Div__DOT___GEN_520;
    CData/*5:0*/ Div__DOT___GEN_530;
    CData/*5:0*/ Div__DOT___GEN_540;
    CData/*5:0*/ Div__DOT___GEN_550;
    CData/*5:0*/ Div__DOT___GEN_570;
    CData/*5:0*/ Div__DOT___GEN_580;
    CData/*5:0*/ Div__DOT___GEN_590;
    CData/*5:0*/ Div__DOT___GEN_600;
    CData/*5:0*/ Div__DOT___GEN_610;
    CData/*5:0*/ Div__DOT___GEN_620;
    CData/*5:0*/ Div__DOT___GEN_630;
    CData/*5:0*/ Div__DOT___GEN_650;
    CData/*5:0*/ Div__DOT___GEN_660;
    CData/*5:0*/ Div__DOT___GEN_670;
    CData/*5:0*/ Div__DOT___GEN_680;
    CData/*5:0*/ Div__DOT___GEN_690;
    CData/*5:0*/ Div__DOT___GEN_700;
    CData/*5:0*/ Div__DOT___GEN_710;
    CData/*5:0*/ Div__DOT___GEN_730;
    CData/*5:0*/ Div__DOT___GEN_740;
    CData/*5:0*/ Div__DOT___GEN_750;
    CData/*5:0*/ Div__DOT___GEN_760;
    CData/*5:0*/ Div__DOT___GEN_770;
    CData/*5:0*/ Div__DOT___GEN_780;
    CData/*5:0*/ Div__DOT___GEN_790;
    CData/*1:0*/ __Vdly__Div__DOT__state;
    // Body
    __Vdly__Div__DOT__state = vlSelf->Div__DOT__state;
    vlSelf->Div__DOT__neg_quo = (((QData)((IData)(vlSelf->Div__DOT___GEN_859[1U])) 
                                  << 0x20U) | (QData)((IData)(
                                                              vlSelf->Div__DOT___GEN_859[0U])));
    vlSelf->Div__DOT__pos_quo = (((QData)((IData)(vlSelf->Div__DOT___GEN_858[1U])) 
                                  << 0x20U) | (QData)((IData)(
                                                              vlSelf->Div__DOT___GEN_858[0U])));
    if (vlSelf->reset) {
        __Vdly__Div__DOT__state = 0U;
        vlSelf->Div__DOT__cnt = 0U;
    } else if ((0U == (IData)(vlSelf->Div__DOT__state))) {
        __Vdly__Div__DOT__state = ((IData)(vlSelf->io_start)
                                    ? ((0ULL == vlSelf->io_b)
                                        ? 3U : 1U) : 0U);
        vlSelf->Div__DOT__cnt = 0x3eU;
    } else if ((1U == (IData)(vlSelf->Div__DOT__state))) {
        __Vdly__Div__DOT__state = ((0U == (IData)(vlSelf->Div__DOT__cnt))
                                    ? 2U : 1U);
        vlSelf->Div__DOT__cnt = vlSelf->Div__DOT___cnt_T_1;
    } else {
        __Vdly__Div__DOT__state = ((3U == (IData)(vlSelf->Div__DOT__state))
                                    ? 2U : (IData)(vlSelf->Div__DOT___GEN_815));
        if ((3U != (IData)(vlSelf->Div__DOT__state))) {
            vlSelf->Div__DOT__cnt = vlSelf->Div__DOT___GEN_816;
        }
    }
    vlSelf->Div__DOT__PA[0U] = vlSelf->Div__DOT___GEN_856[0U];
    vlSelf->Div__DOT__PA[1U] = vlSelf->Div__DOT___GEN_856[1U];
    vlSelf->Div__DOT__PA[2U] = vlSelf->Div__DOT___GEN_856[2U];
    vlSelf->Div__DOT__PA[3U] = vlSelf->Div__DOT___GEN_856[3U];
    vlSelf->Div__DOT__PA[4U] = (1U & vlSelf->Div__DOT___GEN_856[4U]);
    vlSelf->Div__DOT__B = (((QData)((IData)(vlSelf->Div__DOT___GEN_857[1U])) 
                            << 0x20U) | (QData)((IData)(
                                                        vlSelf->Div__DOT___GEN_857[0U])));
    vlSelf->Div__DOT__state = __Vdly__Div__DOT__state;
    Div__DOT___io_quo_T_1 = (vlSelf->Div__DOT__pos_quo 
                             - vlSelf->Div__DOT__neg_quo);
    vlSelf->Div__DOT___cnt_T_1 = (0x3fU & ((IData)(vlSelf->Div__DOT__cnt) 
                                           - (IData)(2U)));
    vlSelf->Div__DOT___GEN_815 = ((2U == (IData)(vlSelf->Div__DOT__state))
                                   ? 2U : (IData)(vlSelf->Div__DOT__state));
    vlSelf->io_finish = ((0U != (IData)(vlSelf->Div__DOT__state)) 
                         & ((1U != (IData)(vlSelf->Div__DOT__state)) 
                            & ((3U == (IData)(vlSelf->Div__DOT__state)) 
                               | (2U == (IData)(vlSelf->Div__DOT__state)))));
    vlSelf->Div__DOT___GEN_816 = ((2U == (IData)(vlSelf->Div__DOT__state))
                                   ? 0U : (IData)(vlSelf->Div__DOT__cnt));
    vlSelf->Div__DOT___offset_T_4 = (0x3fU & ((0x3cU 
                                               & (((IData)(
                                                           (vlSelf->Div__DOT__B 
                                                            >> 0x3cU)) 
                                                   - (IData)(8U)) 
                                                  << 2U)) 
                                              + (0xfU 
                                                 & (IData)(
                                                           (vlSelf->Div__DOT__B 
                                                            >> 0x3cU)))));
    vlSelf->io_quo = ((0U == (IData)(vlSelf->Div__DOT__state))
                       ? Div__DOT___io_quo_T_1 : ((1U 
                                                   == (IData)(vlSelf->Div__DOT__state))
                                                   ? Div__DOT___io_quo_T_1
                                                   : 
                                                  ((3U 
                                                    == (IData)(vlSelf->Div__DOT__state))
                                                    ? 0ULL
                                                    : 
                                                   ((2U 
                                                     == (IData)(vlSelf->Div__DOT__state))
                                                     ? 
                                                    ((1U 
                                                      & vlSelf->Div__DOT__PA[4U])
                                                      ? 
                                                     (Div__DOT___io_quo_T_1 
                                                      - 1ULL)
                                                      : Div__DOT___io_quo_T_1)
                                                     : Div__DOT___io_quo_T_1))));
    Div__DOT___GEN_170 = ((0xaU == (0x7fU & ((IData)(2U) 
                                             + (0x7eU 
                                                & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                    - (IData)(8U)) 
                                                   << 1U)))))
                           ? 0x32U : ((9U == (0x7fU 
                                              & ((IData)(2U) 
                                                 + 
                                                 (0x7eU 
                                                  & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                      - (IData)(8U)) 
                                                     << 1U)))))
                                       ? 0xbU : ((8U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(2U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 6U
                                                  : 
                                                 ((7U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(2U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 5U
                                                   : 
                                                  ((6U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(2U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((5U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(2U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 1U
                                                     : 
                                                    ((4U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(2U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3eU
                                                      : 
                                                     ((3U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(2U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((2U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(2U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3aU
                                                        : 
                                                       ((1U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(2U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x39U
                                                         : 0x34U))))))))));
    Div__DOT___GEN_250 = ((0xaU == (0x7fU & ((IData)(3U) 
                                             + (0x7eU 
                                                & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                    - (IData)(8U)) 
                                                   << 1U)))))
                           ? 0x32U : ((9U == (0x7fU 
                                              & ((IData)(3U) 
                                                 + 
                                                 (0x7eU 
                                                  & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                      - (IData)(8U)) 
                                                     << 1U)))))
                                       ? 0xbU : ((8U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(3U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 6U
                                                  : 
                                                 ((7U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(3U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 5U
                                                   : 
                                                  ((6U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(3U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((5U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(3U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 1U
                                                     : 
                                                    ((4U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(3U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3eU
                                                      : 
                                                     ((3U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(3U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((2U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(3U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3aU
                                                        : 
                                                       ((1U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(3U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x39U
                                                         : 0x34U))))))))));
    Div__DOT___GEN_330 = ((0xaU == (0x7fU & ((IData)(4U) 
                                             + (0x7eU 
                                                & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                    - (IData)(8U)) 
                                                   << 1U)))))
                           ? 0x32U : ((9U == (0x7fU 
                                              & ((IData)(4U) 
                                                 + 
                                                 (0x7eU 
                                                  & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                      - (IData)(8U)) 
                                                     << 1U)))))
                                       ? 0xbU : ((8U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(4U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 6U
                                                  : 
                                                 ((7U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(4U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 5U
                                                   : 
                                                  ((6U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(4U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((5U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(4U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 1U
                                                     : 
                                                    ((4U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(4U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3eU
                                                      : 
                                                     ((3U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(4U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((2U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(4U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3aU
                                                        : 
                                                       ((1U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(4U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x39U
                                                         : 0x34U))))))))));
    Div__DOT___GEN_410 = ((0xaU == (0x7fU & ((IData)(5U) 
                                             + (0x7eU 
                                                & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                    - (IData)(8U)) 
                                                   << 1U)))))
                           ? 0x32U : ((9U == (0x7fU 
                                              & ((IData)(5U) 
                                                 + 
                                                 (0x7eU 
                                                  & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                      - (IData)(8U)) 
                                                     << 1U)))))
                                       ? 0xbU : ((8U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(5U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 6U
                                                  : 
                                                 ((7U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(5U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 5U
                                                   : 
                                                  ((6U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(5U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((5U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(5U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 1U
                                                     : 
                                                    ((4U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(5U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3eU
                                                      : 
                                                     ((3U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(5U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((2U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(5U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3aU
                                                        : 
                                                       ((1U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(5U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x39U
                                                         : 0x34U))))))))));
    Div__DOT___GEN_490 = ((0xaU == (0x7fU & ((IData)(6U) 
                                             + (0x7eU 
                                                & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                    - (IData)(8U)) 
                                                   << 1U)))))
                           ? 0x32U : ((9U == (0x7fU 
                                              & ((IData)(6U) 
                                                 + 
                                                 (0x7eU 
                                                  & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                      - (IData)(8U)) 
                                                     << 1U)))))
                                       ? 0xbU : ((8U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(6U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 6U
                                                  : 
                                                 ((7U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(6U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 5U
                                                   : 
                                                  ((6U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(6U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((5U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(6U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 1U
                                                     : 
                                                    ((4U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(6U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3eU
                                                      : 
                                                     ((3U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(6U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((2U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(6U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3aU
                                                        : 
                                                       ((1U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(6U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x39U
                                                         : 0x34U))))))))));
    Div__DOT___GEN_570 = ((0xaU == (0x7fU & ((IData)(7U) 
                                             + (0x7eU 
                                                & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                    - (IData)(8U)) 
                                                   << 1U)))))
                           ? 0x32U : ((9U == (0x7fU 
                                              & ((IData)(7U) 
                                                 + 
                                                 (0x7eU 
                                                  & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                      - (IData)(8U)) 
                                                     << 1U)))))
                                       ? 0xbU : ((8U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(7U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 6U
                                                  : 
                                                 ((7U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(7U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 5U
                                                   : 
                                                  ((6U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(7U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((5U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(7U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 1U
                                                     : 
                                                    ((4U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(7U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3eU
                                                      : 
                                                     ((3U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(7U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((2U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(7U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3aU
                                                        : 
                                                       ((1U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(7U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x39U
                                                         : 0x34U))))))))));
    Div__DOT___GEN_650 = ((0xaU == (0x7fU & ((IData)(8U) 
                                             + (0x7eU 
                                                & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                    - (IData)(8U)) 
                                                   << 1U)))))
                           ? 0x32U : ((9U == (0x7fU 
                                              & ((IData)(8U) 
                                                 + 
                                                 (0x7eU 
                                                  & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                      - (IData)(8U)) 
                                                     << 1U)))))
                                       ? 0xbU : ((8U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(8U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 6U
                                                  : 
                                                 ((7U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(8U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 5U
                                                   : 
                                                  ((6U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(8U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((5U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(8U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 1U
                                                     : 
                                                    ((4U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(8U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3eU
                                                      : 
                                                     ((3U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(8U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((2U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(8U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3aU
                                                        : 
                                                       ((1U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(8U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x39U
                                                         : 0x34U))))))))));
    Div__DOT___GEN_730 = ((0xaU == (0x7fU & ((IData)(9U) 
                                             + (0x7eU 
                                                & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                    - (IData)(8U)) 
                                                   << 1U)))))
                           ? 0x32U : ((9U == (0x7fU 
                                              & ((IData)(9U) 
                                                 + 
                                                 (0x7eU 
                                                  & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                      - (IData)(8U)) 
                                                     << 1U)))))
                                       ? 0xbU : ((8U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(9U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 6U
                                                  : 
                                                 ((7U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(9U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 5U
                                                   : 
                                                  ((6U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(9U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((5U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(9U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 1U
                                                     : 
                                                    ((4U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(9U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3eU
                                                      : 
                                                     ((3U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(9U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((2U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(9U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3aU
                                                        : 
                                                       ((1U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(9U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x39U
                                                         : 0x34U))))))))));
    Div__DOT___GEN_180 = ((0x14U == (0x7fU & ((IData)(2U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x31U : ((0x13U == (0x7fU 
                                                 & ((IData)(2U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xdU : ((0x12U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(2U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 7U
                                                  : 
                                                 ((0x11U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(2U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 6U
                                                   : 
                                                  ((0x10U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(2U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0xfU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(2U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0xeU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(2U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0xdU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(2U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0xcU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(2U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x39U
                                                        : 
                                                       ((0xbU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(2U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x38U
                                                         : (IData)(Div__DOT___GEN_170)))))))))));
    Div__DOT___GEN_260 = ((0x14U == (0x7fU & ((IData)(3U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x31U : ((0x13U == (0x7fU 
                                                 & ((IData)(3U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xdU : ((0x12U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(3U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 7U
                                                  : 
                                                 ((0x11U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(3U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 6U
                                                   : 
                                                  ((0x10U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(3U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0xfU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(3U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0xeU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(3U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0xdU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(3U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0xcU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(3U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x39U
                                                        : 
                                                       ((0xbU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(3U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x38U
                                                         : (IData)(Div__DOT___GEN_250)))))))))));
    Div__DOT___GEN_340 = ((0x14U == (0x7fU & ((IData)(4U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x31U : ((0x13U == (0x7fU 
                                                 & ((IData)(4U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xdU : ((0x12U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(4U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 7U
                                                  : 
                                                 ((0x11U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(4U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 6U
                                                   : 
                                                  ((0x10U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(4U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0xfU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(4U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0xeU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(4U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0xdU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(4U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0xcU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(4U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x39U
                                                        : 
                                                       ((0xbU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(4U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x38U
                                                         : (IData)(Div__DOT___GEN_330)))))))))));
    Div__DOT___GEN_420 = ((0x14U == (0x7fU & ((IData)(5U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x31U : ((0x13U == (0x7fU 
                                                 & ((IData)(5U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xdU : ((0x12U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(5U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 7U
                                                  : 
                                                 ((0x11U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(5U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 6U
                                                   : 
                                                  ((0x10U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(5U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0xfU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(5U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0xeU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(5U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0xdU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(5U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0xcU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(5U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x39U
                                                        : 
                                                       ((0xbU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(5U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x38U
                                                         : (IData)(Div__DOT___GEN_410)))))))))));
    Div__DOT___GEN_500 = ((0x14U == (0x7fU & ((IData)(6U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x31U : ((0x13U == (0x7fU 
                                                 & ((IData)(6U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xdU : ((0x12U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(6U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 7U
                                                  : 
                                                 ((0x11U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(6U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 6U
                                                   : 
                                                  ((0x10U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(6U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0xfU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(6U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0xeU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(6U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0xdU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(6U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0xcU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(6U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x39U
                                                        : 
                                                       ((0xbU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(6U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x38U
                                                         : (IData)(Div__DOT___GEN_490)))))))))));
    Div__DOT___GEN_580 = ((0x14U == (0x7fU & ((IData)(7U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x31U : ((0x13U == (0x7fU 
                                                 & ((IData)(7U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xdU : ((0x12U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(7U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 7U
                                                  : 
                                                 ((0x11U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(7U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 6U
                                                   : 
                                                  ((0x10U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(7U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0xfU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(7U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0xeU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(7U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0xdU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(7U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0xcU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(7U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x39U
                                                        : 
                                                       ((0xbU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(7U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x38U
                                                         : (IData)(Div__DOT___GEN_570)))))))))));
    Div__DOT___GEN_660 = ((0x14U == (0x7fU & ((IData)(8U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x31U : ((0x13U == (0x7fU 
                                                 & ((IData)(8U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xdU : ((0x12U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(8U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 7U
                                                  : 
                                                 ((0x11U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(8U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 6U
                                                   : 
                                                  ((0x10U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(8U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0xfU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(8U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0xeU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(8U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0xdU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(8U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0xcU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(8U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x39U
                                                        : 
                                                       ((0xbU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(8U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x38U
                                                         : (IData)(Div__DOT___GEN_650)))))))))));
    Div__DOT___GEN_740 = ((0x14U == (0x7fU & ((IData)(9U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x31U : ((0x13U == (0x7fU 
                                                 & ((IData)(9U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xdU : ((0x12U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(9U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 7U
                                                  : 
                                                 ((0x11U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(9U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 6U
                                                   : 
                                                  ((0x10U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(9U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0xfU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(9U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0xeU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(9U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0xdU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(9U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0xcU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(9U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x39U
                                                        : 
                                                       ((0xbU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(9U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x38U
                                                         : (IData)(Div__DOT___GEN_730)))))))))));
    Div__DOT___GEN_190 = ((0x1eU == (0x7fU & ((IData)(2U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x30U : ((0x1dU == (0x7fU 
                                                 & ((IData)(2U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xeU : ((0x1cU 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(2U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x1bU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(2U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 7U
                                                   : 
                                                  ((0x1aU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(2U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x19U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(2U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x18U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(2U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x17U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(2U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x16U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(2U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x38U
                                                        : 
                                                       ((0x15U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(2U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_180)))))))))));
    Div__DOT___GEN_270 = ((0x1eU == (0x7fU & ((IData)(3U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x30U : ((0x1dU == (0x7fU 
                                                 & ((IData)(3U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xeU : ((0x1cU 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(3U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x1bU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(3U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 7U
                                                   : 
                                                  ((0x1aU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(3U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x19U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(3U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x18U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(3U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x17U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(3U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x16U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(3U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x38U
                                                        : 
                                                       ((0x15U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(3U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_260)))))))))));
    Div__DOT___GEN_350 = ((0x1eU == (0x7fU & ((IData)(4U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x30U : ((0x1dU == (0x7fU 
                                                 & ((IData)(4U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xeU : ((0x1cU 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(4U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x1bU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(4U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 7U
                                                   : 
                                                  ((0x1aU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(4U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x19U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(4U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x18U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(4U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x17U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(4U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x16U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(4U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x38U
                                                        : 
                                                       ((0x15U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(4U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_340)))))))))));
    Div__DOT___GEN_430 = ((0x1eU == (0x7fU & ((IData)(5U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x30U : ((0x1dU == (0x7fU 
                                                 & ((IData)(5U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xeU : ((0x1cU 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(5U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x1bU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(5U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 7U
                                                   : 
                                                  ((0x1aU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(5U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x19U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(5U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x18U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(5U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x17U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(5U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x16U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(5U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x38U
                                                        : 
                                                       ((0x15U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(5U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_420)))))))))));
    Div__DOT___GEN_510 = ((0x1eU == (0x7fU & ((IData)(6U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x30U : ((0x1dU == (0x7fU 
                                                 & ((IData)(6U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xeU : ((0x1cU 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(6U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x1bU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(6U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 7U
                                                   : 
                                                  ((0x1aU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(6U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x19U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(6U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x18U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(6U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x17U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(6U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x16U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(6U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x38U
                                                        : 
                                                       ((0x15U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(6U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_500)))))))))));
    Div__DOT___GEN_590 = ((0x1eU == (0x7fU & ((IData)(7U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x30U : ((0x1dU == (0x7fU 
                                                 & ((IData)(7U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xeU : ((0x1cU 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(7U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x1bU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(7U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 7U
                                                   : 
                                                  ((0x1aU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(7U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x19U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(7U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x18U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(7U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x17U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(7U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x16U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(7U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x38U
                                                        : 
                                                       ((0x15U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(7U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_580)))))))))));
    Div__DOT___GEN_670 = ((0x1eU == (0x7fU & ((IData)(8U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x30U : ((0x1dU == (0x7fU 
                                                 & ((IData)(8U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xeU : ((0x1cU 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(8U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x1bU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(8U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 7U
                                                   : 
                                                  ((0x1aU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(8U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x19U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(8U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x18U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(8U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x17U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(8U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x16U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(8U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x38U
                                                        : 
                                                       ((0x15U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(8U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_660)))))))))));
    Div__DOT___GEN_750 = ((0x1eU == (0x7fU & ((IData)(9U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x30U : ((0x1dU == (0x7fU 
                                                 & ((IData)(9U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xeU : ((0x1cU 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(9U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x1bU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(9U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 7U
                                                   : 
                                                  ((0x1aU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(9U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x19U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(9U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x18U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(9U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x17U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(9U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x16U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(9U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x38U
                                                        : 
                                                       ((0x15U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(9U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_740)))))))))));
    Div__DOT___GEN_200 = ((0x28U == (0x7fU & ((IData)(2U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2eU : ((0x27U == (0x7fU 
                                                 & ((IData)(2U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xfU : ((0x26U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(2U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x25U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(2U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 8U
                                                   : 
                                                  ((0x24U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(2U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(2U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x22U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(2U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x21U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(2U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x20U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(2U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x37U
                                                        : 
                                                       ((0x1fU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(2U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_190)))))))))));
    Div__DOT___GEN_280 = ((0x28U == (0x7fU & ((IData)(3U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2eU : ((0x27U == (0x7fU 
                                                 & ((IData)(3U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xfU : ((0x26U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(3U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x25U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(3U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 8U
                                                   : 
                                                  ((0x24U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(3U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(3U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x22U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(3U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x21U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(3U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x20U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(3U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x37U
                                                        : 
                                                       ((0x1fU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(3U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_270)))))))))));
    Div__DOT___GEN_360 = ((0x28U == (0x7fU & ((IData)(4U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2eU : ((0x27U == (0x7fU 
                                                 & ((IData)(4U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xfU : ((0x26U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(4U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x25U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(4U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 8U
                                                   : 
                                                  ((0x24U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(4U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(4U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x22U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(4U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x21U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(4U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x20U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(4U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x37U
                                                        : 
                                                       ((0x1fU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(4U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_350)))))))))));
    Div__DOT___GEN_440 = ((0x28U == (0x7fU & ((IData)(5U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2eU : ((0x27U == (0x7fU 
                                                 & ((IData)(5U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xfU : ((0x26U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(5U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x25U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(5U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 8U
                                                   : 
                                                  ((0x24U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(5U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(5U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x22U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(5U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x21U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(5U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x20U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(5U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x37U
                                                        : 
                                                       ((0x1fU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(5U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_430)))))))))));
    Div__DOT___GEN_520 = ((0x28U == (0x7fU & ((IData)(6U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2eU : ((0x27U == (0x7fU 
                                                 & ((IData)(6U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xfU : ((0x26U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(6U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x25U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(6U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 8U
                                                   : 
                                                  ((0x24U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(6U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(6U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x22U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(6U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x21U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(6U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x20U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(6U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x37U
                                                        : 
                                                       ((0x1fU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(6U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_510)))))))))));
    Div__DOT___GEN_600 = ((0x28U == (0x7fU & ((IData)(7U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2eU : ((0x27U == (0x7fU 
                                                 & ((IData)(7U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xfU : ((0x26U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(7U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x25U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(7U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 8U
                                                   : 
                                                  ((0x24U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(7U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(7U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x22U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(7U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x21U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(7U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x20U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(7U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x37U
                                                        : 
                                                       ((0x1fU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(7U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_590)))))))))));
    Div__DOT___GEN_680 = ((0x28U == (0x7fU & ((IData)(8U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2eU : ((0x27U == (0x7fU 
                                                 & ((IData)(8U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xfU : ((0x26U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(8U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x25U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(8U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 8U
                                                   : 
                                                  ((0x24U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(8U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(8U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x22U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(8U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x21U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(8U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x20U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(8U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x37U
                                                        : 
                                                       ((0x1fU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(8U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_670)))))))))));
    Div__DOT___GEN_760 = ((0x28U == (0x7fU & ((IData)(9U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2eU : ((0x27U == (0x7fU 
                                                 & ((IData)(9U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0xfU : ((0x26U 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(9U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 8U
                                                  : 
                                                 ((0x25U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(9U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 8U
                                                   : 
                                                  ((0x24U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(9U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 2U
                                                    : 
                                                   ((0x23U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(9U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 2U
                                                     : 
                                                    ((0x22U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(9U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3dU
                                                      : 
                                                     ((0x21U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(9U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3dU
                                                       : 
                                                      ((0x20U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(9U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x37U
                                                        : 
                                                       ((0x1fU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(9U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x37U
                                                         : (IData)(Div__DOT___GEN_750)))))))))));
    Div__DOT___GEN_210 = ((0x32U == (0x7fU & ((IData)(2U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2dU : ((0x31U == (0x7fU 
                                                 & ((IData)(2U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x11U : ((0x30U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(2U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 9U
                                                   : 
                                                  ((0x2fU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(2U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x2eU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(2U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x2dU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(2U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x2cU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(2U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x2bU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(2U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x2aU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(2U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x29U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(2U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x36U
                                                          : (IData)(Div__DOT___GEN_200)))))))))));
    Div__DOT___GEN_290 = ((0x32U == (0x7fU & ((IData)(3U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2dU : ((0x31U == (0x7fU 
                                                 & ((IData)(3U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x11U : ((0x30U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(3U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 9U
                                                   : 
                                                  ((0x2fU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(3U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x2eU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(3U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x2dU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(3U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x2cU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(3U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x2bU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(3U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x2aU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(3U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x29U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(3U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x36U
                                                          : (IData)(Div__DOT___GEN_280)))))))))));
    Div__DOT___GEN_370 = ((0x32U == (0x7fU & ((IData)(4U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2dU : ((0x31U == (0x7fU 
                                                 & ((IData)(4U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x11U : ((0x30U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(4U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 9U
                                                   : 
                                                  ((0x2fU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(4U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x2eU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(4U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x2dU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(4U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x2cU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(4U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x2bU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(4U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x2aU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(4U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x29U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(4U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x36U
                                                          : (IData)(Div__DOT___GEN_360)))))))))));
    Div__DOT___GEN_450 = ((0x32U == (0x7fU & ((IData)(5U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2dU : ((0x31U == (0x7fU 
                                                 & ((IData)(5U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x11U : ((0x30U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(5U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 9U
                                                   : 
                                                  ((0x2fU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(5U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x2eU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(5U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x2dU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(5U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x2cU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(5U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x2bU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(5U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x2aU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(5U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x29U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(5U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x36U
                                                          : (IData)(Div__DOT___GEN_440)))))))))));
    Div__DOT___GEN_530 = ((0x32U == (0x7fU & ((IData)(6U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2dU : ((0x31U == (0x7fU 
                                                 & ((IData)(6U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x11U : ((0x30U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(6U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 9U
                                                   : 
                                                  ((0x2fU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(6U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x2eU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(6U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x2dU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(6U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x2cU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(6U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x2bU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(6U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x2aU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(6U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x29U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(6U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x36U
                                                          : (IData)(Div__DOT___GEN_520)))))))))));
    Div__DOT___GEN_610 = ((0x32U == (0x7fU & ((IData)(7U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2dU : ((0x31U == (0x7fU 
                                                 & ((IData)(7U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x11U : ((0x30U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(7U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 9U
                                                   : 
                                                  ((0x2fU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(7U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x2eU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(7U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x2dU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(7U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x2cU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(7U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x2bU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(7U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x2aU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(7U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x29U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(7U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x36U
                                                          : (IData)(Div__DOT___GEN_600)))))))))));
    Div__DOT___GEN_690 = ((0x32U == (0x7fU & ((IData)(8U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2dU : ((0x31U == (0x7fU 
                                                 & ((IData)(8U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x11U : ((0x30U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(8U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 9U
                                                   : 
                                                  ((0x2fU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(8U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x2eU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(8U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x2dU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(8U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x2cU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(8U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x2bU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(8U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x2aU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(8U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x29U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(8U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x36U
                                                          : (IData)(Div__DOT___GEN_680)))))))))));
    Div__DOT___GEN_770 = ((0x32U == (0x7fU & ((IData)(9U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2dU : ((0x31U == (0x7fU 
                                                 & ((IData)(9U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x11U : ((0x30U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(9U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 9U
                                                   : 
                                                  ((0x2fU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(9U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x2eU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(9U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x2dU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(9U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x2cU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(9U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x2bU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(9U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x2aU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(9U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x29U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(9U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x36U
                                                          : (IData)(Div__DOT___GEN_760)))))))))));
    Div__DOT___GEN_220 = ((0x3cU == (0x7fU & ((IData)(2U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2cU : ((0x3bU == (0x7fU 
                                                 & ((IData)(2U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x12U : ((0x3aU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(2U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x39U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(2U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x38U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(2U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x37U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(2U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x36U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(2U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x35U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(2U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x34U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(2U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x33U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(2U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_210)))))))))));
    Div__DOT___GEN_300 = ((0x3cU == (0x7fU & ((IData)(3U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2cU : ((0x3bU == (0x7fU 
                                                 & ((IData)(3U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x12U : ((0x3aU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(3U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x39U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(3U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x38U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(3U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x37U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(3U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x36U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(3U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x35U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(3U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x34U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(3U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x33U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(3U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_290)))))))))));
    Div__DOT___GEN_380 = ((0x3cU == (0x7fU & ((IData)(4U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2cU : ((0x3bU == (0x7fU 
                                                 & ((IData)(4U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x12U : ((0x3aU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(4U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x39U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(4U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x38U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(4U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x37U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(4U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x36U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(4U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x35U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(4U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x34U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(4U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x33U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(4U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_370)))))))))));
    Div__DOT___GEN_460 = ((0x3cU == (0x7fU & ((IData)(5U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2cU : ((0x3bU == (0x7fU 
                                                 & ((IData)(5U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x12U : ((0x3aU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(5U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x39U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(5U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x38U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(5U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x37U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(5U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x36U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(5U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x35U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(5U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x34U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(5U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x33U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(5U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_450)))))))))));
    Div__DOT___GEN_540 = ((0x3cU == (0x7fU & ((IData)(6U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2cU : ((0x3bU == (0x7fU 
                                                 & ((IData)(6U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x12U : ((0x3aU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(6U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x39U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(6U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x38U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(6U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x37U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(6U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x36U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(6U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x35U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(6U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x34U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(6U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x33U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(6U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_530)))))))))));
    Div__DOT___GEN_620 = ((0x3cU == (0x7fU & ((IData)(7U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2cU : ((0x3bU == (0x7fU 
                                                 & ((IData)(7U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x12U : ((0x3aU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(7U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x39U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(7U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x38U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(7U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x37U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(7U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x36U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(7U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x35U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(7U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x34U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(7U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x33U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(7U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_610)))))))))));
    Div__DOT___GEN_700 = ((0x3cU == (0x7fU & ((IData)(8U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2cU : ((0x3bU == (0x7fU 
                                                 & ((IData)(8U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x12U : ((0x3aU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(8U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x39U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(8U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x38U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(8U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x37U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(8U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x36U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(8U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x35U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(8U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x34U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(8U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x33U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(8U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_690)))))))))));
    Div__DOT___GEN_780 = ((0x3cU == (0x7fU & ((IData)(9U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2cU : ((0x3bU == (0x7fU 
                                                 & ((IData)(9U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x12U : ((0x3aU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(9U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x39U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(9U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 9U
                                                    : 
                                                   ((0x38U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(9U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x37U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(9U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x36U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(9U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x35U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(9U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x34U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(9U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x36U
                                                         : 
                                                        ((0x33U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(9U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_770)))))))))));
    Div__DOT___GEN_230 = ((0x46U == (0x7fU & ((IData)(2U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2aU : ((0x45U == (0x7fU 
                                                 & ((IData)(2U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x13U : ((0x44U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(2U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x43U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(2U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0xaU
                                                    : 
                                                   ((0x42U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(2U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x41U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(2U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x40U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(2U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x3fU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(2U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x3eU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(2U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x35U
                                                         : 
                                                        ((0x3dU 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(2U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_220)))))))))));
    Div__DOT___GEN_310 = ((0x46U == (0x7fU & ((IData)(3U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2aU : ((0x45U == (0x7fU 
                                                 & ((IData)(3U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x13U : ((0x44U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(3U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x43U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(3U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0xaU
                                                    : 
                                                   ((0x42U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(3U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x41U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(3U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x40U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(3U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x3fU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(3U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x3eU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(3U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x35U
                                                         : 
                                                        ((0x3dU 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(3U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_300)))))))))));
    Div__DOT___GEN_390 = ((0x46U == (0x7fU & ((IData)(4U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2aU : ((0x45U == (0x7fU 
                                                 & ((IData)(4U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x13U : ((0x44U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(4U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x43U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(4U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0xaU
                                                    : 
                                                   ((0x42U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(4U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x41U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(4U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x40U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(4U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x3fU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(4U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x3eU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(4U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x35U
                                                         : 
                                                        ((0x3dU 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(4U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_380)))))))))));
    Div__DOT___GEN_470 = ((0x46U == (0x7fU & ((IData)(5U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2aU : ((0x45U == (0x7fU 
                                                 & ((IData)(5U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x13U : ((0x44U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(5U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x43U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(5U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0xaU
                                                    : 
                                                   ((0x42U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(5U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x41U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(5U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x40U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(5U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x3fU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(5U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x3eU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(5U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x35U
                                                         : 
                                                        ((0x3dU 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(5U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_460)))))))))));
    Div__DOT___GEN_550 = ((0x46U == (0x7fU & ((IData)(6U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2aU : ((0x45U == (0x7fU 
                                                 & ((IData)(6U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x13U : ((0x44U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(6U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x43U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(6U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0xaU
                                                    : 
                                                   ((0x42U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(6U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x41U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(6U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x40U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(6U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x3fU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(6U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x3eU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(6U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x35U
                                                         : 
                                                        ((0x3dU 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(6U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_540)))))))))));
    Div__DOT___GEN_630 = ((0x46U == (0x7fU & ((IData)(7U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2aU : ((0x45U == (0x7fU 
                                                 & ((IData)(7U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x13U : ((0x44U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(7U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x43U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(7U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0xaU
                                                    : 
                                                   ((0x42U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(7U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x41U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(7U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x40U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(7U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x3fU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(7U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x3eU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(7U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x35U
                                                         : 
                                                        ((0x3dU 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(7U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_620)))))))))));
    Div__DOT___GEN_710 = ((0x46U == (0x7fU & ((IData)(8U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2aU : ((0x45U == (0x7fU 
                                                 & ((IData)(8U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x13U : ((0x44U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(8U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x43U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(8U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0xaU
                                                    : 
                                                   ((0x42U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(8U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x41U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(8U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x40U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(8U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x3fU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(8U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x3eU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(8U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x35U
                                                         : 
                                                        ((0x3dU 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(8U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_700)))))))))));
    Div__DOT___GEN_790 = ((0x46U == (0x7fU & ((IData)(9U) 
                                              + (0x7eU 
                                                 & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                     - (IData)(8U)) 
                                                    << 1U)))))
                           ? 0x2aU : ((0x45U == (0x7fU 
                                                 & ((IData)(9U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                       ? 0x13U : ((0x44U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(9U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xaU
                                                   : 
                                                  ((0x43U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(9U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0xaU
                                                    : 
                                                   ((0x42U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(9U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x41U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(9U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 3U
                                                      : 
                                                     ((0x40U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(9U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3cU
                                                       : 
                                                      ((0x3fU 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(9U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x3eU 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(9U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x35U
                                                         : 
                                                        ((0x3dU 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(9U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x35U
                                                          : (IData)(Div__DOT___GEN_780)))))))))));
    vlSelf->Div__DOT__qNeg1 = (VL_GTES_III(6, (0x3fU 
                                               & ((vlSelf->Div__DOT__PA[4U] 
                                                   << 5U) 
                                                  | (vlSelf->Div__DOT__PA[3U] 
                                                     >> 0x1bU))), 
                                           ((0x4fU 
                                             == (0x7fU 
                                                 & ((IData)(2U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                             ? 0x15U
                                             : ((0x4eU 
                                                 == 
                                                 (0x7fU 
                                                  & ((IData)(2U) 
                                                     + 
                                                     (0x7eU 
                                                      & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                          - (IData)(8U)) 
                                                         << 1U)))))
                                                 ? 0xbU
                                                 : 
                                                ((0x4dU 
                                                  == 
                                                  (0x7fU 
                                                   & ((IData)(2U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                                  ? 0xbU
                                                  : 
                                                 ((0x4cU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(2U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 3U
                                                   : 
                                                  ((0x4bU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(2U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 4U
                                                    : 
                                                   ((0x4aU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(2U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 0x3bU
                                                     : 
                                                    ((0x49U 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(2U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 0x3cU
                                                      : 
                                                     ((0x48U 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(2U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x34U
                                                       : 
                                                      ((0x47U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(2U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x34U
                                                        : (IData)(Div__DOT___GEN_230))))))))))) 
                               & VL_LTES_III(6, (0x3fU 
                                                 & ((vlSelf->Div__DOT__PA[4U] 
                                                     << 5U) 
                                                    | (vlSelf->Div__DOT__PA[3U] 
                                                       >> 0x1bU))), 
                                             ((0x4fU 
                                               == (0x7fU 
                                                   & ((IData)(3U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                               ? 0x15U
                                               : ((0x4eU 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(3U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0xbU
                                                   : 
                                                  ((0x4dU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(3U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0xbU
                                                    : 
                                                   ((0x4cU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(3U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x4bU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(3U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 4U
                                                      : 
                                                     ((0x4aU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(3U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3bU
                                                       : 
                                                      ((0x49U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(3U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x48U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(3U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x34U
                                                         : 
                                                        ((0x47U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(3U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x34U
                                                          : (IData)(Div__DOT___GEN_310))))))))))));
    vlSelf->Div__DOT__q0 = (VL_GTES_III(6, (0x3fU & 
                                            ((vlSelf->Div__DOT__PA[4U] 
                                              << 5U) 
                                             | (vlSelf->Div__DOT__PA[3U] 
                                                >> 0x1bU))), 
                                        ((0x4fU == 
                                          (0x7fU & 
                                           ((IData)(4U) 
                                            + (0x7eU 
                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                   - (IData)(8U)) 
                                                  << 1U)))))
                                          ? 0x15U : 
                                         ((0x4eU == 
                                           (0x7fU & 
                                            ((IData)(4U) 
                                             + (0x7eU 
                                                & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                    - (IData)(8U)) 
                                                   << 1U)))))
                                           ? 0xbU : 
                                          ((0x4dU == 
                                            (0x7fU 
                                             & ((IData)(4U) 
                                                + (0x7eU 
                                                   & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                       - (IData)(8U)) 
                                                      << 1U)))))
                                            ? 0xbU : 
                                           ((0x4cU 
                                             == (0x7fU 
                                                 & ((IData)(4U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                             ? 3U : 
                                            ((0x4bU 
                                              == (0x7fU 
                                                  & ((IData)(4U) 
                                                     + 
                                                     (0x7eU 
                                                      & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                          - (IData)(8U)) 
                                                         << 1U)))))
                                              ? 4U : 
                                             ((0x4aU 
                                               == (0x7fU 
                                                   & ((IData)(4U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                               ? 0x3bU
                                               : ((0x49U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(4U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0x3cU
                                                   : 
                                                  ((0x48U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(4U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0x34U
                                                    : 
                                                   ((0x47U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(4U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 0x34U
                                                     : (IData)(Div__DOT___GEN_390))))))))))) 
                            & VL_LTES_III(6, (0x3fU 
                                              & ((vlSelf->Div__DOT__PA[4U] 
                                                  << 5U) 
                                                 | (vlSelf->Div__DOT__PA[3U] 
                                                    >> 0x1bU))), 
                                          ((0x4fU == 
                                            (0x7fU 
                                             & ((IData)(5U) 
                                                + (0x7eU 
                                                   & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                       - (IData)(8U)) 
                                                      << 1U)))))
                                            ? 0x15U
                                            : ((0x4eU 
                                                == 
                                                (0x7fU 
                                                 & ((IData)(5U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                                ? 0xbU
                                                : (
                                                   (0x4dU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(5U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0xbU
                                                    : 
                                                   ((0x4cU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(5U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x4bU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(5U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 4U
                                                      : 
                                                     ((0x4aU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(5U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3bU
                                                       : 
                                                      ((0x49U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(5U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x48U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(5U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x34U
                                                         : 
                                                        ((0x47U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(5U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x34U
                                                          : (IData)(Div__DOT___GEN_470))))))))))));
    vlSelf->Div__DOT__q1 = (VL_GTES_III(6, (0x3fU & 
                                            ((vlSelf->Div__DOT__PA[4U] 
                                              << 5U) 
                                             | (vlSelf->Div__DOT__PA[3U] 
                                                >> 0x1bU))), 
                                        ((0x4fU == 
                                          (0x7fU & 
                                           ((IData)(6U) 
                                            + (0x7eU 
                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                   - (IData)(8U)) 
                                                  << 1U)))))
                                          ? 0x15U : 
                                         ((0x4eU == 
                                           (0x7fU & 
                                            ((IData)(6U) 
                                             + (0x7eU 
                                                & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                    - (IData)(8U)) 
                                                   << 1U)))))
                                           ? 0xbU : 
                                          ((0x4dU == 
                                            (0x7fU 
                                             & ((IData)(6U) 
                                                + (0x7eU 
                                                   & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                       - (IData)(8U)) 
                                                      << 1U)))))
                                            ? 0xbU : 
                                           ((0x4cU 
                                             == (0x7fU 
                                                 & ((IData)(6U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                             ? 3U : 
                                            ((0x4bU 
                                              == (0x7fU 
                                                  & ((IData)(6U) 
                                                     + 
                                                     (0x7eU 
                                                      & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                          - (IData)(8U)) 
                                                         << 1U)))))
                                              ? 4U : 
                                             ((0x4aU 
                                               == (0x7fU 
                                                   & ((IData)(6U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                               ? 0x3bU
                                               : ((0x49U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(6U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0x3cU
                                                   : 
                                                  ((0x48U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(6U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0x34U
                                                    : 
                                                   ((0x47U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(6U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 0x34U
                                                     : (IData)(Div__DOT___GEN_550))))))))))) 
                            & VL_LTES_III(6, (0x3fU 
                                              & ((vlSelf->Div__DOT__PA[4U] 
                                                  << 5U) 
                                                 | (vlSelf->Div__DOT__PA[3U] 
                                                    >> 0x1bU))), 
                                          ((0x4fU == 
                                            (0x7fU 
                                             & ((IData)(7U) 
                                                + (0x7eU 
                                                   & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                       - (IData)(8U)) 
                                                      << 1U)))))
                                            ? 0x15U
                                            : ((0x4eU 
                                                == 
                                                (0x7fU 
                                                 & ((IData)(7U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                                ? 0xbU
                                                : (
                                                   (0x4dU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(7U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0xbU
                                                    : 
                                                   ((0x4cU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(7U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x4bU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(7U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 4U
                                                      : 
                                                     ((0x4aU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(7U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3bU
                                                       : 
                                                      ((0x49U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(7U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x48U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(7U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x34U
                                                         : 
                                                        ((0x47U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(7U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x34U
                                                          : (IData)(Div__DOT___GEN_630))))))))))));
    vlSelf->Div__DOT__q2 = (VL_GTES_III(6, (0x3fU & 
                                            ((vlSelf->Div__DOT__PA[4U] 
                                              << 5U) 
                                             | (vlSelf->Div__DOT__PA[3U] 
                                                >> 0x1bU))), 
                                        ((0x4fU == 
                                          (0x7fU & 
                                           ((IData)(8U) 
                                            + (0x7eU 
                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                   - (IData)(8U)) 
                                                  << 1U)))))
                                          ? 0x15U : 
                                         ((0x4eU == 
                                           (0x7fU & 
                                            ((IData)(8U) 
                                             + (0x7eU 
                                                & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                    - (IData)(8U)) 
                                                   << 1U)))))
                                           ? 0xbU : 
                                          ((0x4dU == 
                                            (0x7fU 
                                             & ((IData)(8U) 
                                                + (0x7eU 
                                                   & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                       - (IData)(8U)) 
                                                      << 1U)))))
                                            ? 0xbU : 
                                           ((0x4cU 
                                             == (0x7fU 
                                                 & ((IData)(8U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                             ? 3U : 
                                            ((0x4bU 
                                              == (0x7fU 
                                                  & ((IData)(8U) 
                                                     + 
                                                     (0x7eU 
                                                      & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                          - (IData)(8U)) 
                                                         << 1U)))))
                                              ? 4U : 
                                             ((0x4aU 
                                               == (0x7fU 
                                                   & ((IData)(8U) 
                                                      + 
                                                      (0x7eU 
                                                       & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                           - (IData)(8U)) 
                                                          << 1U)))))
                                               ? 0x3bU
                                               : ((0x49U 
                                                   == 
                                                   (0x7fU 
                                                    & ((IData)(8U) 
                                                       + 
                                                       (0x7eU 
                                                        & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                            - (IData)(8U)) 
                                                           << 1U)))))
                                                   ? 0x3cU
                                                   : 
                                                  ((0x48U 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(8U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0x34U
                                                    : 
                                                   ((0x47U 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(8U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 0x34U
                                                     : (IData)(Div__DOT___GEN_710))))))))))) 
                            & VL_LTES_III(6, (0x3fU 
                                              & ((vlSelf->Div__DOT__PA[4U] 
                                                  << 5U) 
                                                 | (vlSelf->Div__DOT__PA[3U] 
                                                    >> 0x1bU))), 
                                          ((0x4fU == 
                                            (0x7fU 
                                             & ((IData)(9U) 
                                                + (0x7eU 
                                                   & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                       - (IData)(8U)) 
                                                      << 1U)))))
                                            ? 0x15U
                                            : ((0x4eU 
                                                == 
                                                (0x7fU 
                                                 & ((IData)(9U) 
                                                    + 
                                                    (0x7eU 
                                                     & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                         - (IData)(8U)) 
                                                        << 1U)))))
                                                ? 0xbU
                                                : (
                                                   (0x4dU 
                                                    == 
                                                    (0x7fU 
                                                     & ((IData)(9U) 
                                                        + 
                                                        (0x7eU 
                                                         & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                             - (IData)(8U)) 
                                                            << 1U)))))
                                                    ? 0xbU
                                                    : 
                                                   ((0x4cU 
                                                     == 
                                                     (0x7fU 
                                                      & ((IData)(9U) 
                                                         + 
                                                         (0x7eU 
                                                          & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                              - (IData)(8U)) 
                                                             << 1U)))))
                                                     ? 3U
                                                     : 
                                                    ((0x4bU 
                                                      == 
                                                      (0x7fU 
                                                       & ((IData)(9U) 
                                                          + 
                                                          (0x7eU 
                                                           & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                               - (IData)(8U)) 
                                                              << 1U)))))
                                                      ? 4U
                                                      : 
                                                     ((0x4aU 
                                                       == 
                                                       (0x7fU 
                                                        & ((IData)(9U) 
                                                           + 
                                                           (0x7eU 
                                                            & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                - (IData)(8U)) 
                                                               << 1U)))))
                                                       ? 0x3bU
                                                       : 
                                                      ((0x49U 
                                                        == 
                                                        (0x7fU 
                                                         & ((IData)(9U) 
                                                            + 
                                                            (0x7eU 
                                                             & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                 - (IData)(8U)) 
                                                                << 1U)))))
                                                        ? 0x3cU
                                                        : 
                                                       ((0x48U 
                                                         == 
                                                         (0x7fU 
                                                          & ((IData)(9U) 
                                                             + 
                                                             (0x7eU 
                                                              & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                  - (IData)(8U)) 
                                                                 << 1U)))))
                                                         ? 0x34U
                                                         : 
                                                        ((0x47U 
                                                          == 
                                                          (0x7fU 
                                                           & ((IData)(9U) 
                                                              + 
                                                              (0x7eU 
                                                               & (((IData)(vlSelf->Div__DOT___offset_T_4) 
                                                                   - (IData)(8U)) 
                                                                  << 1U)))))
                                                          ? 0x34U
                                                          : (IData)(Div__DOT___GEN_790))))))))))));
    vlSelf->Div__DOT__qSel = ((IData)(vlSelf->Div__DOT__q0)
                               ? 0U : ((IData)(vlSelf->Div__DOT__q1)
                                        ? 1U : ((IData)(vlSelf->Div__DOT__q2)
                                                 ? 2U
                                                 : 
                                                ((IData)(vlSelf->Div__DOT__qNeg1)
                                                  ? 7U
                                                  : 6U))));
}

VL_INLINE_OPT void VDiv___024root___combo__TOP__0(VDiv___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDiv__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDiv___024root___combo__TOP__0\n"); );
    // Init
    QData/*63:0*/ Div__DOT___clz_T_8;
    QData/*63:0*/ Div__DOT___clz_T_18;
    QData/*63:0*/ Div__DOT___clz_T_28;
    QData/*63:0*/ Div__DOT___clz_T_38;
    QData/*63:0*/ Div__DOT___clz_T_48;
    QData/*63:0*/ Div__DOT___clz_T_58;
    CData/*5:0*/ Div__DOT___clz_T_139;
    CData/*5:0*/ Div__DOT___clz_T_156;
    CData/*5:0*/ Div__DOT___clz_T_173;
    VlWide<3>/*95:0*/ __Vtemp_h60530eb0__0;
    VlWide<3>/*95:0*/ __Vtemp_h60530eb0__1;
    VlWide<3>/*95:0*/ __Vtemp_h60530eb0__2;
    VlWide<3>/*95:0*/ __Vtemp_hf8a8b6e5__0;
    VlWide<3>/*95:0*/ __Vtemp_h60530eb0__3;
    VlWide<3>/*95:0*/ __Vtemp_h0843e757__0;
    VlWide<3>/*95:0*/ __Vtemp_ha2f1002c__0;
    VlWide<3>/*95:0*/ __Vtemp_h60530eb0__4;
    VlWide<3>/*95:0*/ __Vtemp_h60530eb0__5;
    VlWide<3>/*95:0*/ __Vtemp_hc321ae0e__0;
    VlWide<3>/*95:0*/ __Vtemp_h0843e757__1;
    VlWide<3>/*95:0*/ __Vtemp_h7ea057fc__0;
    VlWide<3>/*95:0*/ __Vtemp_hc2504056__0;
    VlWide<3>/*95:0*/ __Vtemp_hc321ae0e__1;
    VlWide<3>/*95:0*/ __Vtemp_hf71593dd__2;
    VlWide<3>/*95:0*/ __Vtemp_h9f986060__0;
    VlWide<3>/*95:0*/ __Vtemp_hfa79365b__0;
    VlWide<3>/*95:0*/ __Vtemp_h11e8647c__0;
    VlWide<3>/*95:0*/ __Vtemp_hd8850ac3__0;
    VlWide<3>/*95:0*/ __Vtemp_hfdd3f34b__0;
    VlWide<3>/*95:0*/ __Vtemp_hdd8fb49f__0;
    VlWide<4>/*127:0*/ __Vtemp_he4d86bc2__0;
    VlWide<4>/*127:0*/ __Vtemp_hb78c9f8b__0;
    VlWide<4>/*127:0*/ __Vtemp_h9f456cf2__0;
    VlWide<4>/*127:0*/ __Vtemp_h9f456cf2__1;
    VlWide<6>/*191:0*/ __Vtemp_hea4f2118__0;
    VlWide<6>/*191:0*/ __Vtemp_h80cdd6f4__0;
    VlWide<6>/*191:0*/ __Vtemp_h4fc94348__0;
    VlWide<5>/*159:0*/ __Vtemp_h39a32276__0;
    VlWide<5>/*159:0*/ __Vtemp_h818f88a1__0;
    VlWide<5>/*159:0*/ __Vtemp_hf5c402f4__0;
    VlWide<5>/*159:0*/ __Vtemp_h8eb1ce10__0;
    VlWide<5>/*159:0*/ __Vtemp_h39a32276__1;
    VlWide<4>/*127:0*/ __Vtemp_h67b6e682__0;
    VlWide<5>/*159:0*/ __Vtemp_hc2824b2f__0;
    VlWide<5>/*159:0*/ __Vtemp_hcae7a997__0;
    VlWide<5>/*159:0*/ __Vtemp_h39a32276__3;
    VlWide<3>/*95:0*/ __Vtemp_h5e726cb9__0;
    VlWide<3>/*95:0*/ __Vtemp_h9f986060__1;
    VlWide<3>/*95:0*/ __Vtemp_h88b01313__0;
    VlWide<3>/*95:0*/ __Vtemp_h0eb039f6__0;
    VlWide<5>/*159:0*/ __Vtemp_he5819244__0;
    VlWide<5>/*159:0*/ __Vtemp_h6e152c0d__0;
    VlWide<5>/*159:0*/ __Vtemp_he05627fe__0;
    VlWide<5>/*159:0*/ __Vtemp_h39a32276__4;
    VlWide<3>/*95:0*/ __Vtemp_h5e726cb9__1;
    VlWide<3>/*95:0*/ __Vtemp_h9f986060__2;
    VlWide<3>/*95:0*/ __Vtemp_hcdf64823__0;
    VlWide<3>/*95:0*/ __Vtemp_h27753c9c__0;
    VlWide<5>/*159:0*/ __Vtemp_h8256dde8__0;
    VlWide<5>/*159:0*/ __Vtemp_h5d83c569__0;
    VlWide<5>/*159:0*/ __Vtemp_h1c84d948__0;
    VlWide<5>/*159:0*/ __Vtemp_h4fd31b46__0;
    VlWide<5>/*159:0*/ __Vtemp_h4fd31b46__1;
    VlWide<5>/*159:0*/ __Vtemp_haff6ab99__0;
    VlWide<6>/*191:0*/ __Vtemp_h43f28e70__0;
    // Body
    Div__DOT___clz_T_8 = ((0xffffffffULL & (QData)((IData)(
                                                           (vlSelf->io_b 
                                                            >> 0x20U)))) 
                          | ((QData)((IData)(vlSelf->io_b)) 
                             << 0x20U));
    VL_EXTEND_WQ(65,64, __Vtemp_h60530eb0__0, vlSelf->Div__DOT__pos_quo);
    VL_EXTEND_WQ(65,64, __Vtemp_h60530eb0__1, vlSelf->Div__DOT__pos_quo);
    VL_EXTEND_WQ(65,64, __Vtemp_h60530eb0__2, vlSelf->Div__DOT__pos_quo);
    VL_EXTEND_WQ(65,64, __Vtemp_hf8a8b6e5__0, (vlSelf->Div__DOT__pos_quo 
                                               + (1ULL 
                                                  << (IData)(vlSelf->Div__DOT__cnt))));
    VL_EXTEND_WQ(65,64, __Vtemp_h60530eb0__3, vlSelf->Div__DOT__pos_quo);
    __Vtemp_h0843e757__0[0U] = ((IData)((1ULL << (IData)(vlSelf->Div__DOT__cnt))) 
                                << 1U);
    __Vtemp_h0843e757__0[1U] = (((IData)((1ULL << (IData)(vlSelf->Div__DOT__cnt))) 
                                 >> 0x1fU) | ((IData)(
                                                      ((1ULL 
                                                        << (IData)(vlSelf->Div__DOT__cnt)) 
                                                       >> 0x20U)) 
                                              << 1U));
    __Vtemp_h0843e757__0[2U] = ((IData)(((1ULL << (IData)(vlSelf->Div__DOT__cnt)) 
                                         >> 0x20U)) 
                                >> 0x1fU);
    VL_ADD_W(3, __Vtemp_ha2f1002c__0, __Vtemp_h60530eb0__3, __Vtemp_h0843e757__0);
    VL_EXTEND_WQ(65,64, __Vtemp_h60530eb0__4, vlSelf->Div__DOT__pos_quo);
    VL_EXTEND_WQ(65,64, __Vtemp_h60530eb0__5, vlSelf->Div__DOT__pos_quo);
    if (vlSelf->reset) {
        vlSelf->Div__DOT___GEN_858[0U] = 0U;
        vlSelf->Div__DOT___GEN_858[1U] = 0U;
        vlSelf->Div__DOT___GEN_858[2U] = 0U;
    } else if ((0U == (IData)(vlSelf->Div__DOT__state))) {
        vlSelf->Div__DOT___GEN_858[0U] = 0U;
        vlSelf->Div__DOT___GEN_858[1U] = 0U;
        vlSelf->Div__DOT___GEN_858[2U] = 0U;
    } else if ((1U == (IData)(vlSelf->Div__DOT__state))) {
        if ((6U == (IData)(vlSelf->Div__DOT__qSel))) {
            vlSelf->Div__DOT___GEN_858[0U] = __Vtemp_h60530eb0__0[0U];
            vlSelf->Div__DOT___GEN_858[1U] = __Vtemp_h60530eb0__0[1U];
            vlSelf->Div__DOT___GEN_858[2U] = (1U & 
                                              __Vtemp_h60530eb0__0[2U]);
        } else if ((7U == (IData)(vlSelf->Div__DOT__qSel))) {
            vlSelf->Div__DOT___GEN_858[0U] = __Vtemp_h60530eb0__1[0U];
            vlSelf->Div__DOT___GEN_858[1U] = __Vtemp_h60530eb0__1[1U];
            vlSelf->Div__DOT___GEN_858[2U] = (1U & 
                                              __Vtemp_h60530eb0__1[2U]);
        } else if ((0U == (IData)(vlSelf->Div__DOT__qSel))) {
            vlSelf->Div__DOT___GEN_858[0U] = __Vtemp_h60530eb0__2[0U];
            vlSelf->Div__DOT___GEN_858[1U] = __Vtemp_h60530eb0__2[1U];
            vlSelf->Div__DOT___GEN_858[2U] = (1U & 
                                              __Vtemp_h60530eb0__2[2U]);
        } else if ((1U == (IData)(vlSelf->Div__DOT__qSel))) {
            vlSelf->Div__DOT___GEN_858[0U] = __Vtemp_hf8a8b6e5__0[0U];
            vlSelf->Div__DOT___GEN_858[1U] = __Vtemp_hf8a8b6e5__0[1U];
            vlSelf->Div__DOT___GEN_858[2U] = (1U & 
                                              __Vtemp_hf8a8b6e5__0[2U]);
        } else if ((2U == (IData)(vlSelf->Div__DOT__qSel))) {
            vlSelf->Div__DOT___GEN_858[0U] = __Vtemp_ha2f1002c__0[0U];
            vlSelf->Div__DOT___GEN_858[1U] = __Vtemp_ha2f1002c__0[1U];
            vlSelf->Div__DOT___GEN_858[2U] = (1U & 
                                              __Vtemp_ha2f1002c__0[2U]);
        } else {
            vlSelf->Div__DOT___GEN_858[0U] = __Vtemp_h60530eb0__4[0U];
            vlSelf->Div__DOT___GEN_858[1U] = __Vtemp_h60530eb0__4[1U];
            vlSelf->Div__DOT___GEN_858[2U] = (1U & 
                                              __Vtemp_h60530eb0__4[2U]);
        }
    } else {
        vlSelf->Div__DOT___GEN_858[0U] = __Vtemp_h60530eb0__5[0U];
        vlSelf->Div__DOT___GEN_858[1U] = __Vtemp_h60530eb0__5[1U];
        vlSelf->Div__DOT___GEN_858[2U] = (1U & __Vtemp_h60530eb0__5[2U]);
    }
    VL_EXTEND_WQ(65,64, __Vtemp_hc321ae0e__0, vlSelf->Div__DOT__neg_quo);
    __Vtemp_h0843e757__1[0U] = ((IData)((1ULL << (IData)(vlSelf->Div__DOT__cnt))) 
                                << 1U);
    __Vtemp_h0843e757__1[1U] = (((IData)((1ULL << (IData)(vlSelf->Div__DOT__cnt))) 
                                 >> 0x1fU) | ((IData)(
                                                      ((1ULL 
                                                        << (IData)(vlSelf->Div__DOT__cnt)) 
                                                       >> 0x20U)) 
                                              << 1U));
    __Vtemp_h0843e757__1[2U] = ((IData)(((1ULL << (IData)(vlSelf->Div__DOT__cnt)) 
                                         >> 0x20U)) 
                                >> 0x1fU);
    VL_ADD_W(3, __Vtemp_h7ea057fc__0, __Vtemp_hc321ae0e__0, __Vtemp_h0843e757__1);
    VL_EXTEND_WQ(65,64, __Vtemp_hc2504056__0, ((7U 
                                                == (IData)(vlSelf->Div__DOT__qSel))
                                                ? (vlSelf->Div__DOT__neg_quo 
                                                   + 
                                                   (1ULL 
                                                    << (IData)(vlSelf->Div__DOT__cnt)))
                                                : vlSelf->Div__DOT__neg_quo));
    VL_EXTEND_WQ(65,64, __Vtemp_hc321ae0e__1, vlSelf->Div__DOT__neg_quo);
    if (vlSelf->reset) {
        vlSelf->Div__DOT___GEN_859[0U] = 0U;
        vlSelf->Div__DOT___GEN_859[1U] = 0U;
        vlSelf->Div__DOT___GEN_859[2U] = 0U;
    } else if ((0U == (IData)(vlSelf->Div__DOT__state))) {
        vlSelf->Div__DOT___GEN_859[0U] = 0U;
        vlSelf->Div__DOT___GEN_859[1U] = 0U;
        vlSelf->Div__DOT___GEN_859[2U] = 0U;
    } else if ((1U == (IData)(vlSelf->Div__DOT__state))) {
        if ((6U == (IData)(vlSelf->Div__DOT__qSel))) {
            vlSelf->Div__DOT___GEN_859[0U] = __Vtemp_h7ea057fc__0[0U];
            vlSelf->Div__DOT___GEN_859[1U] = __Vtemp_h7ea057fc__0[1U];
            vlSelf->Div__DOT___GEN_859[2U] = (1U & 
                                              __Vtemp_h7ea057fc__0[2U]);
        } else {
            vlSelf->Div__DOT___GEN_859[0U] = __Vtemp_hc2504056__0[0U];
            vlSelf->Div__DOT___GEN_859[1U] = __Vtemp_hc2504056__0[1U];
            vlSelf->Div__DOT___GEN_859[2U] = (1U & 
                                              __Vtemp_hc2504056__0[2U]);
        }
    } else {
        vlSelf->Div__DOT___GEN_859[0U] = __Vtemp_hc321ae0e__1[0U];
        vlSelf->Div__DOT___GEN_859[1U] = __Vtemp_hc321ae0e__1[1U];
        vlSelf->Div__DOT___GEN_859[2U] = (1U & __Vtemp_hc321ae0e__1[2U]);
    }
    Div__DOT___clz_T_18 = ((0xffff0000ffffULL & (Div__DOT___clz_T_8 
                                                 >> 0x10U)) 
                           | (0xffff0000ffff0000ULL 
                              & (Div__DOT___clz_T_8 
                                 << 0x10U)));
    Div__DOT___clz_T_28 = ((0xff00ff00ff00ffULL & (Div__DOT___clz_T_18 
                                                   >> 8U)) 
                           | (0xff00ff00ff00ff00ULL 
                              & (Div__DOT___clz_T_18 
                                 << 8U)));
    Div__DOT___clz_T_38 = ((0xf0f0f0f0f0f0f0fULL & 
                            (Div__DOT___clz_T_28 >> 4U)) 
                           | (0xf0f0f0f0f0f0f0f0ULL 
                              & (Div__DOT___clz_T_28 
                                 << 4U)));
    Div__DOT___clz_T_48 = ((0x3333333333333333ULL & 
                            (Div__DOT___clz_T_38 >> 2U)) 
                           | (0xccccccccccccccccULL 
                              & (Div__DOT___clz_T_38 
                                 << 2U)));
    Div__DOT___clz_T_58 = ((0x5555555555555555ULL & 
                            (Div__DOT___clz_T_48 >> 1U)) 
                           | (0xaaaaaaaaaaaaaaaaULL 
                              & (Div__DOT___clz_T_48 
                                 << 1U)));
    Div__DOT___clz_T_139 = ((1U & (IData)((Div__DOT___clz_T_58 
                                           >> 0x2eU)))
                             ? 0x2eU : ((1U & (IData)(
                                                      (Div__DOT___clz_T_58 
                                                       >> 0x2fU)))
                                         ? 0x2fU : 
                                        ((1U & (IData)(
                                                       (Div__DOT___clz_T_58 
                                                        >> 0x30U)))
                                          ? 0x30U : 
                                         ((1U & (IData)(
                                                        (Div__DOT___clz_T_58 
                                                         >> 0x31U)))
                                           ? 0x31U : 
                                          ((1U & (IData)(
                                                         (Div__DOT___clz_T_58 
                                                          >> 0x32U)))
                                            ? 0x32U
                                            : ((1U 
                                                & (IData)(
                                                          (Div__DOT___clz_T_58 
                                                           >> 0x33U)))
                                                ? 0x33U
                                                : (
                                                   (1U 
                                                    & (IData)(
                                                              (Div__DOT___clz_T_58 
                                                               >> 0x34U)))
                                                    ? 0x34U
                                                    : 
                                                   ((1U 
                                                     & (IData)(
                                                               (Div__DOT___clz_T_58 
                                                                >> 0x35U)))
                                                     ? 0x35U
                                                     : 
                                                    ((1U 
                                                      & (IData)(
                                                                (Div__DOT___clz_T_58 
                                                                 >> 0x36U)))
                                                      ? 0x36U
                                                      : 
                                                     ((1U 
                                                       & (IData)(
                                                                 (Div__DOT___clz_T_58 
                                                                  >> 0x37U)))
                                                       ? 0x37U
                                                       : 
                                                      ((1U 
                                                        & (IData)(
                                                                  (Div__DOT___clz_T_58 
                                                                   >> 0x38U)))
                                                        ? 0x38U
                                                        : 
                                                       ((1U 
                                                         & (IData)(
                                                                   (Div__DOT___clz_T_58 
                                                                    >> 0x39U)))
                                                         ? 0x39U
                                                         : 
                                                        ((1U 
                                                          & (IData)(
                                                                    (Div__DOT___clz_T_58 
                                                                     >> 0x3aU)))
                                                          ? 0x3aU
                                                          : 
                                                         ((1U 
                                                           & (IData)(
                                                                     (Div__DOT___clz_T_58 
                                                                      >> 0x3bU)))
                                                           ? 0x3bU
                                                           : 
                                                          ((1U 
                                                            & (IData)(
                                                                      (Div__DOT___clz_T_58 
                                                                       >> 0x3cU)))
                                                            ? 0x3cU
                                                            : 
                                                           ((1U 
                                                             & (IData)(
                                                                       (Div__DOT___clz_T_58 
                                                                        >> 0x3dU)))
                                                             ? 0x3dU
                                                             : 
                                                            ((1U 
                                                              & (IData)(
                                                                        (Div__DOT___clz_T_58 
                                                                         >> 0x3eU)))
                                                              ? 0x3eU
                                                              : 0x3fU)))))))))))))))));
    Div__DOT___clz_T_156 = ((1U & (IData)((Div__DOT___clz_T_58 
                                           >> 0x1dU)))
                             ? 0x1dU : ((1U & (IData)(
                                                      (Div__DOT___clz_T_58 
                                                       >> 0x1eU)))
                                         ? 0x1eU : 
                                        ((1U & (IData)(
                                                       (Div__DOT___clz_T_58 
                                                        >> 0x1fU)))
                                          ? 0x1fU : 
                                         ((1U & (IData)(
                                                        (Div__DOT___clz_T_58 
                                                         >> 0x20U)))
                                           ? 0x20U : 
                                          ((1U & (IData)(
                                                         (Div__DOT___clz_T_58 
                                                          >> 0x21U)))
                                            ? 0x21U
                                            : ((1U 
                                                & (IData)(
                                                          (Div__DOT___clz_T_58 
                                                           >> 0x22U)))
                                                ? 0x22U
                                                : (
                                                   (1U 
                                                    & (IData)(
                                                              (Div__DOT___clz_T_58 
                                                               >> 0x23U)))
                                                    ? 0x23U
                                                    : 
                                                   ((1U 
                                                     & (IData)(
                                                               (Div__DOT___clz_T_58 
                                                                >> 0x24U)))
                                                     ? 0x24U
                                                     : 
                                                    ((1U 
                                                      & (IData)(
                                                                (Div__DOT___clz_T_58 
                                                                 >> 0x25U)))
                                                      ? 0x25U
                                                      : 
                                                     ((1U 
                                                       & (IData)(
                                                                 (Div__DOT___clz_T_58 
                                                                  >> 0x26U)))
                                                       ? 0x26U
                                                       : 
                                                      ((1U 
                                                        & (IData)(
                                                                  (Div__DOT___clz_T_58 
                                                                   >> 0x27U)))
                                                        ? 0x27U
                                                        : 
                                                       ((1U 
                                                         & (IData)(
                                                                   (Div__DOT___clz_T_58 
                                                                    >> 0x28U)))
                                                         ? 0x28U
                                                         : 
                                                        ((1U 
                                                          & (IData)(
                                                                    (Div__DOT___clz_T_58 
                                                                     >> 0x29U)))
                                                          ? 0x29U
                                                          : 
                                                         ((1U 
                                                           & (IData)(
                                                                     (Div__DOT___clz_T_58 
                                                                      >> 0x2aU)))
                                                           ? 0x2aU
                                                           : 
                                                          ((1U 
                                                            & (IData)(
                                                                      (Div__DOT___clz_T_58 
                                                                       >> 0x2bU)))
                                                            ? 0x2bU
                                                            : 
                                                           ((1U 
                                                             & (IData)(
                                                                       (Div__DOT___clz_T_58 
                                                                        >> 0x2cU)))
                                                             ? 0x2cU
                                                             : 
                                                            ((1U 
                                                              & (IData)(
                                                                        (Div__DOT___clz_T_58 
                                                                         >> 0x2dU)))
                                                              ? 0x2dU
                                                              : (IData)(Div__DOT___clz_T_139))))))))))))))))));
    Div__DOT___clz_T_173 = ((1U & (IData)((Div__DOT___clz_T_58 
                                           >> 0xcU)))
                             ? 0xcU : ((1U & (IData)(
                                                     (Div__DOT___clz_T_58 
                                                      >> 0xdU)))
                                        ? 0xdU : ((1U 
                                                   & (IData)(
                                                             (Div__DOT___clz_T_58 
                                                              >> 0xeU)))
                                                   ? 0xeU
                                                   : 
                                                  ((1U 
                                                    & (IData)(
                                                              (Div__DOT___clz_T_58 
                                                               >> 0xfU)))
                                                    ? 0xfU
                                                    : 
                                                   ((1U 
                                                     & (IData)(
                                                               (Div__DOT___clz_T_58 
                                                                >> 0x10U)))
                                                     ? 0x10U
                                                     : 
                                                    ((1U 
                                                      & (IData)(
                                                                (Div__DOT___clz_T_58 
                                                                 >> 0x11U)))
                                                      ? 0x11U
                                                      : 
                                                     ((1U 
                                                       & (IData)(
                                                                 (Div__DOT___clz_T_58 
                                                                  >> 0x12U)))
                                                       ? 0x12U
                                                       : 
                                                      ((1U 
                                                        & (IData)(
                                                                  (Div__DOT___clz_T_58 
                                                                   >> 0x13U)))
                                                        ? 0x13U
                                                        : 
                                                       ((1U 
                                                         & (IData)(
                                                                   (Div__DOT___clz_T_58 
                                                                    >> 0x14U)))
                                                         ? 0x14U
                                                         : 
                                                        ((1U 
                                                          & (IData)(
                                                                    (Div__DOT___clz_T_58 
                                                                     >> 0x15U)))
                                                          ? 0x15U
                                                          : 
                                                         ((1U 
                                                           & (IData)(
                                                                     (Div__DOT___clz_T_58 
                                                                      >> 0x16U)))
                                                           ? 0x16U
                                                           : 
                                                          ((1U 
                                                            & (IData)(
                                                                      (Div__DOT___clz_T_58 
                                                                       >> 0x17U)))
                                                            ? 0x17U
                                                            : 
                                                           ((1U 
                                                             & (IData)(
                                                                       (Div__DOT___clz_T_58 
                                                                        >> 0x18U)))
                                                             ? 0x18U
                                                             : 
                                                            ((1U 
                                                              & (IData)(
                                                                        (Div__DOT___clz_T_58 
                                                                         >> 0x19U)))
                                                              ? 0x19U
                                                              : 
                                                             ((1U 
                                                               & (IData)(
                                                                         (Div__DOT___clz_T_58 
                                                                          >> 0x1aU)))
                                                               ? 0x1aU
                                                               : 
                                                              ((1U 
                                                                & (IData)(
                                                                          (Div__DOT___clz_T_58 
                                                                           >> 0x1bU)))
                                                                ? 0x1bU
                                                                : 
                                                               ((1U 
                                                                 & (IData)(
                                                                           (Div__DOT___clz_T_58 
                                                                            >> 0x1cU)))
                                                                 ? 0x1cU
                                                                 : (IData)(Div__DOT___clz_T_156))))))))))))))))));
    vlSelf->Div__DOT__clz = ((1U & (IData)(Div__DOT___clz_T_58))
                              ? 0U : ((1U & (IData)(
                                                    (Div__DOT___clz_T_58 
                                                     >> 1U)))
                                       ? 1U : ((1U 
                                                & (IData)(
                                                          (Div__DOT___clz_T_58 
                                                           >> 2U)))
                                                ? 2U
                                                : (
                                                   (1U 
                                                    & (IData)(
                                                              (Div__DOT___clz_T_58 
                                                               >> 3U)))
                                                    ? 3U
                                                    : 
                                                   ((1U 
                                                     & (IData)(
                                                               (Div__DOT___clz_T_58 
                                                                >> 4U)))
                                                     ? 4U
                                                     : 
                                                    ((1U 
                                                      & (IData)(
                                                                (Div__DOT___clz_T_58 
                                                                 >> 5U)))
                                                      ? 5U
                                                      : 
                                                     ((1U 
                                                       & (IData)(
                                                                 (Div__DOT___clz_T_58 
                                                                  >> 6U)))
                                                       ? 6U
                                                       : 
                                                      ((1U 
                                                        & (IData)(
                                                                  (Div__DOT___clz_T_58 
                                                                   >> 7U)))
                                                        ? 7U
                                                        : 
                                                       ((1U 
                                                         & (IData)(
                                                                   (Div__DOT___clz_T_58 
                                                                    >> 8U)))
                                                         ? 8U
                                                         : 
                                                        ((1U 
                                                          & (IData)(
                                                                    (Div__DOT___clz_T_58 
                                                                     >> 9U)))
                                                          ? 9U
                                                          : 
                                                         ((1U 
                                                           & (IData)(
                                                                     (Div__DOT___clz_T_58 
                                                                      >> 0xaU)))
                                                           ? 0xaU
                                                           : 
                                                          ((1U 
                                                            & (IData)(
                                                                      (Div__DOT___clz_T_58 
                                                                       >> 0xbU)))
                                                            ? 0xbU
                                                            : (IData)(Div__DOT___clz_T_173)))))))))))));
    __Vtemp_hf71593dd__2[0U] = vlSelf->Div__DOT__PA[2U];
    __Vtemp_hf71593dd__2[1U] = vlSelf->Div__DOT__PA[3U];
    __Vtemp_hf71593dd__2[2U] = vlSelf->Div__DOT__PA[4U];
    VL_EXTEND_WQ(65,64, __Vtemp_h9f986060__0, vlSelf->Div__DOT__B);
    VL_ADD_W(3, __Vtemp_hfa79365b__0, __Vtemp_hf71593dd__2, __Vtemp_h9f986060__0);
    __Vtemp_h11e8647c__0[0U] = __Vtemp_hfa79365b__0[0U];
    __Vtemp_h11e8647c__0[1U] = __Vtemp_hfa79365b__0[1U];
    __Vtemp_h11e8647c__0[2U] = (1U & __Vtemp_hfa79365b__0[2U]);
    VL_SHIFTR_WWI(65,65,6, __Vtemp_hd8850ac3__0, __Vtemp_h11e8647c__0, (IData)(vlSelf->Div__DOT__clz));
    __Vtemp_hfdd3f34b__0[0U] = vlSelf->Div__DOT__PA[2U];
    __Vtemp_hfdd3f34b__0[1U] = vlSelf->Div__DOT__PA[3U];
    __Vtemp_hfdd3f34b__0[2U] = (1U & vlSelf->Div__DOT__PA[4U]);
    VL_SHIFTR_WWI(65,65,6, __Vtemp_hdd8fb49f__0, __Vtemp_hfdd3f34b__0, (IData)(vlSelf->Div__DOT__clz));
    vlSelf->io_rem = (((QData)((IData)(((0U == (IData)(vlSelf->Div__DOT__state))
                                         ? vlSelf->Div__DOT__PA[3U]
                                         : ((1U == (IData)(vlSelf->Div__DOT__state))
                                             ? vlSelf->Div__DOT__PA[3U]
                                             : ((3U 
                                                 == (IData)(vlSelf->Div__DOT__state))
                                                 ? 0U
                                                 : 
                                                ((2U 
                                                  == (IData)(vlSelf->Div__DOT__state))
                                                  ? 
                                                 ((1U 
                                                   & vlSelf->Div__DOT__PA[4U])
                                                   ? 
                                                  __Vtemp_hd8850ac3__0[1U]
                                                   : 
                                                  __Vtemp_hdd8fb49f__0[1U])
                                                  : 
                                                 vlSelf->Div__DOT__PA[3U])))))) 
                       << 0x20U) | (QData)((IData)(
                                                   ((0U 
                                                     == (IData)(vlSelf->Div__DOT__state))
                                                     ? 
                                                    vlSelf->Div__DOT__PA[2U]
                                                     : 
                                                    ((1U 
                                                      == (IData)(vlSelf->Div__DOT__state))
                                                      ? 
                                                     vlSelf->Div__DOT__PA[2U]
                                                      : 
                                                     ((3U 
                                                       == (IData)(vlSelf->Div__DOT__state))
                                                       ? 0U
                                                       : 
                                                      ((2U 
                                                        == (IData)(vlSelf->Div__DOT__state))
                                                        ? 
                                                       ((1U 
                                                         & vlSelf->Div__DOT__PA[4U])
                                                         ? 
                                                        __Vtemp_hd8850ac3__0[0U]
                                                         : 
                                                        __Vtemp_hdd8fb49f__0[0U])
                                                        : 
                                                       vlSelf->Div__DOT__PA[2U])))))));
    VL_EXTEND_WQ(127,64, __Vtemp_he4d86bc2__0, vlSelf->io_b);
    VL_SHIFTL_WWI(127,127,6, __Vtemp_hb78c9f8b__0, __Vtemp_he4d86bc2__0, (IData)(vlSelf->Div__DOT__clz));
    VL_EXTEND_WQ(127,64, __Vtemp_h9f456cf2__0, vlSelf->Div__DOT__B);
    VL_EXTEND_WQ(127,64, __Vtemp_h9f456cf2__1, vlSelf->Div__DOT__B);
    if (vlSelf->reset) {
        vlSelf->Div__DOT___GEN_857[0U] = 0U;
        vlSelf->Div__DOT___GEN_857[1U] = 0U;
        vlSelf->Div__DOT___GEN_857[2U] = 0U;
        vlSelf->Div__DOT___GEN_857[3U] = 0U;
    } else if ((0U == (IData)(vlSelf->Div__DOT__state))) {
        if (vlSelf->io_start) {
            vlSelf->Div__DOT___GEN_857[0U] = __Vtemp_hb78c9f8b__0[0U];
            vlSelf->Div__DOT___GEN_857[1U] = __Vtemp_hb78c9f8b__0[1U];
            vlSelf->Div__DOT___GEN_857[2U] = __Vtemp_hb78c9f8b__0[2U];
            vlSelf->Div__DOT___GEN_857[3U] = (0x7fffffffU 
                                              & __Vtemp_hb78c9f8b__0[3U]);
        } else {
            vlSelf->Div__DOT___GEN_857[0U] = __Vtemp_h9f456cf2__0[0U];
            vlSelf->Div__DOT___GEN_857[1U] = __Vtemp_h9f456cf2__0[1U];
            vlSelf->Div__DOT___GEN_857[2U] = __Vtemp_h9f456cf2__0[2U];
            vlSelf->Div__DOT___GEN_857[3U] = (0x7fffffffU 
                                              & __Vtemp_h9f456cf2__0[3U]);
        }
    } else {
        vlSelf->Div__DOT___GEN_857[0U] = __Vtemp_h9f456cf2__1[0U];
        vlSelf->Div__DOT___GEN_857[1U] = __Vtemp_h9f456cf2__1[1U];
        vlSelf->Div__DOT___GEN_857[2U] = __Vtemp_h9f456cf2__1[2U];
        vlSelf->Div__DOT___GEN_857[3U] = (0x7fffffffU 
                                          & __Vtemp_h9f456cf2__1[3U]);
    }
    VL_EXTEND_WQ(192,64, __Vtemp_hea4f2118__0, vlSelf->io_a);
    VL_SHIFTL_WWI(192,192,6, __Vtemp_h80cdd6f4__0, __Vtemp_hea4f2118__0, (IData)(vlSelf->Div__DOT__clz));
    VL_EXTEND_WW(192,129, __Vtemp_h4fc94348__0, vlSelf->Div__DOT__PA);
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
    __Vtemp_h818f88a1__0[0U] = 0U;
    __Vtemp_h818f88a1__0[1U] = 0U;
    __Vtemp_h818f88a1__0[2U] = ((IData)(vlSelf->Div__DOT__B) 
                                << 1U);
    __Vtemp_h818f88a1__0[3U] = (((IData)(vlSelf->Div__DOT__B) 
                                 >> 0x1fU) | ((IData)(
                                                      (vlSelf->Div__DOT__B 
                                                       >> 0x20U)) 
                                              << 1U));
    __Vtemp_h818f88a1__0[4U] = ((IData)((vlSelf->Div__DOT__B 
                                         >> 0x20U)) 
                                >> 0x1fU);
    VL_EXTEND_WW(131,129, __Vtemp_hf5c402f4__0, __Vtemp_h818f88a1__0);
    VL_ADD_W(5, __Vtemp_h8eb1ce10__0, __Vtemp_h39a32276__0, __Vtemp_hf5c402f4__0);
    __Vtemp_h39a32276__1[0U] = (vlSelf->Div__DOT__PA[0U] 
                                << 2U);
    __Vtemp_h39a32276__1[1U] = ((vlSelf->Div__DOT__PA[0U] 
                                 >> 0x1eU) | (vlSelf->Div__DOT__PA[1U] 
                                              << 2U));
    __Vtemp_h39a32276__1[2U] = ((vlSelf->Div__DOT__PA[1U] 
                                 >> 0x1eU) | (vlSelf->Div__DOT__PA[2U] 
                                              << 2U));
    __Vtemp_h39a32276__1[3U] = ((vlSelf->Div__DOT__PA[2U] 
                                 >> 0x1eU) | (vlSelf->Div__DOT__PA[3U] 
                                              << 2U));
    __Vtemp_h39a32276__1[4U] = ((vlSelf->Div__DOT__PA[3U] 
                                 >> 0x1eU) | (vlSelf->Div__DOT__PA[4U] 
                                              << 2U));
    __Vtemp_h67b6e682__0[0U] = 0U;
    __Vtemp_h67b6e682__0[1U] = 0U;
    __Vtemp_h67b6e682__0[2U] = (IData)(vlSelf->Div__DOT__B);
    __Vtemp_h67b6e682__0[3U] = (IData)((vlSelf->Div__DOT__B 
                                        >> 0x20U));
    VL_EXTEND_WW(131,128, __Vtemp_hc2824b2f__0, __Vtemp_h67b6e682__0);
    VL_ADD_W(5, __Vtemp_hcae7a997__0, __Vtemp_h39a32276__1, __Vtemp_hc2824b2f__0);
    __Vtemp_h39a32276__3[0U] = (vlSelf->Div__DOT__PA[0U] 
                                << 2U);
    __Vtemp_h39a32276__3[1U] = ((vlSelf->Div__DOT__PA[0U] 
                                 >> 0x1eU) | (vlSelf->Div__DOT__PA[1U] 
                                              << 2U));
    __Vtemp_h39a32276__3[2U] = ((vlSelf->Div__DOT__PA[1U] 
                                 >> 0x1eU) | (vlSelf->Div__DOT__PA[2U] 
                                              << 2U));
    __Vtemp_h39a32276__3[3U] = ((vlSelf->Div__DOT__PA[2U] 
                                 >> 0x1eU) | (vlSelf->Div__DOT__PA[3U] 
                                              << 2U));
    __Vtemp_h39a32276__3[4U] = ((vlSelf->Div__DOT__PA[3U] 
                                 >> 0x1eU) | (vlSelf->Div__DOT__PA[4U] 
                                              << 2U));
    __Vtemp_h5e726cb9__0[0U] = 1U;
    __Vtemp_h5e726cb9__0[1U] = 0U;
    __Vtemp_h5e726cb9__0[2U] = 0U;
    VL_EXTEND_WQ(65,64, __Vtemp_h9f986060__1, vlSelf->Div__DOT__B);
    __Vtemp_h88b01313__0[0U] = (~ __Vtemp_h9f986060__1[0U]);
    __Vtemp_h88b01313__0[1U] = (~ __Vtemp_h9f986060__1[1U]);
    __Vtemp_h88b01313__0[2U] = (~ __Vtemp_h9f986060__1[2U]);
    VL_ADD_W(3, __Vtemp_h0eb039f6__0, __Vtemp_h5e726cb9__0, __Vtemp_h88b01313__0);
    __Vtemp_he5819244__0[0U] = 0U;
    __Vtemp_he5819244__0[1U] = 0U;
    __Vtemp_he5819244__0[2U] = __Vtemp_h0eb039f6__0[0U];
    __Vtemp_he5819244__0[3U] = __Vtemp_h0eb039f6__0[1U];
    __Vtemp_he5819244__0[4U] = (1U & __Vtemp_h0eb039f6__0[2U]);
    VL_EXTEND_WW(131,129, __Vtemp_h6e152c0d__0, __Vtemp_he5819244__0);
    VL_ADD_W(5, __Vtemp_he05627fe__0, __Vtemp_h39a32276__3, __Vtemp_h6e152c0d__0);
    __Vtemp_h39a32276__4[0U] = (vlSelf->Div__DOT__PA[0U] 
                                << 2U);
    __Vtemp_h39a32276__4[1U] = ((vlSelf->Div__DOT__PA[0U] 
                                 >> 0x1eU) | (vlSelf->Div__DOT__PA[1U] 
                                              << 2U));
    __Vtemp_h39a32276__4[2U] = ((vlSelf->Div__DOT__PA[1U] 
                                 >> 0x1eU) | (vlSelf->Div__DOT__PA[2U] 
                                              << 2U));
    __Vtemp_h39a32276__4[3U] = ((vlSelf->Div__DOT__PA[2U] 
                                 >> 0x1eU) | (vlSelf->Div__DOT__PA[3U] 
                                              << 2U));
    __Vtemp_h39a32276__4[4U] = ((vlSelf->Div__DOT__PA[3U] 
                                 >> 0x1eU) | (vlSelf->Div__DOT__PA[4U] 
                                              << 2U));
    __Vtemp_h5e726cb9__1[0U] = 1U;
    __Vtemp_h5e726cb9__1[1U] = 0U;
    __Vtemp_h5e726cb9__1[2U] = 0U;
    VL_EXTEND_WQ(65,64, __Vtemp_h9f986060__2, vlSelf->Div__DOT__B);
    __Vtemp_hcdf64823__0[0U] = (~ __Vtemp_h9f986060__2[0U]);
    __Vtemp_hcdf64823__0[1U] = (~ __Vtemp_h9f986060__2[1U]);
    __Vtemp_hcdf64823__0[2U] = (~ __Vtemp_h9f986060__2[2U]);
    VL_ADD_W(3, __Vtemp_h27753c9c__0, __Vtemp_h5e726cb9__1, __Vtemp_hcdf64823__0);
    __Vtemp_h8256dde8__0[0U] = 0U;
    __Vtemp_h8256dde8__0[1U] = 0U;
    __Vtemp_h8256dde8__0[2U] = (__Vtemp_h27753c9c__0[0U] 
                                << 1U);
    __Vtemp_h8256dde8__0[3U] = ((__Vtemp_h27753c9c__0[0U] 
                                 >> 0x1fU) | (__Vtemp_h27753c9c__0[1U] 
                                              << 1U));
    __Vtemp_h8256dde8__0[4U] = ((__Vtemp_h27753c9c__0[1U] 
                                 >> 0x1fU) | (2U & 
                                              (__Vtemp_h27753c9c__0[2U] 
                                               << 1U)));
    VL_EXTEND_WW(131,130, __Vtemp_h5d83c569__0, __Vtemp_h8256dde8__0);
    VL_ADD_W(5, __Vtemp_h1c84d948__0, __Vtemp_h39a32276__4, __Vtemp_h5d83c569__0);
    VL_EXTEND_WW(131,129, __Vtemp_h4fd31b46__0, vlSelf->Div__DOT__PA);
    VL_EXTEND_WW(131,129, __Vtemp_h4fd31b46__1, vlSelf->Div__DOT__PA);
    if ((1U == (IData)(vlSelf->Div__DOT__state))) {
        if ((6U == (IData)(vlSelf->Div__DOT__qSel))) {
            __Vtemp_haff6ab99__0[0U] = __Vtemp_h8eb1ce10__0[0U];
            __Vtemp_haff6ab99__0[1U] = __Vtemp_h8eb1ce10__0[1U];
            __Vtemp_haff6ab99__0[2U] = __Vtemp_h8eb1ce10__0[2U];
            __Vtemp_haff6ab99__0[3U] = __Vtemp_h8eb1ce10__0[3U];
            __Vtemp_haff6ab99__0[4U] = (7U & __Vtemp_h8eb1ce10__0[4U]);
        } else if ((7U == (IData)(vlSelf->Div__DOT__qSel))) {
            __Vtemp_haff6ab99__0[0U] = __Vtemp_hcae7a997__0[0U];
            __Vtemp_haff6ab99__0[1U] = __Vtemp_hcae7a997__0[1U];
            __Vtemp_haff6ab99__0[2U] = __Vtemp_hcae7a997__0[2U];
            __Vtemp_haff6ab99__0[3U] = __Vtemp_hcae7a997__0[3U];
            __Vtemp_haff6ab99__0[4U] = (7U & __Vtemp_hcae7a997__0[4U]);
        } else if ((0U == (IData)(vlSelf->Div__DOT__qSel))) {
            __Vtemp_haff6ab99__0[0U] = (vlSelf->Div__DOT__PA[0U] 
                                        << 2U);
            __Vtemp_haff6ab99__0[1U] = ((vlSelf->Div__DOT__PA[0U] 
                                         >> 0x1eU) 
                                        | (vlSelf->Div__DOT__PA[1U] 
                                           << 2U));
            __Vtemp_haff6ab99__0[2U] = ((vlSelf->Div__DOT__PA[1U] 
                                         >> 0x1eU) 
                                        | (vlSelf->Div__DOT__PA[2U] 
                                           << 2U));
            __Vtemp_haff6ab99__0[3U] = ((vlSelf->Div__DOT__PA[2U] 
                                         >> 0x1eU) 
                                        | (vlSelf->Div__DOT__PA[3U] 
                                           << 2U));
            __Vtemp_haff6ab99__0[4U] = (7U & ((vlSelf->Div__DOT__PA[3U] 
                                               >> 0x1eU) 
                                              | (vlSelf->Div__DOT__PA[4U] 
                                                 << 2U)));
        } else if ((1U == (IData)(vlSelf->Div__DOT__qSel))) {
            __Vtemp_haff6ab99__0[0U] = __Vtemp_he05627fe__0[0U];
            __Vtemp_haff6ab99__0[1U] = __Vtemp_he05627fe__0[1U];
            __Vtemp_haff6ab99__0[2U] = __Vtemp_he05627fe__0[2U];
            __Vtemp_haff6ab99__0[3U] = __Vtemp_he05627fe__0[3U];
            __Vtemp_haff6ab99__0[4U] = (7U & __Vtemp_he05627fe__0[4U]);
        } else if ((2U == (IData)(vlSelf->Div__DOT__qSel))) {
            __Vtemp_haff6ab99__0[0U] = __Vtemp_h1c84d948__0[0U];
            __Vtemp_haff6ab99__0[1U] = __Vtemp_h1c84d948__0[1U];
            __Vtemp_haff6ab99__0[2U] = __Vtemp_h1c84d948__0[2U];
            __Vtemp_haff6ab99__0[3U] = __Vtemp_h1c84d948__0[3U];
            __Vtemp_haff6ab99__0[4U] = (7U & __Vtemp_h1c84d948__0[4U]);
        } else {
            __Vtemp_haff6ab99__0[0U] = __Vtemp_h4fd31b46__0[0U];
            __Vtemp_haff6ab99__0[1U] = __Vtemp_h4fd31b46__0[1U];
            __Vtemp_haff6ab99__0[2U] = __Vtemp_h4fd31b46__0[2U];
            __Vtemp_haff6ab99__0[3U] = __Vtemp_h4fd31b46__0[3U];
            __Vtemp_haff6ab99__0[4U] = (7U & __Vtemp_h4fd31b46__0[4U]);
        }
    } else {
        __Vtemp_haff6ab99__0[0U] = __Vtemp_h4fd31b46__1[0U];
        __Vtemp_haff6ab99__0[1U] = __Vtemp_h4fd31b46__1[1U];
        __Vtemp_haff6ab99__0[2U] = __Vtemp_h4fd31b46__1[2U];
        __Vtemp_haff6ab99__0[3U] = __Vtemp_h4fd31b46__1[3U];
        __Vtemp_haff6ab99__0[4U] = (7U & __Vtemp_h4fd31b46__1[4U]);
    }
    VL_EXTEND_WW(192,131, __Vtemp_h43f28e70__0, __Vtemp_haff6ab99__0);
    if (vlSelf->reset) {
        vlSelf->Div__DOT___GEN_856[0U] = 0U;
        vlSelf->Div__DOT___GEN_856[1U] = 0U;
        vlSelf->Div__DOT___GEN_856[2U] = 0U;
        vlSelf->Div__DOT___GEN_856[3U] = 0U;
        vlSelf->Div__DOT___GEN_856[4U] = 0U;
        vlSelf->Div__DOT___GEN_856[5U] = 0U;
    } else if ((0U == (IData)(vlSelf->Div__DOT__state))) {
        if (vlSelf->io_start) {
            vlSelf->Div__DOT___GEN_856[0U] = __Vtemp_h80cdd6f4__0[0U];
            vlSelf->Div__DOT___GEN_856[1U] = __Vtemp_h80cdd6f4__0[1U];
            vlSelf->Div__DOT___GEN_856[2U] = __Vtemp_h80cdd6f4__0[2U];
            vlSelf->Div__DOT___GEN_856[3U] = __Vtemp_h80cdd6f4__0[3U];
            vlSelf->Div__DOT___GEN_856[4U] = __Vtemp_h80cdd6f4__0[4U];
            vlSelf->Div__DOT___GEN_856[5U] = __Vtemp_h80cdd6f4__0[5U];
        } else {
            vlSelf->Div__DOT___GEN_856[0U] = __Vtemp_h4fc94348__0[0U];
            vlSelf->Div__DOT___GEN_856[1U] = __Vtemp_h4fc94348__0[1U];
            vlSelf->Div__DOT___GEN_856[2U] = __Vtemp_h4fc94348__0[2U];
            vlSelf->Div__DOT___GEN_856[3U] = __Vtemp_h4fc94348__0[3U];
            vlSelf->Div__DOT___GEN_856[4U] = __Vtemp_h4fc94348__0[4U];
            vlSelf->Div__DOT___GEN_856[5U] = __Vtemp_h4fc94348__0[5U];
        }
    } else {
        vlSelf->Div__DOT___GEN_856[0U] = __Vtemp_h43f28e70__0[0U];
        vlSelf->Div__DOT___GEN_856[1U] = __Vtemp_h43f28e70__0[1U];
        vlSelf->Div__DOT___GEN_856[2U] = __Vtemp_h43f28e70__0[2U];
        vlSelf->Div__DOT___GEN_856[3U] = __Vtemp_h43f28e70__0[3U];
        vlSelf->Div__DOT___GEN_856[4U] = __Vtemp_h43f28e70__0[4U];
        vlSelf->Div__DOT___GEN_856[5U] = __Vtemp_h43f28e70__0[5U];
    }
}

void VDiv___024root___eval(VDiv___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDiv__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDiv___024root___eval\n"); );
    // Body
    if (((IData)(vlSelf->clock) & (~ (IData)(vlSelf->__Vclklast__TOP__clock)))) {
        VDiv___024root___sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
    }
    VDiv___024root___combo__TOP__0(vlSelf);
    // Final
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

#ifdef VL_DEBUG
void VDiv___024root___eval_debug_assertions(VDiv___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDiv__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDiv___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((vlSelf->io_start & 0xfeU))) {
        Verilated::overWidthError("io_start");}
}
#endif  // VL_DEBUG
