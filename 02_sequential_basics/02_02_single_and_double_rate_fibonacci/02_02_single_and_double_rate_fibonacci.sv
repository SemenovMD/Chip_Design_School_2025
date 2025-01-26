//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module fibonacci
(
  input               clk,
  input               rst,
  output logic [15:0] num
);

  logic [15:0] num2;

  always_ff @ (posedge clk)
    if (rst)
      { num, num2 } <= { 16'd1, 16'd1 };
    else
      { num, num2 } <= { num2, num + num2 };

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module fibonacci_2
(
  input               clk,
  input               rst,
  output logic [15:0] num,
  output logic [15:0] num2
);

  // Task:
  // Implement a module that generates two fibonacci numbers per cycle

  logic [15:0] reg_fib [0:1];

  always_ff @(posedge clk) begin
    if (rst) begin
      reg_fib[0] <= 'd1;
      reg_fib[1] <= 'd0;
    end else begin
      reg_fib[0] <= num;
      reg_fib[1] <= num2;
    end
  end

  assign num  = reg_fib[0] + reg_fib[1];
  assign num2 = num + reg_fib[1];

endmodule
