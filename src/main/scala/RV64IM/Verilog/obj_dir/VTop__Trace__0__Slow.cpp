// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VTop__Syms.h"


VL_ATTR_COLD void VTop___024root__trace_init_sub__TOP__0(VTop___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root__trace_init_sub__TOP__0\n"); );
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBit(c+104,"clock", false,-1);
    tracep->declBit(c+105,"reset", false,-1);
    tracep->declQuad(c+106,"io_o1", false,-1, 63,0);
    tracep->declBus(c+108,"io_o2", false,-1, 31,0);
    tracep->declQuad(c+109,"io_o3", false,-1, 63,0);
    tracep->declQuad(c+111,"io_o4", false,-1, 63,0);
    tracep->pushNamePrefix("Top ");
    tracep->declBit(c+104,"clock", false,-1);
    tracep->declBit(c+105,"reset", false,-1);
    tracep->declQuad(c+106,"io_o1", false,-1, 63,0);
    tracep->declBus(c+108,"io_o2", false,-1, 31,0);
    tracep->declQuad(c+109,"io_o3", false,-1, 63,0);
    tracep->declQuad(c+111,"io_o4", false,-1, 63,0);
    tracep->declBit(c+104,"IF_clock", false,-1);
    tracep->declBit(c+105,"IF_reset", false,-1);
    tracep->declBus(c+1,"IF_io_inst_i", false,-1, 31,0);
    tracep->declQuad(c+2,"IF_io_pc_o", false,-1, 63,0);
    tracep->declBus(c+1,"IF_io_inst_o", false,-1, 31,0);
    tracep->declBit(c+104,"INST_ROM_clock", false,-1);
    tracep->declQuad(c+2,"INST_ROM_io_addr_i", false,-1, 63,0);
    tracep->declBus(c+1,"INST_ROM_io_inst_o", false,-1, 31,0);
    tracep->declBit(c+104,"REGFILE_clock", false,-1);
    tracep->declQuad(c+4,"REGFILE_io_write_data_i", false,-1, 63,0);
    tracep->declBus(c+6,"REGFILE_io_read_idx1_i", false,-1, 4,0);
    tracep->declBus(c+7,"REGFILE_io_read_idx2_i", false,-1, 4,0);
    tracep->declQuad(c+8,"REGFILE_io_data1_o", false,-1, 63,0);
    tracep->declQuad(c+10,"REGFILE_io_data2_o", false,-1, 63,0);
    tracep->declBit(c+104,"IF_ID_clock", false,-1);
    tracep->declQuad(c+12,"IF_ID_io_if_inst_i", false,-1, 63,0);
    tracep->declQuad(c+14,"IF_ID_io_if_inst_o", false,-1, 63,0);
    tracep->declBus(c+16,"ID_io_id_inst_i", false,-1, 31,0);
    tracep->declQuad(c+8,"ID_io_id_RegData1_i", false,-1, 63,0);
    tracep->declQuad(c+10,"ID_io_id_RegData2_i", false,-1, 63,0);
    tracep->declQuad(c+17,"ID_io_id_oprand1_o", false,-1, 63,0);
    tracep->declQuad(c+19,"ID_io_id_oprand2_o", false,-1, 63,0);
    tracep->declBus(c+6,"ID_io_id_ReadIdx1_o", false,-1, 4,0);
    tracep->declBus(c+7,"ID_io_id_ReadIdx2_o", false,-1, 4,0);
    tracep->declBus(c+21,"ID_io_id_opcode_o", false,-1, 6,0);
    tracep->declBus(c+22,"ID_io_id_aluop_o", false,-1, 3,0);
    tracep->declBit(c+104,"ID_EX_clock", false,-1);
    tracep->declBus(c+21,"ID_EX_io_id_opcode_i", false,-1, 6,0);
    tracep->declQuad(c+17,"ID_EX_io_id_oprand1_i", false,-1, 63,0);
    tracep->declQuad(c+19,"ID_EX_io_id_oprand2_i", false,-1, 63,0);
    tracep->declBus(c+22,"ID_EX_io_id_aluop_i", false,-1, 3,0);
    tracep->declBus(c+23,"ID_EX_io_ex_opcode_o", false,-1, 6,0);
    tracep->declQuad(c+24,"ID_EX_io_ex_oprand1_o", false,-1, 63,0);
    tracep->declQuad(c+26,"ID_EX_io_ex_oprand2_o", false,-1, 63,0);
    tracep->declBus(c+28,"ID_EX_io_ex_aluop_o", false,-1, 3,0);
    tracep->declBus(c+23,"EX_io_ex_opcode_i", false,-1, 6,0);
    tracep->declBus(c+28,"EX_io_ex_aluop_i", false,-1, 3,0);
    tracep->declQuad(c+24,"EX_io_ex_oprand1_i", false,-1, 63,0);
    tracep->declQuad(c+26,"EX_io_ex_oprand2_i", false,-1, 63,0);
    tracep->declQuad(c+29,"EX_io_ex_wdata_o", false,-1, 63,0);
    tracep->declBit(c+104,"EX_MEM_clock", false,-1);
    tracep->declQuad(c+29,"EX_MEM_io_ex_wdata_i", false,-1, 63,0);
    tracep->declQuad(c+31,"EX_MEM_io_mem_wdata_o", false,-1, 63,0);
    tracep->declQuad(c+31,"MEM_io_mem_wdata_i", false,-1, 63,0);
    tracep->declQuad(c+31,"MEM_io_mem_wdata_o", false,-1, 63,0);
    tracep->declBit(c+104,"MEM_WB_clock", false,-1);
    tracep->declQuad(c+31,"MEM_WB_io_mem_wdata_i", false,-1, 63,0);
    tracep->declQuad(c+4,"MEM_WB_io_wb_wdata_o", false,-1, 63,0);
    tracep->declQuad(c+4,"WB_io_wb_wdata_i", false,-1, 63,0);
    tracep->declQuad(c+4,"WB_io_wb_wdata_o", false,-1, 63,0);
    tracep->pushNamePrefix("EX ");
    tracep->declBus(c+23,"io_ex_opcode_i", false,-1, 6,0);
    tracep->declBus(c+28,"io_ex_aluop_i", false,-1, 3,0);
    tracep->declQuad(c+24,"io_ex_oprand1_i", false,-1, 63,0);
    tracep->declQuad(c+26,"io_ex_oprand2_i", false,-1, 63,0);
    tracep->declQuad(c+29,"io_ex_wdata_o", false,-1, 63,0);
    tracep->declQuad(c+33,"alu_result", false,-1, 63,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("EX_MEM ");
    tracep->declBit(c+104,"clock", false,-1);
    tracep->declQuad(c+29,"io_ex_wdata_i", false,-1, 63,0);
    tracep->declQuad(c+31,"io_mem_wdata_o", false,-1, 63,0);
    tracep->declQuad(c+31,"wdata", false,-1, 63,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("ID ");
    tracep->declBus(c+16,"io_id_inst_i", false,-1, 31,0);
    tracep->declQuad(c+8,"io_id_RegData1_i", false,-1, 63,0);
    tracep->declQuad(c+10,"io_id_RegData2_i", false,-1, 63,0);
    tracep->declQuad(c+17,"io_id_oprand1_o", false,-1, 63,0);
    tracep->declQuad(c+19,"io_id_oprand2_o", false,-1, 63,0);
    tracep->declBus(c+6,"io_id_ReadIdx1_o", false,-1, 4,0);
    tracep->declBus(c+7,"io_id_ReadIdx2_o", false,-1, 4,0);
    tracep->declBus(c+21,"io_id_opcode_o", false,-1, 6,0);
    tracep->declBus(c+22,"io_id_aluop_o", false,-1, 3,0);
    tracep->declBus(c+21,"opcode", false,-1, 6,0);
    tracep->declBus(c+35,"funct3", false,-1, 2,0);
    tracep->declBus(c+36,"funct7", false,-1, 6,0);
    tracep->declBit(c+37,"wreg", false,-1);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("ID_EX ");
    tracep->declBit(c+104,"clock", false,-1);
    tracep->declBus(c+21,"io_id_opcode_i", false,-1, 6,0);
    tracep->declQuad(c+17,"io_id_oprand1_i", false,-1, 63,0);
    tracep->declQuad(c+19,"io_id_oprand2_i", false,-1, 63,0);
    tracep->declBus(c+22,"io_id_aluop_i", false,-1, 3,0);
    tracep->declBus(c+23,"io_ex_opcode_o", false,-1, 6,0);
    tracep->declQuad(c+24,"io_ex_oprand1_o", false,-1, 63,0);
    tracep->declQuad(c+26,"io_ex_oprand2_o", false,-1, 63,0);
    tracep->declBus(c+28,"io_ex_aluop_o", false,-1, 3,0);
    tracep->declBus(c+23,"opcode", false,-1, 6,0);
    tracep->declQuad(c+24,"oprand1", false,-1, 63,0);
    tracep->declQuad(c+26,"oprand2", false,-1, 63,0);
    tracep->declBus(c+28,"aluop", false,-1, 3,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("IF ");
    tracep->declBit(c+104,"clock", false,-1);
    tracep->declBit(c+105,"reset", false,-1);
    tracep->declBus(c+1,"io_inst_i", false,-1, 31,0);
    tracep->declQuad(c+2,"io_pc_o", false,-1, 63,0);
    tracep->declBus(c+1,"io_inst_o", false,-1, 31,0);
    tracep->declQuad(c+2,"pc", false,-1, 63,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("IF_ID ");
    tracep->declBit(c+104,"clock", false,-1);
    tracep->declQuad(c+12,"io_if_inst_i", false,-1, 63,0);
    tracep->declQuad(c+14,"io_if_inst_o", false,-1, 63,0);
    tracep->declQuad(c+14,"inst", false,-1, 63,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("INST_ROM ");
    tracep->declBit(c+104,"clock", false,-1);
    tracep->declQuad(c+2,"io_addr_i", false,-1, 63,0);
    tracep->declBus(c+1,"io_inst_o", false,-1, 31,0);
    tracep->declBit(c+38,"mem_io_inst_o_MPORT_en", false,-1);
    tracep->declBus(c+39,"mem_io_inst_o_MPORT_addr", false,-1, 12,0);
    tracep->declBus(c+1,"mem_io_inst_o_MPORT_data", false,-1, 31,0);
    tracep->declBit(c+38,"mem_io_inst_o_MPORT_en_pipe_0", false,-1);
    tracep->declBus(c+39,"mem_io_inst_o_MPORT_addr_pipe_0", false,-1, 12,0);
    tracep->declBus(c+113,"initvar", false,-1, 31,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("MEM ");
    tracep->declQuad(c+31,"io_mem_wdata_i", false,-1, 63,0);
    tracep->declQuad(c+31,"io_mem_wdata_o", false,-1, 63,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("MEM_WB ");
    tracep->declBit(c+104,"clock", false,-1);
    tracep->declQuad(c+31,"io_mem_wdata_i", false,-1, 63,0);
    tracep->declQuad(c+4,"io_wb_wdata_o", false,-1, 63,0);
    tracep->declQuad(c+4,"wdata", false,-1, 63,0);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("REGFILE ");
    tracep->declBit(c+104,"clock", false,-1);
    tracep->declQuad(c+4,"io_write_data_i", false,-1, 63,0);
    tracep->declBus(c+6,"io_read_idx1_i", false,-1, 4,0);
    tracep->declBus(c+7,"io_read_idx2_i", false,-1, 4,0);
    tracep->declQuad(c+8,"io_data1_o", false,-1, 63,0);
    tracep->declQuad(c+10,"io_data2_o", false,-1, 63,0);
    for (int i = 0; i < 32; ++i) {
        tracep->declQuad(c+40+i*2,"rf", true,(i+0), 63,0);
    }
    tracep->declBit(c+114,"rf_io_data1_o_MPORT_en", false,-1);
    tracep->declBus(c+6,"rf_io_data1_o_MPORT_addr", false,-1, 4,0);
    tracep->declQuad(c+8,"rf_io_data1_o_MPORT_data", false,-1, 63,0);
    tracep->declBit(c+114,"rf_io_data2_o_MPORT_en", false,-1);
    tracep->declBus(c+7,"rf_io_data2_o_MPORT_addr", false,-1, 4,0);
    tracep->declQuad(c+10,"rf_io_data2_o_MPORT_data", false,-1, 63,0);
    tracep->declQuad(c+115,"rf_MPORT_data", false,-1, 63,0);
    tracep->declBus(c+117,"rf_MPORT_addr", false,-1, 4,0);
    tracep->declBit(c+114,"rf_MPORT_mask", false,-1);
    tracep->declBit(c+114,"rf_MPORT_en", false,-1);
    tracep->declQuad(c+118,"rf_MPORT_1_data", false,-1, 63,0);
    tracep->declBus(c+120,"rf_MPORT_1_addr", false,-1, 4,0);
    tracep->declBit(c+114,"rf_MPORT_1_mask", false,-1);
    tracep->declBit(c+114,"rf_MPORT_1_en", false,-1);
    tracep->declQuad(c+4,"rf_MPORT_2_data", false,-1, 63,0);
    tracep->declBus(c+117,"rf_MPORT_2_addr", false,-1, 4,0);
    tracep->declBit(c+114,"rf_MPORT_2_mask", false,-1);
    tracep->declBit(c+121,"rf_MPORT_2_en", false,-1);
    tracep->popNamePrefix(1);
    tracep->pushNamePrefix("WB ");
    tracep->declQuad(c+4,"io_wb_wdata_i", false,-1, 63,0);
    tracep->declQuad(c+4,"io_wb_wdata_o", false,-1, 63,0);
    tracep->popNamePrefix(2);
}

VL_ATTR_COLD void VTop___024root__trace_init_top(VTop___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root__trace_init_top\n"); );
    // Body
    VTop___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void VTop___024root__trace_full_top_0(void* voidSelf, VerilatedVcd* tracep);
void VTop___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd* tracep);
void VTop___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void VTop___024root__trace_register(VTop___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root__trace_register\n"); );
    // Body
    tracep->addFullCb(&VTop___024root__trace_full_top_0, vlSelf);
    tracep->addChgCb(&VTop___024root__trace_chg_top_0, vlSelf);
    tracep->addCleanupCb(&VTop___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void VTop___024root__trace_full_sub_0(VTop___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void VTop___024root__trace_full_top_0(void* voidSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root__trace_full_top_0\n"); );
    // Init
    VTop___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VTop___024root*>(voidSelf);
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VTop___024root__trace_full_sub_0((&vlSymsp->TOP), tracep);
}

VL_ATTR_COLD void VTop___024root__trace_full_sub_0(VTop___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTop___024root__trace_full_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = tracep->oldp(vlSymsp->__Vm_baseCode);
    // Body
    tracep->fullIData(oldp+1,(vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_data),32);
    tracep->fullQData(oldp+2,(vlSelf->Top__DOT__IF__DOT__pc),64);
    tracep->fullQData(oldp+4,(vlSelf->Top__DOT__MEM_WB__DOT__wdata),64);
    tracep->fullCData(oldp+6,((0x1fU & (IData)((vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                >> 0xfU)))),5);
    tracep->fullCData(oldp+7,((0x1fU & (IData)((vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                >> 0x14U)))),5);
    tracep->fullQData(oldp+8,(vlSelf->Top__DOT__REGFILE__DOT__rf
                              [(0x1fU & (IData)((vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                 >> 0xfU)))]),64);
    tracep->fullQData(oldp+10,(vlSelf->Top__DOT__REGFILE__DOT__rf
                               [(0x1fU & (IData)((vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                  >> 0x14U)))]),64);
    tracep->fullQData(oldp+12,((QData)((IData)(vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_data))),64);
    tracep->fullQData(oldp+14,(vlSelf->Top__DOT__IF_ID__DOT__inst),64);
    tracep->fullIData(oldp+16,((IData)(vlSelf->Top__DOT__IF_ID__DOT__inst)),32);
    tracep->fullQData(oldp+17,(((0x33U == (0x7fU & (IData)(vlSelf->Top__DOT__IF_ID__DOT__inst)))
                                 ? ((0U == (0x7fU & (IData)(
                                                            (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                             >> 0x19U))))
                                     ? ((0U == (7U 
                                                & (IData)(
                                                          (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                           >> 0xcU))))
                                         ? vlSelf->Top__DOT__REGFILE__DOT__rf
                                        [(0x1fU & (IData)(
                                                          (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                           >> 0xfU)))]
                                         : 0ULL) : 0ULL)
                                 : 0ULL)),64);
    tracep->fullQData(oldp+19,(((0x33U == (0x7fU & (IData)(vlSelf->Top__DOT__IF_ID__DOT__inst)))
                                 ? ((0U == (0x7fU & (IData)(
                                                            (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                             >> 0x19U))))
                                     ? ((0U == (7U 
                                                & (IData)(
                                                          (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                           >> 0xcU))))
                                         ? vlSelf->Top__DOT__REGFILE__DOT__rf
                                        [(0x1fU & (IData)(
                                                          (vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                           >> 0x14U)))]
                                         : 0ULL) : 0ULL)
                                 : 0ULL)),64);
    tracep->fullCData(oldp+21,((0x7fU & (IData)(vlSelf->Top__DOT__IF_ID__DOT__inst))),7);
    tracep->fullCData(oldp+22,(((0x33U == (0x7fU & (IData)(vlSelf->Top__DOT__IF_ID__DOT__inst))) 
                                & (IData)((0ULL == 
                                           (0xfe007000ULL 
                                            & vlSelf->Top__DOT__IF_ID__DOT__inst))))),4);
    tracep->fullCData(oldp+23,(vlSelf->Top__DOT__ID_EX__DOT__opcode),7);
    tracep->fullQData(oldp+24,(vlSelf->Top__DOT__ID_EX__DOT__oprand1),64);
    tracep->fullQData(oldp+26,(vlSelf->Top__DOT__ID_EX__DOT__oprand2),64);
    tracep->fullCData(oldp+28,(vlSelf->Top__DOT__ID_EX__DOT__aluop),4);
    tracep->fullQData(oldp+29,(((0x33U == (IData)(vlSelf->Top__DOT__ID_EX__DOT__opcode))
                                 ? ((0U == (IData)(vlSelf->Top__DOT__ID_EX__DOT__aluop))
                                     ? 0ULL : ((1U 
                                                == (IData)(vlSelf->Top__DOT__ID_EX__DOT__aluop))
                                                ? (vlSelf->Top__DOT__ID_EX__DOT__oprand1 
                                                   + vlSelf->Top__DOT__ID_EX__DOT__oprand2)
                                                : 0ULL))
                                 : 0ULL)),64);
    tracep->fullQData(oldp+31,(vlSelf->Top__DOT__EX_MEM__DOT__wdata),64);
    tracep->fullQData(oldp+33,(((0U == (IData)(vlSelf->Top__DOT__ID_EX__DOT__aluop))
                                 ? 0ULL : ((1U == (IData)(vlSelf->Top__DOT__ID_EX__DOT__aluop))
                                            ? (vlSelf->Top__DOT__ID_EX__DOT__oprand1 
                                               + vlSelf->Top__DOT__ID_EX__DOT__oprand2)
                                            : 0ULL))),64);
    tracep->fullCData(oldp+35,((7U & (IData)((vlSelf->Top__DOT__IF_ID__DOT__inst 
                                              >> 0xcU)))),3);
    tracep->fullCData(oldp+36,((0x7fU & (IData)((vlSelf->Top__DOT__IF_ID__DOT__inst 
                                                 >> 0x19U)))),7);
    tracep->fullBit(oldp+37,((IData)((0x33ULL == (0xfe00707fULL 
                                                  & vlSelf->Top__DOT__IF_ID__DOT__inst)))));
    tracep->fullBit(oldp+38,(vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_en_pipe_0));
    tracep->fullSData(oldp+39,(vlSelf->Top__DOT__INST_ROM__DOT__mem_io_inst_o_MPORT_addr_pipe_0),13);
    tracep->fullQData(oldp+40,(vlSelf->Top__DOT__REGFILE__DOT__rf[0]),64);
    tracep->fullQData(oldp+42,(vlSelf->Top__DOT__REGFILE__DOT__rf[1]),64);
    tracep->fullQData(oldp+44,(vlSelf->Top__DOT__REGFILE__DOT__rf[2]),64);
    tracep->fullQData(oldp+46,(vlSelf->Top__DOT__REGFILE__DOT__rf[3]),64);
    tracep->fullQData(oldp+48,(vlSelf->Top__DOT__REGFILE__DOT__rf[4]),64);
    tracep->fullQData(oldp+50,(vlSelf->Top__DOT__REGFILE__DOT__rf[5]),64);
    tracep->fullQData(oldp+52,(vlSelf->Top__DOT__REGFILE__DOT__rf[6]),64);
    tracep->fullQData(oldp+54,(vlSelf->Top__DOT__REGFILE__DOT__rf[7]),64);
    tracep->fullQData(oldp+56,(vlSelf->Top__DOT__REGFILE__DOT__rf[8]),64);
    tracep->fullQData(oldp+58,(vlSelf->Top__DOT__REGFILE__DOT__rf[9]),64);
    tracep->fullQData(oldp+60,(vlSelf->Top__DOT__REGFILE__DOT__rf[10]),64);
    tracep->fullQData(oldp+62,(vlSelf->Top__DOT__REGFILE__DOT__rf[11]),64);
    tracep->fullQData(oldp+64,(vlSelf->Top__DOT__REGFILE__DOT__rf[12]),64);
    tracep->fullQData(oldp+66,(vlSelf->Top__DOT__REGFILE__DOT__rf[13]),64);
    tracep->fullQData(oldp+68,(vlSelf->Top__DOT__REGFILE__DOT__rf[14]),64);
    tracep->fullQData(oldp+70,(vlSelf->Top__DOT__REGFILE__DOT__rf[15]),64);
    tracep->fullQData(oldp+72,(vlSelf->Top__DOT__REGFILE__DOT__rf[16]),64);
    tracep->fullQData(oldp+74,(vlSelf->Top__DOT__REGFILE__DOT__rf[17]),64);
    tracep->fullQData(oldp+76,(vlSelf->Top__DOT__REGFILE__DOT__rf[18]),64);
    tracep->fullQData(oldp+78,(vlSelf->Top__DOT__REGFILE__DOT__rf[19]),64);
    tracep->fullQData(oldp+80,(vlSelf->Top__DOT__REGFILE__DOT__rf[20]),64);
    tracep->fullQData(oldp+82,(vlSelf->Top__DOT__REGFILE__DOT__rf[21]),64);
    tracep->fullQData(oldp+84,(vlSelf->Top__DOT__REGFILE__DOT__rf[22]),64);
    tracep->fullQData(oldp+86,(vlSelf->Top__DOT__REGFILE__DOT__rf[23]),64);
    tracep->fullQData(oldp+88,(vlSelf->Top__DOT__REGFILE__DOT__rf[24]),64);
    tracep->fullQData(oldp+90,(vlSelf->Top__DOT__REGFILE__DOT__rf[25]),64);
    tracep->fullQData(oldp+92,(vlSelf->Top__DOT__REGFILE__DOT__rf[26]),64);
    tracep->fullQData(oldp+94,(vlSelf->Top__DOT__REGFILE__DOT__rf[27]),64);
    tracep->fullQData(oldp+96,(vlSelf->Top__DOT__REGFILE__DOT__rf[28]),64);
    tracep->fullQData(oldp+98,(vlSelf->Top__DOT__REGFILE__DOT__rf[29]),64);
    tracep->fullQData(oldp+100,(vlSelf->Top__DOT__REGFILE__DOT__rf[30]),64);
    tracep->fullQData(oldp+102,(vlSelf->Top__DOT__REGFILE__DOT__rf[31]),64);
    tracep->fullBit(oldp+104,(vlSelf->clock));
    tracep->fullBit(oldp+105,(vlSelf->reset));
    tracep->fullQData(oldp+106,(vlSelf->io_o1),64);
    tracep->fullIData(oldp+108,(vlSelf->io_o2),32);
    tracep->fullQData(oldp+109,(vlSelf->io_o3),64);
    tracep->fullQData(oldp+111,(vlSelf->io_o4),64);
    tracep->fullIData(oldp+113,(vlSelf->Top__DOT__INST_ROM__DOT__initvar),32);
    tracep->fullBit(oldp+114,(1U));
    tracep->fullQData(oldp+115,(0ULL),64);
    tracep->fullCData(oldp+117,(0U),5);
    tracep->fullQData(oldp+118,(0x1bf52ULL),64);
    tracep->fullCData(oldp+120,(1U),5);
    tracep->fullBit(oldp+121,(0U));
}
