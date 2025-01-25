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

module xor_gate_using_mux
(
    input  a,
    input  b,
    output o
);

  logic [1:0] wire_mux;

  mux mux_inst_0
  (
    .d0(a), 
    .d1(1'd0),
    .sel(1'd0),
    .y(wire_mux[0])
  );

  mux mux_inst_1
  (
    .d0(1'd1), 
    .d1(1'd0),
    .sel(a),
    .y(wire_mux[1])
  );

  mux mux_inst_2
  (
    .d0(wire_mux[0]), 
    .d1(wire_mux[1]),
    .sel(b),
    .y(o)
  );

  // Task:
  // Implement xor gate using instance(s) of mux,
  // constants 0 and 1, and wire connections

endmodule
