`timescale 1ns/1ps

module dff_scan_tb;

reg clk, rst, d, scan_en, scan_in;
wire q;

dff_scan UUT (
    .clk(clk),
    .rst(rst),
    .d(d),
    .scan_en(scan_en),
    .scan_in(scan_in),
    .q(q)
);

initial begin
    $dumpfile("dff_scan.vcd");
    $dumpvars(0, dff_scan_tb);

    clk = 0; rst = 1; d = 0; scan_en = 0; scan_in = 0;

    #5 rst = 0;
    #5 d = 1;
    #10 d = 0;
    #10 scan_en = 1; scan_in = 1;
    #10 scan_en = 0;
    #10 $finish;
end

always #5 clk = ~clk;

endmodule
