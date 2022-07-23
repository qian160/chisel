// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vdpi_test.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vdpi_test__Syms.h"
#include "Vdpi_test___024root.h"

void Vdpi_test___024root___ctor_var_reset(Vdpi_test___024root* vlSelf);

Vdpi_test___024root::Vdpi_test___024root(Vdpi_test__Syms* symsp, const char* name)
    : VerilatedModule{name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vdpi_test___024root___ctor_var_reset(this);
}

void Vdpi_test___024root::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vdpi_test___024root::~Vdpi_test___024root() {
}
