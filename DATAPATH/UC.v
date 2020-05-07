module UC(
	input [5:0]opcode,
	output reg regDst,//a MUX1
	output reg branch,//a CAND
	output reg memRead,//a dataMemory
	output reg memtoReg,//a MUX6
	output reg [1:0]aluOp,//a aluControl
	output reg memWrite,//a dataMemory
	output reg aluSrc,// a MUX2
	output reg regWrite//a registers enable
);

always @*
begin
	if(opcode == 6'd0)//cualquier tipo R
		begin
			regDst = 1'b1;
			aluSrc = 1'b0;
			memtoReg = 1'b0;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp[1] = 1'b1;
			aluOp[0] = 1'b0;
		end
	else
	if(opcode == 6'b100011)//intruccion lw
		begin
			regDst = 1'b0;
			aluSrc = 1'b1;
			memtoReg = 1'b1;
			regWrite = 1'b1;
			memRead = 1'b1;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp[1] = 1'b0;
			aluOp[0] = 1'b0;
		end
	else
	if(opcode == 6'b101011)//intruccion sw
		begin
			regDst = 1'bx;
			aluSrc = 1'b1;
			memtoReg = 1'bx;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b1;
			branch = 1'b0;
			aluOp[1] = 1'b0;
			aluOp[0] = 1'b0;
		end
	else
	if(opcode == 6'b000100)//intruccion beq
		begin
			regDst = 1'bx;
			aluSrc = 1'b0;
			memtoReg = 1'bx;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b1;
			aluOp[1] = 1'b0;
			aluOp[0] = 1'b1;
		end
end

endmodule