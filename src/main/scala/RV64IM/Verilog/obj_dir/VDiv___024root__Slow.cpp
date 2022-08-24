// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VDiv.h for the primary calling header

#include "verilated.h"

#include "VDiv__Syms.h"
#include "VDiv___024root.h"

void VDiv___024root___ctor_var_reset(VDiv___024root* vlSelf);

VDiv___024root::VDiv___024root(VDiv__Syms* symsp, const char* name)
    : VerilatedModule{name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    VDiv___024root___ctor_var_reset(this);
}

void VDiv___024root::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

VDiv___024root::~VDiv___024root() {
}
