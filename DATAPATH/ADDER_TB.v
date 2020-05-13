`timescale 1ns/1ns
module ADDER_TB();
reg [31:0]op1;
reg [31:0]op2;
wire [31:0]aluResult;

ADDER DUV(.op1(op1),.op2(op2),.aluResult(aluResult));

initial
begin
	op1=32'd10;
	op2=32'd200;
	#10;
	$stop;
end

endmodule
