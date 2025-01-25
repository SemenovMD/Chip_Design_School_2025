//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux
(
  input  d0, d1,
  input  sel,
  output y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module and_gate_using_mux
(
    input  a,
    input  b,
    output o
);
  
  logic wire_mux;

  mux mux_inst_0
  (
    .d0(a), 
    .d1(1'd0),
    .sel(1'd0),
    .y(wire_mux)
  );

  mux mux_inst_1
  (
    .d0(1'd0), 
    .d1(wire_mux),
    .sel(b),
    .y(o)
  );

  // Task:
  // Implement and gate using instance(s) of mux,
  // constants 0 and 1, and wire connections

endmodule
