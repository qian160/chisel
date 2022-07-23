// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTop.h for the primary calling header

#include "verilated.h"

#include "VTop___024root.h"

VL_INLINE_OPT void VTop___024root___sequent__TOP__0(VTop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root___sequent__TOP__0\n"); );
    // Body
    vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_en_pipe_0 = 1U;
    vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_addr_pipe_0 
        = (0x1fffU & (IData)((vlSelf->Top__DOT__IF__DOT__pc 
                              >> 2U)));
    vlSelf->Top__DOT__MEM_WB__DOT__wdata = vlSelf->Top__DOT__EX_MEM__DOT__wdata;
    vlSelf->Top__DOT__IF__DOT__pc = ((IData)(vlSelf->reset)
                                      ? 0ULL : vlSelf->Top__DOT__IF__DOT___pc_T_1);
    vlSelf->io_o1 = vlSelf->Top__DOT__MEM_WB__DOT__wdata;
    vlSelf->Top__DOT__EX_MEM__DOT__wdata = ((0x33U 
                                             == (IData)(vlSelf->Top__DOT__ID_EX__DOT__opcode))
                                             ? ((0U 
                                                 == (IData)(vlSelf->Top__DOT__ID_EX__DOT__aluop))
                                                 ? 0ULL
                                                 : 
                                                ((1U 
                                                  == (IData)(vlSelf->Top__DOT__ID_EX__DOT__aluop))
                                                  ? 
                                                 (vlSelf->Top__DOT__ID_EX__DOT__oprand1 
                                                  + vlSelf->Top__DOT__ID_EX__DOT__oprand2)
                                                  : 0ULL))
                                             : 0ULL);
    vlSelf->Top__DOT__IF__DOT___pc_T_1 = (4ULL + vlSelf->Top__DOT__IF__DOT__pc);
    vlSelf->Top__DOT__ID_EX__DOT__opcode = (0x7fU & (IData)(vlSelf->Top__DOT__IF_ID__DOT__inst));
    vlSelf->Top__DOT__ID_EX__DOT__aluop = ((0x33U == 
                                            (0x7fU 
                                             & (IData)(vlSelf->Top__DOT__IF_ID__DOT__inst))) 
                                           & (IData)(
                                                     (0ULL 
                                                      == 
                                                      (0xfe007000ULL 
                                                       & vlSelf->Top__DOT__IF_ID__DOT__inst))));
    if ((0x33U == (0x7fU & (IData)(vlSelf->Top__DOT__IF_ID__DOT__inst)))) {
        if ((0U == (0x7fU & (IData)((vlSelf->Top__DOT__IF_ID__DOT__inst 
                                     >> 0x19U))))) {
            if ((0U == (7U & (IData)((vlSelf->Top__DOT__IF_ID__DOT__inst 
                                      >> 0xcU))))) {
                vlSelf->Top__DOT__ID_EX__DOT__oprand1 
                    = vlSelf->Top__DOT__REGFILE__DOT__rf
                    [(0x1fU & (IData)((vlSelf->Top__DOT__IF_ID__DOT__inst 
                                       >> 0xfU)))];
                vlSelf->Top__DOT__ID_EX__DOT__oprand2 
                    = vlSelf->Top__DOT__REGFILE__DOT__rf
                    [(0x1fU & (IData)((vlSelf->Top__DOT__IF_ID__DOT__inst 
                                       >> 0x14U)))];
            } else {
                vlSelf->Top__DOT__ID_EX__DOT__oprand1 = 0ULL;
                vlSelf->Top__DOT__ID_EX__DOT__oprand2 = 0ULL;
            }
        } else {
            vlSelf->Top__DOT__ID_EX__DOT__oprand1 = 0ULL;
            vlSelf->Top__DOT__ID_EX__DOT__oprand2 = 0ULL;
        }
    } else {
        vlSelf->Top__DOT__ID_EX__DOT__oprand1 = 0ULL;
        vlSelf->Top__DOT__ID_EX__DOT__oprand2 = 0ULL;
    }
    vlSelf->Top__DOT__REGFILE__DOT__rf[0U] = 0ULL;
    vlSelf->Top__DOT__REGFILE__DOT__rf[1U] = 0x1bf52ULL;
    vlSelf->Top__DOT__IF_ID__DOT__inst = (QData)((IData)(vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_data));
    vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_data 
        = vlSelf->Top__DOT__INST_ROM__DOT__mem[vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_addr_pipe_0];
    vlSelf->io_o2 = vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_data;
}

void VTop___024root___eval(VTop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root___eval\n"); );
    // Body
    if (((IData)(vlSelf->clock) & (~ (IData)(vlSelf->__Vclklast__TOP__clock)))) {
        VTop___024root___sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
    }
    // Final
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

#ifdef VL_DEBUG
void VTop___024root___eval_debug_assertions(VTop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
}
#endif  // VL_DEBUG
