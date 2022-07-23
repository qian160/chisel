// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vdpi_test.h for the primary calling header

#ifndef VERILATED_VDPI_TEST___024ROOT_H_
#define VERILATED_VDPI_TEST___024ROOT_H_  // guard

#include "verilated.h"

class Vdpi_test__Syms;
class Vdpi_test___024unit;

VL_MODULE(Vdpi_test___024root) {
  public:
    // CELLS
    Vdpi_test___024unit* __PVT____024unit;

    // INTERNAL VARIABLES
    Vdpi_test__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vdpi_test___024root(Vdpi_test__Syms* symsp, const char* name);
    ~Vdpi_test___024root();
    VL_UNCOPYABLE(Vdpi_test___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
