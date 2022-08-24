// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VDivTest.h for the primary calling header

#include "verilated.h"

#include "VDivTest__Syms.h"
#include "VDivTest___024root.h"

void VDivTest___024root___ctor_var_reset(VDivTest___024root* vlSelf);

VDivTest___024root::VDivTest___024root(VDivTest__Syms* symsp, const char* name)
    : VerilatedModule{name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    VDivTest___024root___ctor_var_reset(this);
}

void VDivTest___024root::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

VDivTest___024root::~VDivTest___024root() {
}
