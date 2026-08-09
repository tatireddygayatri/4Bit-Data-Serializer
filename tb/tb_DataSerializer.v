module test;
    reg clk;
    reg reset;
    reg [3:0] parallel_in;
    reg load;
    wire serial_out;

    // design
    DataSerializer uut (
        .clk(clk), .reset(reset), .parallel_in(parallel_in), .load(load), .serial_out(serial_out)
    );

    always #5 clk = ~clk; // clock pulse

    initial begin
        $dumpfile("dump.vcd"); $dumpvars(1);
        clk = 0; reset = 1; load = 0; parallel_in = 4'b0;
        #10 reset = 0;
        
        // Load data 1011
        #10 parallel_in = 4'b1011; load = 1;
        #10 load = 0; // Start shifting out serialization bits
        
        #50 $finish;
    end
endmodule
