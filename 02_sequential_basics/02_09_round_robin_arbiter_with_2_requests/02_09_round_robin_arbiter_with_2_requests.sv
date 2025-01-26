//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module round_robin_arbiter_with_2_requests
(
    input        clk,
    input        rst,
    input  [1:0] requests,
    output logic [1:0] grants
);

    // Task:
    // Implement a "arbiter" module that accepts up to two requests
    // and grants one of them to operate in a round-robin manner.
    //
    // The module should maintain an internal register
    // to keep track of which requester is next in line for a grant.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.
    //
    // Example:
    // requests -> 01 00 10 11 11 00 11 00 11 11
    // grants   -> 01 00 10 01 10 00 01 00 10 01

    logic [1:0] next_grant;

    always_ff @(posedge clk) begin
        if (rst) begin
            next_grant <= 2'b00;
        end else begin
            case (requests)
                2'b00: next_grant <= 2'b00;
                2'b01: next_grant <= {requests[0], requests[1]};
                2'b10: next_grant <= {requests[0], requests[1]};
                2'b11: next_grant <= {next_grant[0], next_grant[1]};
            endcase
        end
    end

    always_comb begin
        case (requests)
            2'b00, 2'b01, 2'b10: grants = requests;
            2'b11: grants = next_grant;
        endcase
    end

endmodule