module ADDER(
	input [31:0]op1,//viene del sumador+4
	input [31:0]op2,//viene del shift left
	output reg [31:0]aluResult
);

always @*
begin
	aluResult = op1+op2;
end

endmodule
