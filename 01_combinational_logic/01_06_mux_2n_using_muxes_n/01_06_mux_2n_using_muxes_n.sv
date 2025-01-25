//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux_2_1
(
  input  [3:0] d0, d1,
  input        sel,
  output [3:0] y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module mux_4_1
(
  input  [3:0] d0, d1, d2, d3,
  input  [1:0] sel,
  output [3:0] y
);

  logic [3:0] wire_mux [0:1];

  mux_2_1 mux_2_1_inst_0
  (
    .d0(d0),
    .d1(d1),
    .sel(sel[0]),
    .y(wire_mux[0])
  );
  
  mux_2_1 mux_2_1_inst_1
  (
    .d0(d2),
    .d1(d3),
    .sel(sel[0]),
    .y(wire_mux[1])
  );

  mux_2_1 mux_2_1_inst_2
  (
    .d0(wire_mux[0]),
    .d1(wire_mux[1]),
    .sel(sel[1]),
    .y(y)
  );

  // Task:
  // Implement mux_4_1 using three instances of mux_2_1

endmodule
