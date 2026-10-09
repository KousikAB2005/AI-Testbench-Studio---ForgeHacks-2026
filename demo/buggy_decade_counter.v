// Decade counter used for the "AI finds a real RTL bug" demo.
// INTENT: count 0,1,2,...,9 and then wrap back to 0 (BCD digit).
// DELIBERATE BUG: it wraps at 10 instead of 9, so it counts 0..10.
module decade_counter (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       en,
    output reg  [3:0] count
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= 4'd0;
        else if (en)
            count <= (count == 4'd10) ? 4'd0 : count + 4'd1;  // BUG: should compare with 4'd9
    end
endmodule
