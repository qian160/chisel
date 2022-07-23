// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vdpi_test.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vdpi_test__Syms.h"
#include "Vdpi_test___024unit.h"

extern "C" int add(int a, int b);

VL_INLINE_OPT void Vdpi_test___024unit____Vdpiimwrap_add_TOP____024unit(IData/*31:0*/ a, IData/*31:0*/ b, IData/*31:0*/ &add__Vfuncrtn) {
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vdpi_test___024unit____Vdpiimwrap_add_TOP____024unit\n"); );
    // Body
    int a__Vcvt;
    for (size_t a__Vidx = 0; a__Vidx < 1; ++a__Vidx) a__Vcvt = a;
    int b__Vcvt;
    for (size_t b__Vidx = 0; b__Vidx < 1; ++b__Vidx) b__Vcvt = b;
    int add__Vfuncrtn__Vcvt;
    add__Vfuncrtn__Vcvt = add(a__Vcvt, b__Vcvt);
    add__Vfuncrtn = add__Vfuncrtn__Vcvt;
}
