// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VTop__Syms.h"


void VTop___024root__trace_chg_sub_0(VTop___024root* vlSelf, VerilatedVcd* tracep);

void VTop___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root__trace_chg_top_0\n"); );
    // Init
    VTop___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VTop___024root*>(voidSelf);
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    VTop___024root__trace_chg_sub_0((&vlSymsp->TOP), tracep);
}

void VTop___024root__trace_chg_sub_0(VTop___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root__trace_chg_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = tracep->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
        tracep->chgIData(oldp+0,(vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_data),32);
        tracep->chgQData(oldp+1,(vlSelf->Top__DOT__IF__DOT__pc),64);
        tracep->chgQData(oldp+3,(vlSelf->Top__DOT__MEM_WB__DOT__wdata),64);
        tracep->chgCData(oldp+5,((0x1fU & (IData)((vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                   >> 0xfU)))),5);
        tracep->chgCData(oldp+6,((0x1fU & (IData)((vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                   >> 0x14U)))),5);
        tracep->chgQData(oldp+7,(vlSelf->Top__DOT__REGFILE__DOT__rf
                                 [(0x1fU & (IData)(
                                                   (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                    >> 0xfU)))]),64);
        tracep->chgQData(oldp+9,(vlSelf->Top__DOT__REGFILE__DOT__rf
                                 [(0x1fU & (IData)(
                                                   (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                    >> 0x14U)))]),64);
        tracep->chgQData(oldp+11,((QData)((IData)(vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_data))),64);
        tracep->chgQData(oldp+13,(vlSelf->Top__DOT__IF_ID__DOT__inst),64);
        tracep->chgIData(oldp+15,((IData)(vlSelf->Top__DOT__IF_ID__DOT__inst)),32);
        tracep->chgQData(oldp+16,(((0x33U == (0x7fU 
                                              & (IData)(vlSelf->Top__DOT__IF_ID__DOT__inst)))
                                    ? ((0U == (0x7fU 
                                               & (IData)(
                                                         (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                          >> 0x19U))))
                                        ? ((0U == (7U 
                                                   & (IData)(
                                                             (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                              >> 0xcU))))
                                            ? vlSelf->Top__DOT__REGFILE__DOT__rf
                                           [(0x1fU 
                                             & (IData)(
                                                       (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                        >> 0xfU)))]
                                            : 0ULL)
                                        : 0ULL) : 0ULL)),64);
        tracep->chgQData(oldp+18,(((0x33U == (0x7fU 
                                              & (IData)(vlSelf->Top__DOT__IF_ID__DOT__inst)))
                                    ? ((0U == (0x7fU 
                                               & (IData)(
                                                         (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                          >> 0x19U))))
                                        ? ((0U == (7U 
                                                   & (IData)(
                                                             (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                              >> 0xcU))))
                                            ? vlSelf->Top__DOT__REGFILE__DOT__rf
                                           [(0x1fU 
                                             & (IData)(
                                                       (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                        >> 0x14U)))]
                                            : 0ULL)
                                        : 0ULL) : 0ULL)),64);
        tracep->chgCData(oldp+20,((0x7fU & (IData)(vlSelf->Top__DOT__IF_ID__DOT__inst))),7);
        tracep->chgCData(oldp+21,(((0x33U == (0x7fU 
                                              & (IData)(vlSelf->Top__DOT__IF_ID__DOT__inst))) 
                                   & (IData)((0ULL 
                                              == (0xfe007000ULL 
                                                  & vlSelf->Top__DOT__IF_ID__DOT__inst))))),4);
        tracep->chgCData(oldp+22,(vlSelf->Top__DOT__ID_EX__DOT__opcode),7);
        tracep->chgQData(oldp+23,(vlSelf->Top__DOT__ID_EX__DOT__oprand1),64);
        tracep->chgQData(oldp+25,(vlSelf->Top__DOT__ID_EX__DOT__oprand2),64);
        tracep->chgCData(oldp+27,(vlSelf->Top__DOT__ID_EX__DOT__aluop),4);
        tracep->chgQData(oldp+28,(((0x33U == (IData)(vlSelf->Top__DOT__ID_EX__DOT__opcode))
                                    ? ((0U == (IData)(vlSelf->Top__DOT__ID_EX__DOT__aluop))
                                        ? 0ULL : ((1U 
                                                   == (IData)(vlSelf->Top__DOT__ID_EX__DOT__aluop))
                                                   ? 
                                                  (vlSelf->Top__DOT__ID_EX__DOT__oprand1 
                                                   + vlSelf->Top__DOT__ID_EX__DOT__oprand2)
                                                   : 0ULL))
                                    : 0ULL)),64);
        tracep->chgQData(oldp+30,(vlSelf->Top__DOT__EX_MEM__DOT__wdata),64);
        tracep->chgQData(oldp+32,(((0U == (IData)(vlSelf->Top__DOT__ID_EX__DOT__aluop))
                                    ? 0ULL : ((1U == (IData)(vlSelf->Top__DOT__ID_EX__DOT__aluop))
                                               ? (vlSelf->Top__DOT__ID_EX__DOT__oprand1 
                                                  + vlSelf->Top__DOT__ID_EX__DOT__oprand2)
                                               : 0ULL))),64);
        tracep->chgCData(oldp+34,((7U & (IData)((vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                 >> 0xcU)))),3);
        tracep->chgCData(oldp+35,((0x7fU & (IData)(
                                                   (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                    >> 0x19U)))),7);
        tracep->chgBit(oldp+36,((IData)((0x33ULL == 
                                         (0xfe00707fULL 
                                          & vlSelf->Top__DOT__IF_ID__DOT__inst)))));
        tracep->chgBit(oldp+37,(vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_en_pipe_0));
        tracep->chgSData(oldp+38,(vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_addr_pipe_0),13);
        tracep->chgQData(oldp+39,(vlSelf->Top__DOT__REGFILE__DOT__rf[0]),64);
        tracep->chgQData(oldp+41,(vlSelf->Top__DOT__REGFILE__DOT__rf[1]),64);
        tracep->chgQData(oldp+43,(vlSelf->Top__DOT__REGFILE__DOT__rf[2]),64);
        tracep->chgQData(oldp+45,(vlSelf->Top__DOT__REGFILE__DOT__rf[3]),64);
        tracep->chgQData(oldp+47,(vlSelf->Top__DOT__REGFILE__DOT__rf[4]),64);
        tracep->chgQData(oldp+49,(vlSelf->Top__DOT__REGFILE__DOT__rf[5]),64);
        tracep->chgQData(oldp+51,(vlSelf->Top__DOT__REGFILE__DOT__rf[6]),64);
        tracep->chgQData(oldp+53,(vlSelf->Top__DOT__REGFILE__DOT__rf[7]),64);
        tracep->chgQData(oldp+55,(vlSelf->Top__DOT__REGFILE__DOT__rf[8]),64);
        tracep->chgQData(oldp+57,(vlSelf->Top__DOT__REGFILE__DOT__rf[9]),64);
        tracep->chgQData(oldp+59,(vlSelf->Top__DOT__REGFILE__DOT__rf[10]),64);
        tracep->chgQData(oldp+61,(vlSelf->Top__DOT__REGFILE__DOT__rf[11]),64);
        tracep->chgQData(oldp+63,(vlSelf->Top__DOT__REGFILE__DOT__rf[12]),64);
        tracep->chgQData(oldp+65,(vlSelf->Top__DOT__REGFILE__DOT__rf[13]),64);
        tracep->chgQData(oldp+67,(vlSelf->Top__DOT__REGFILE__DOT__rf[14]),64);
        tracep->chgQData(oldp+69,(vlSelf->Top__DOT__REGFILE__DOT__rf[15]),64);
        tracep->chgQData(oldp+71,(vlSelf->Top__DOT__REGFILE__DOT__rf[16]),64);
        tracep->chgQData(oldp+73,(vlSelf->Top__DOT__REGFILE__DOT__rf[17]),64);
        tracep->chgQData(oldp+75,(vlSelf->Top__DOT__REGFILE__DOT__rf[18]),64);
        tracep->chgQData(oldp+77,(vlSelf->Top__DOT__REGFILE__DOT__rf[19]),64);
        tracep->chgQData(oldp+79,(vlSelf->Top__DOT__REGFILE__DOT__rf[20]),64);
        tracep->chgQData(oldp+81,(vlSelf->Top__DOT__REGFILE__DOT__rf[21]),64);
        tracep->chgQData(oldp+83,(vlSelf->Top__DOT__REGFILE__DOT__rf[22]),64);
        tracep->chgQData(oldp+85,(vlSelf->Top__DOT__REGFILE__DOT__rf[23]),64);
        tracep->chgQData(oldp+87,(vlSelf->Top__DOT__REGFILE__DOT__rf[24]),64);
        tracep->chgQData(oldp+89,(vlSelf->Top__DOT__REGFILE__DOT__rf[25]),64);
        tracep->chgQData(oldp+91,(vlSelf->Top__DOT__REGFILE__DOT__rf[26]),64);
        tracep->chgQData(oldp+93,(vlSelf->Top__DOT__REGFILE__DOT__rf[27]),64);
        tracep->chgQData(oldp+95,(vlSelf->Top__DOT__REGFILE__DOT__rf[28]),64);
        tracep->chgQData(oldp+97,(vlSelf->Top__DOT__REGFILE__DOT__rf[29]),64);
        tracep->chgQData(oldp+99,(vlSelf->Top__DOT__REGFILE__DOT__rf[30]),64);
        tracep->chgQData(oldp+101,(vlSelf->Top__DOT__REGFILE__DOT__rf[31]),64);
    }
    tracep->chgBit(oldp+103,(vlSelf->clock));
    tracep->chgBit(oldp+104,(vlSelf->reset));
    tracep->chgQData(oldp+105,(vlSelf->io_o1),64);
    tracep->chgIData(oldp+107,(vlSelf->io_o2),32);
    tracep->chgQData(oldp+108,(vlSelf->io_o3),64);
    tracep->chgQData(oldp+110,(vlSelf->io_o4),64);
}

void VTop___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root__trace_cleanup\n"); );
    // Init
    VTop___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VTop___024root*>(voidSelf);
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
}
