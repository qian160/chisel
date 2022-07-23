// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vdpi_test.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vdpi_test__Syms.h"
#include "Vdpi_test___024root.h"

void Vdpi_test___024unit____Vdpiimwrap_add_TOP____024unit(IData/*31:0*/ a, IData/*31:0*/ b, IData/*31:0*/ &add__Vfuncrtn);

VL_ATTR_COLD void Vdpi_test___024root___initial__TOP__0(Vdpi_test___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vdpi_test__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdpi_test___024root___initial__TOP__0\n"); );
    // Init
    IData/*31:0*/ __Vfunc_add__0__Vfuncout;
    // Body
    VL_WRITEF("hello world\n");
    Vdpi_test___024unit____Vdpiimwrap_add_TOP____024unit(0x72U, 0x202U, __Vfunc_add__0__Vfuncout);
    VL_WRITEF("         114 +         514 = %11d\n\n",
              32,__Vfunc_add__0__Vfuncout);
    VL_FINISH_MT("dpi_test.v", 8, "");
}
