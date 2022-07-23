// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VTop.h"
#include "VTop__Syms.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

VTop::VTop(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new VTop__Syms(_vcontextp__, _vcname__, this)}
    , clock{vlSymsp->TOP.clock}
    , reset{vlSymsp->TOP.reset}
    , io_o2{vlSymsp->TOP.io_o2}
    , io_o1{vlSymsp->TOP.io_o1}
    , io_o3{vlSymsp->TOP.io_o3}
    , io_o4{vlSymsp->TOP.io_o4}
    , rootp{&(vlSymsp->TOP)}
{
}

VTop::VTop(const char* _vcname__)
    : VTop(nullptr, _vcname__)
{
}

//============================================================
// Destructor

VTop::~VTop() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void VTop___024root___eval_initial(VTop___024root* vlSelf);
void VTop___024root___eval_settle(VTop___024root* vlSelf);
void VTop___024root___eval(VTop___024root* vlSelf);
#ifdef VL_DEBUG
void VTop___024root___eval_debug_assertions(VTop___024root* vlSelf);
#endif  // VL_DEBUG
void VTop___024root___final(VTop___024root* vlSelf);

static void _eval_initial_loop(VTop__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    VTop___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        VTop___024root___eval_settle(&(vlSymsp->TOP));
        VTop___024root___eval(&(vlSymsp->TOP));
    } while (0);
}

void VTop::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VTop::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VTop___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    vlSymsp->__Vm_activity = true;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        VTop___024root___eval(&(vlSymsp->TOP));
    } while (0);
    // Evaluate cleanup
}

//============================================================
// Utilities

VerilatedContext* VTop::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* VTop::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

VL_ATTR_COLD void VTop::final() {
    VTop___024root___final(&(vlSymsp->TOP));
}

//============================================================
// Trace configuration

void VTop___024root__trace_init_top(VTop___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    VTop___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VTop___024root*>(voidSelf);
    VTop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->scopeEscape(' ');
    tracep->pushNamePrefix(std::string{vlSymsp->name()} + ' ');
    VTop___024root__trace_init_top(vlSelf, tracep);
    tracep->popNamePrefix();
    tracep->scopeEscape('.');
}

VL_ATTR_COLD void VTop___024root__trace_register(VTop___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void VTop::trace(VerilatedVcdC* tfp, int levels, int options) {
    if (false && levels && options) {}  // Prevent unused
    tfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    VTop___024root__trace_register(&(vlSymsp->TOP), tfp->spTrace());
}
