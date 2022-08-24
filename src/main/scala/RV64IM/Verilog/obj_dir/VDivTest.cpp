// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VDivTest.h"
#include "VDivTest__Syms.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

VDivTest::VDivTest(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new VDivTest__Syms(_vcontextp__, _vcname__, this)}
    , clock{vlSymsp->TOP.clock}
    , reset{vlSymsp->TOP.reset}
    , io_a{vlSymsp->TOP.io_a}
    , io_b{vlSymsp->TOP.io_b}
    , io_start{vlSymsp->TOP.io_start}
    , io_rem{vlSymsp->TOP.io_rem}
    , io_quo{vlSymsp->TOP.io_quo}
    , io_finish{vlSymsp->TOP.io_finish}
    , io_state{vlSymsp->TOP.io_state}
    , io_cnt{vlSymsp->TOP.io_cnt}
    , io_B{vlSymsp->TOP.io_B}
    , io_qNeg2{vlSymsp->TOP.io_qNeg2}
    , io_qNeg1{vlSymsp->TOP.io_qNeg1}
    , io_q0{vlSymsp->TOP.io_q0}
    , io_q1{vlSymsp->TOP.io_q1}
    , io_q2{vlSymsp->TOP.io_q2}
    , io_whichTable{vlSymsp->TOP.io_whichTable}
    , io_pq{vlSymsp->TOP.io_pq}
    , io_nq{vlSymsp->TOP.io_nq}
    , io_p{vlSymsp->TOP.io_p}
    , io_negB{vlSymsp->TOP.io_negB}
    , io_PA{vlSymsp->TOP.io_PA}
    , rootp{&(vlSymsp->TOP)}
{
}

VDivTest::VDivTest(const char* _vcname__)
    : VDivTest(nullptr, _vcname__)
{
}

//============================================================
// Destructor

VDivTest::~VDivTest() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void VDivTest___024root___eval_initial(VDivTest___024root* vlSelf);
void VDivTest___024root___eval_settle(VDivTest___024root* vlSelf);
void VDivTest___024root___eval(VDivTest___024root* vlSelf);
#ifdef VL_DEBUG
void VDivTest___024root___eval_debug_assertions(VDivTest___024root* vlSelf);
#endif  // VL_DEBUG
void VDivTest___024root___final(VDivTest___024root* vlSelf);

static void _eval_initial_loop(VDivTest__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    VDivTest___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        VDivTest___024root___eval_settle(&(vlSymsp->TOP));
        VDivTest___024root___eval(&(vlSymsp->TOP));
    } while (0);
}

void VDivTest::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VDivTest::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VDivTest___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        VDivTest___024root___eval(&(vlSymsp->TOP));
    } while (0);
    // Evaluate cleanup
}

//============================================================
// Utilities

VerilatedContext* VDivTest::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* VDivTest::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

VL_ATTR_COLD void VDivTest::final() {
    VDivTest___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Trace configuration

void VDivTest___024root__trace_init_top(VDivTest___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    VDivTest___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VDivTest___024root*>(voidSelf);
    VDivTest__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->scopeEscape(' ');
    tracep->pushNamePrefix(std::string{vlSymsp->name()} + ' ');
    VDivTest___024root__trace_init_top(vlSelf, tracep);
    tracep->popNamePrefix();
    tracep->scopeEscape('.');
}

VL_ATTR_COLD void VDivTest___024root__trace_register(VDivTest___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void VDivTest::trace(VerilatedVcdC* tfp, int levels, int options) {
    if (false && levels && options) {}  // Prevent unused
    tfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    VDivTest___024root__trace_register(&(vlSymsp->TOP), tfp->spTrace());
}
