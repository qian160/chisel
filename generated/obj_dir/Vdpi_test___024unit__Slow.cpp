// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vdpi_test.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vdpi_test__Syms.h"
#include "Vdpi_test___024unit.h"

void Vdpi_test___024unit___ctor_var_reset(Vdpi_test___024unit* vlSelf);

Vdpi_test___024unit::Vdpi_test___024unit(Vdpi_test__Syms* symsp, const char* name)
    : VerilatedModule{name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vdpi_test___024unit___ctor_var_reset(this);
}

void Vdpi_test___024unit::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vdpi_test___024unit::~Vdpi_test___024unit() {
}
