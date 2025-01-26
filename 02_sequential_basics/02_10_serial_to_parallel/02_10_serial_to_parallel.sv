//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module serial_to_parallel
# (
    parameter width = 8
)
(
    input                      clk,
    input                      rst,

    input                      serial_valid,
    input                      serial_data,

    output logic               parallel_valid,
    output logic [width - 1:0] parallel_data
);
    // Task:
    // Implement a module that converts serial data to the parallel multibit value.
    //
    // The module should accept one-bit values with valid interface in a serial manner.
    // After accumulating 'width' bits, the module should assert the parallel_valid
    // output and set the data.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.

    logic [$clog2(width) - 1:0] count;

    always_ff @(posedge clk) begin
        if (rst) begin
            parallel_data       <= 'd0;
            parallel_valid      <= 'd0;
            count               <= 'd0;
        end else begin
            if (serial_valid) begin
                if (count != width - 1) begin
                    count                       <= count + 1;
                    parallel_data[count]        <= serial_data;
                end else begin
                    count                       <= 'd0;
                    parallel_data[width - 1]    <= serial_data;
                end
            end

            if (serial_valid && count == width - 1) begin
                parallel_valid <= 'd1;
            end else begin
                parallel_valid <= 'd0;
            end
        end
    end

endmodule
