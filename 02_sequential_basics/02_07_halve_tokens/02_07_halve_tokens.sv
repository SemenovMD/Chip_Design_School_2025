//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module halve_tokens
(
    input  clk,
    input  rst,
    input  a,
    output b
);
    // Task:
    // Implement a serial module that reduces amount of incoming '1' tokens by half.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.
    //
    // Example:
    // a -> 110_011_101_000_1111
    // b -> 010_001_001_000_0101

    logic flag;

    always_ff @(posedge clk) begin
        if (rst) begin
            flag <= 'd0;
        end else begin
            if (a) begin
                if (!flag) begin
                    flag <= 'd1;
                end else begin
                    flag <= 'd0;
                end
            end else begin
                if (flag) begin
                    flag <= 'd1;
                end else begin
                    flag <= 'd0;
                end
            end
        end
    end

    assign b = (a && flag) ? 1 : 0;

endmodule
