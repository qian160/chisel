// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VDiv.h"
#include "VDiv__Syms.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

VDiv::VDiv(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new VDiv__Syms(_vcontextp__, _vcname__, this)}
    , clock{vlSymsp->TOP.clock}
    , reset{vlSymsp->TOP.reset}
    , io_start{vlSymsp->TOP.io_start}
    , io_finish{vlSymsp->TOP.io_finish}
    , io_a{vlSymsp->TOP.io_a}
    , io_b{vlSymsp->TOP.io_b}
    , io_rem{vlSymsp->TOP.io_rem}
    , io_quo{vlSymsp->TOP.io_quo}
    , rootp{&(vlSymsp->TOP)}
{
}

VDiv::VDiv(const char* _vcname__)
    : VDiv(nullptr, _vcname__)
{
}

//============================================================
// Destructor

VDiv::~VDiv() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void VDiv___024root___eval_initial(VDiv___024root* vlSelf);
void VDiv___024root___eval_settle(VDiv___024root* vlSelf);
void VDiv___024root___eval(VDiv___024root* vlSelf);
#ifdef VL_DEBUG
void VDiv___024root___eval_debug_assertions(VDiv___024root* vlSelf);
#endif  // VL_DEBUG
void VDiv___024root___final(VDiv___024root* vlSelf);

static void _eval_initial_loop(VDiv__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    VDiv___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        VDiv___024root___eval_settle(&(vlSymsp->TOP));
        VDiv___024root___eval(&(vlSymsp->TOP));
    } while (0);
}

void VDiv::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VDiv::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VDiv___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        VDiv___024root___eval(&(vlSymsp->TOP));
    } while (0);
    // Evaluate cleanup
}

//============================================================
// Utilities

VerilatedContext* VDiv::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* VDiv::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

VL_ATTR_COLD void VDiv::final() {
    VDiv___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Trace configuration

void VDiv___024root__trace_init_top(VDiv___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    VDiv___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VDiv___024root*>(voidSelf);
    VDiv__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->scopeEscape(' ');
    tracep->pushNamePrefix(std::string{vlSymsp->name()} + ' ');
    VDiv___024root__trace_init_top(vlSelf, tracep);
    tracep->popNamePrefix();
    tracep->scopeEscape('.');
}

VL_ATTR_COLD void VDiv___024root__trace_register(VDiv___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void VDiv::trace(VerilatedVcdC* tfp, int levels, int options) {
    if (false && levels && options) {}  // Prevent unused
    tfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    VDiv___024root__trace_register(&(vlSymsp->TOP), tfp->spTrace());
}
