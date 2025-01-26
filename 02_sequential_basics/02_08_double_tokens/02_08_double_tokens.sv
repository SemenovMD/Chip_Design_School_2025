//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module double_tokens
(
    input        clk,
    input        rst,
    input        a,
    output logic b,
    output logic overflow
);
    // Task:
    // Implement a serial module that doubles each incoming token '1' two times.
    // The module should handle doubling for at least 200 tokens '1' arriving in a row.
    //
    // In case module detects more than 200 sequential tokens '1', it should assert
    // an overflow error. The overflow error should be sticky. Once the error is on,
    // the only way to clear it is by using the "rst" reset signal.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.
    //
    // Example:
    // a -> 10010011000110100001100100
    // b -> 11011011110111111001111110

    logic [7:0] count;

    typedef enum logic
    {  
        S0,
        S1
    } state_type;

    state_type state;

    always_ff @(posedge clk) begin
        if (rst) begin
            count <= 'd0;
            state <= S0;
        end else begin
            case (state)
                S0:
                    begin
                        if (a) begin
                            case (count)
                                'd0:
                                    begin
                                        count <= count + 1;
                                        state <= S0;
                                    end
                                'd200:
                                    begin
                                        state <= S1;
                                    end
                                default:
                                    begin
                                        count <= count + 1;
                                        state <= S0;
                                    end
                            endcase
                        end else begin
                            if (|count) begin
                                count <= count - 1;
                                state <= S0;
                            end else begin
                                count <= 'd0;
                                state <= S0;
                            end 
                        end
                    end
                S1:
                    begin
                        state <= S1;
                    end
            endcase
        end
    end

    assign b = (a || |count) ? 1 : 0;
    assign overflow = (state) ? 1 : 0;

endmodule
