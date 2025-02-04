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

module not_gate_using_mux
(
    input  i,
    output o
);

  mux mux_inst
  (
    .d0(1'd1), 
    .d1(1'd0),
    .sel(i),
    .y(o)
  );

  // Task:
  // Implement not gate using instance(s) of mux,
  // constants 0 and 1, and wire connections

endmodule
