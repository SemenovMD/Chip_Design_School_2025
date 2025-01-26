//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module halve_tokens
(
    input  logic clk,
    input  logic rst,
    input  logic a,
    output logic b
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

    typedef enum logic
    {  
        S0,
        S1
    } state_type;

    state_type state;

    always_ff @(posedge clk) begin
        if (rst) begin
            state <= S0;
        end else begin
            case (state)
                S0:
                    begin
                        if (!a) begin
                            state <= S0;
                        end else begin
                            state <= S1;
                        end
                    end
                S1:
                    begin
                        if (!a) begin
                            state <= S1;
                        end else begin
                            state <= S0;
                        end
                    end
            endcase
        end
    end

    always_comb begin
        case (state)
            S0: b = 'd0;
            S1: b = a & 'd1;
        endcase
    end

endmodule
