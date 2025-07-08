module dff_scan (
    input clk,
    input rst,
    input d,
    input scan_en,
    input scan_in,
    output reg q
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 0;
    else if (scan_en)
        q <= scan_in;
    else
        q <= d;
end

endmodule
