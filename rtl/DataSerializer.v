module DataSerializer (
    input wire clk,
    input wire reset,
    input wire [3:0] parallel_in,
    input wire load,
    output reg serial_out
);
    reg [3:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 4'b0000;
            serial_out <= 1'b0;
        end else if (load) begin
            shift_reg <= parallel_in;
        end else begin
            serial_out <= shift_reg[0];
            shift_reg <= {1'b0, shift_reg[3:1]}; 
        end
    end
endmodule
