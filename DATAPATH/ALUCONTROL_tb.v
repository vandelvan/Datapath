`timescale 1ns/1ns
module ALUCONTROL_tb();
reg [5:0] opf;//func
reg [1:0] aluop;
wire [3:0] ops;//selector de la alu

ALUCONTROL DUV(.opf(opf),.aluop(aluop),.ops(ops));

initial
begin
	aluop = 2'b10;
	opf = 6'b100100;
	#10
	
	opf = 6'b100101;
	#10
	
	opf = 6'b100000;
	#10
	
	opf = 6'b100111;
	#10
	
	opf = 6'b000010;
	#10
	
	opf = 6'b100010;
	#10
	
	opf = 6'b011010;
	#10
	
	opf = 6'b101010;
	#10
	
	opf = 6'b000000;//para que caiga en default
	#10
	
	aluop = 2'b00;
	#10;
	
	aluop = 2'b01;
	#10;
	$stop;
end

endmodule