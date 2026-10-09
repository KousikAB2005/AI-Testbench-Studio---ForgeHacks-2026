// 8-bit ALU used for the "all checks pass" demo.
// op: 000 add, 001 sub (carry = borrow), 010 and, 011 or, 100 xor
module alu8 (
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire [2:0] op,
    output reg  [7:0] result,
    output reg        carry,
    output wire       zero
);
    always @(*) begin
        carry = 1'b0;
        case (op)
            3'b000: {carry, result} = a + b;
            3'b001: {carry, result} = a - b;
            3'b010: result = a & b;
            3'b011: result = a | b;
            3'b100: result = a ^ b;
            default: result = 8'd0;
        endcase
    end
    assign zero = (result == 8'd0);
endmodule
