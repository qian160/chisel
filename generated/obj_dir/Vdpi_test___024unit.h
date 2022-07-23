// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vdpi_test.h for the primary calling header

#ifndef VERILATED_VDPI_TEST___024UNIT_H_
#define VERILATED_VDPI_TEST___024UNIT_H_  // guard

#include "verilated.h"

class Vdpi_test__Syms;
VL_MODULE(Vdpi_test___024unit) {
  public:

    // INTERNAL VARIABLES
    Vdpi_test__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vdpi_test___024unit(Vdpi_test__Syms* symsp, const char* name);
    ~Vdpi_test___024unit();
    VL_UNCOPYABLE(Vdpi_test___024unit);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
