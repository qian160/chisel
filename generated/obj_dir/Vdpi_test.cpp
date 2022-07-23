// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vdpi_test.h"
#include "Vdpi_test__Syms.h"
#include "verilated_dpi.h"

//============================================================
// Constructors

Vdpi_test::Vdpi_test(VerilatedContext* _vcontextp__, const char* _vcname__)
    : vlSymsp{new Vdpi_test__Syms(_vcontextp__, _vcname__, this)}
    , __PVT____024unit{vlSymsp->TOP.__PVT____024unit}
    , rootp{&(vlSymsp->TOP)}
{
}

Vdpi_test::Vdpi_test(const char* _vcname__)
    : Vdpi_test(nullptr, _vcname__)
{
}

//============================================================
// Destructor

Vdpi_test::~Vdpi_test() {
    delete vlSymsp;
}

//============================================================
// Evaluation loop

void Vdpi_test___024root___eval_initial(Vdpi_test___024root* vlSelf);
void Vdpi_test___024root___eval_settle(Vdpi_test___024root* vlSelf);
void Vdpi_test___024root___eval(Vdpi_test___024root* vlSelf);
#ifdef VL_DEBUG
void Vdpi_test___024root___eval_debug_assertions(Vdpi_test___024root* vlSelf);
#endif  // VL_DEBUG
void Vdpi_test___024root___final(Vdpi_test___024root* vlSelf);

static void _eval_initial_loop(Vdpi_test__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    Vdpi_test___024root___eval_initial(&(vlSymsp->TOP));
    // Evaluate till stable
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial loop\n"););
        Vdpi_test___024root___eval_settle(&(vlSymsp->TOP));
        Vdpi_test___024root___eval(&(vlSymsp->TOP));
    } while (0);
}

void Vdpi_test::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vdpi_test::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vdpi_test___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        Vdpi_test___024root___eval(&(vlSymsp->TOP));
    } while (0);
    // Evaluate cleanup
}

//============================================================
// Utilities

VerilatedContext* Vdpi_test::contextp() const {
    return vlSymsp->_vm_contextp__;
}

const char* Vdpi_test::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

VL_ATTR_COLD void Vdpi_test::final() {
    Vdpi_test___024root___final(&(vlSymsp->TOP));
}
