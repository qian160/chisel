// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary model header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef VERILATED_VDIVTEST_H_
#define VERILATED_VDIVTEST_H_  // guard

#include "verilated.h"

class VDivTest__Syms;
class VDivTest___024root;
class VerilatedVcdC;

// This class is the main interface to the Verilated model
class VDivTest VL_NOT_FINAL {
  private:
    // Symbol table holding complete model state (owned by this class)
    VDivTest__Syms* const vlSymsp;

  public:

    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(&clock,0,0);
    VL_IN8(&reset,0,0);
    VL_IN8(&io_a,7,0);
    VL_IN8(&io_b,7,0);
    VL_IN8(&io_start,0,0);
    VL_OUT8(&io_rem,7,0);
    VL_OUT8(&io_quo,7,0);
    VL_OUT8(&io_finish,0,0);
    VL_OUT8(&io_state,1,0);
    VL_OUT8(&io_cnt,5,0);
    VL_OUT8(&io_B,7,0);
    VL_OUT8(&io_qNeg2,0,0);
    VL_OUT8(&io_qNeg1,0,0);
    VL_OUT8(&io_q0,0,0);
    VL_OUT8(&io_q1,0,0);
    VL_OUT8(&io_q2,0,0);
    VL_OUT8(&io_whichTable,3,0);
    VL_OUT8(&io_pq,7,0);
    VL_OUT8(&io_nq,7,0);
    VL_OUT16(&io_p,8,0);
    VL_OUT16(&io_negB,8,0);
    VL_OUT(&io_PA,16,0);

    // CELLS
    // Public to allow access to /* verilator public */ items.
    // Otherwise the application code can consider these internals.

    // Root instance pointer to allow access to model internals,
    // including inlined /* verilator public_flat_* */ items.
    VDivTest___024root* const rootp;

    // CONSTRUCTORS
    /// Construct the model; called by application code
    /// If contextp is null, then the model will use the default global context
    /// If name is "", then makes a wrapper with a
    /// single model invisible with respect to DPI scope names.
    explicit VDivTest(VerilatedContext* contextp, const char* name = "TOP");
    explicit VDivTest(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    virtual ~VDivTest();
  private:
    VL_UNCOPYABLE(VDivTest);  ///< Copying not allowed

  public:
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval() { eval_step(); }
    /// Evaluate when calling multiple units/models per time step.
    void eval_step();
    /// Evaluate at end of a timestep for tracing, when using eval_step().
    /// Application must call after all eval() and before time changes.
    void eval_end_step() {}
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    /// Trace signals in the model; called by application code
    void trace(VerilatedVcdC* tfp, int levels, int options = 0);
    /// Return current simulation context for this model.
    /// Used to get to e.g. simulation time via contextp()->time()
    VerilatedContext* contextp() const;
    /// Retrieve name of this model instance (as passed to constructor).
    const char* name() const;
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
