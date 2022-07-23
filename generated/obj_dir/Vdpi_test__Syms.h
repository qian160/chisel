// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VDPI_TEST__SYMS_H_
#define VERILATED_VDPI_TEST__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vdpi_test.h"

// INCLUDE MODULE CLASSES
#include "Vdpi_test___024root.h"
#include "Vdpi_test___024unit.h"

// DPI TYPES for DPI Export callbacks (Internal use)

// SYMS CLASS (contains all model state)
class Vdpi_test__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vdpi_test* const __Vm_modelp;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vdpi_test___024root            TOP;
    Vdpi_test___024unit            TOP____024unit;

    // CONSTRUCTORS
    Vdpi_test__Syms(VerilatedContext* contextp, const char* namep, Vdpi_test* modelp);
    ~Vdpi_test__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
