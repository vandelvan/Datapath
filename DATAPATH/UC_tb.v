`timescale 1ns/1ns
module UC_tb();
reg [5:0]opcode;
wire regDst;
wire branch;
wire memRead;
wire memtoReg;
wire [1:0]aluOp;
wire memWrite;
wire aluSrc;
wire regWrite;

UC DUV(.opcode(opcode),.regDst(regDst),.branch(branch),
	.memRead(memRead),.memtoReg(memtoReg),.aluOp(aluOp),
	.memWrite(memWrite),.aluSrc(aluSrc),.regWrite(regWrite));

initial
begin
	opcode = 6'd0;
	#10;
	opcode = 6'b100011;
	#10;
	opcode = 6'b101011;
	#10;
	opcode = 6'b000100;
	#10;
	$stop;
end
	
endmodule