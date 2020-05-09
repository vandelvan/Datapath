module UC(
	input [5:0]opcode,
	output reg regDst,//a MUX1
	output reg jump,//a MUX4
	output reg branch,//a CAND
	output reg memRead,//a dataMemory
	output reg memtoReg,//a MUX3
	output reg [1:0]aluOp,//a aluControl
	output reg memWrite,//a dataMemory
	output reg aluSrc,// a MUX2
	output reg regWrite//a registers enable
);

always @*
begin
	if(opcode == 6'b000000)//cualquier tipo R
		begin
			regDst = 1'b1;
			aluSrc = 1'b0;
			jump=1'b0;
			memtoReg = 1'b0;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp[1] = 1'b1;
			aluOp[0] = 1'b0;
		end
	else
	if(opcode == 6'b100011)//instruccion lw
		begin
			regDst = 1'b0;
			aluSrc = 1'b1;
			jump=1'b0;
			memtoReg = 1'b1;
			regWrite = 1'b1;
			memRead = 1'b1;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp[1] = 1'b0;
			aluOp[0] = 1'b0;
		end
	else
	if(opcode == 6'b101011)//instruccion sw
		begin
			regDst = 1'bx;
			aluSrc = 1'b1;
			jump=1'b0;
			memtoReg = 1'bx;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b1;
			branch = 1'b0;
			aluOp[1] = 1'b0;
			aluOp[0] = 1'b0;
		end
	else
	if(opcode == 6'b000100)//instruccion beq
		begin
			regDst = 1'bx;
			aluSrc = 1'b0;
			jump=1'b0;
			memtoReg = 1'bx;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b1;
			aluOp[1] = 1'b0;
			aluOp[0] = 1'b1;
		end
	else
	if(opcode == 6'b000010)//instruccion jump
		begin
			regDst = 1'bx;
			aluSrc = 1'bx;
			jump=1'b1;
			memtoReg = 1'bx;
			regWrite = 1'bx;
			memRead = 1'bx;
			memWrite = 1'bx;
			branch = 1'bx;
			aluOp[1] = 1'bx;
			aluOp[0] = 1'bx;
		end
end

endmodule