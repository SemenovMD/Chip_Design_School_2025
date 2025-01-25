//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux_2_1
(
  input        [3:0] d0, d1,
  input              sel,
  output logic [3:0] y
);

  always_comb
    if (sel)
      y = d1;
    else
      y = d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module mux_4_1
(
  input        [3:0] d0, d1, d2, d3,
  input        [1:0] sel,
  output logic [3:0] y
);

  always_comb begin
    if (sel == 'd0) begin
      y = d0;
    end else if (sel == 'd1) begin
      y = d1;
    end else if (sel == 'd2) begin
      y = d2;
    end else begin
      y = d3;
    end
  end

  // Task:
  // Using code for mux_2_1 as an example,
  // write code for 4:1 mux using the "if" statement

endmodule
