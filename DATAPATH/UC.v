module UC(
	input [5:0]opcode,
	output reg regDst,//a MUX1
	output reg jump,//a MUX4
	output reg branch,//a CAND
	output reg memRead,//a dataMemory
	output reg memtoReg,//a MUX3
	output reg [3:0]aluOp,//a aluControl
	output reg memWrite,//a dataMemory
	output reg aluSrc,// a MUX2
	output reg regWrite//a registers enable
);

always @*
begin
	case(opcode)
	6'b000000://cualquier tipo R
		begin
			regDst = 1'b1;
			aluSrc = 1'b0;
			jump=1'b0;
			memtoReg = 1'b0;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp = 4'b0010;
		end
	6'b001111://lui
		begin
			regDst = 1'b0;
			aluSrc = 1'b1;
			jump=1'b0;
			memtoReg = 1'b0;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp = 4'b1001;
		end
	6'b011111://bitswap
		begin
			regDst = 1'b1;
			aluSrc = 1'b0;
			jump=1'b0;
			memtoReg = 1'b0;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp = 4'b1111;
		end
	6'b100011://instruccion lw
		begin
			regDst = 1'b0;
			aluSrc = 1'b1;
			jump=1'b0;
			memtoReg = 1'b1;
			regWrite = 1'b1;
			memRead = 1'b1;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp = 4'b0000;
		end

	6'b001000://instruccion addi
		begin
			regDst = 1'b0;
			aluSrc = 1'b1;
			jump=1'b0;
			memtoReg = 1'b0;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp = 4'b0000;
		end
	6'b001001://instruccion addiU
		begin
			regDst = 1'b0;
			aluSrc = 1'b1;
			jump=1'b0;
			memtoReg = 1'b0;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp = 4'b0000;
		end
	6'b101011://instruccion sw
		begin
			regDst = 1'b0;
			aluSrc = 1'b1;
			jump=1'b0;
			memtoReg = 1'b0;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b1;
			branch = 1'b0;
			aluOp= 4'b0000;
		end
	6'b001100://instruccion andi
		begin
			regDst = 1'b0;
			aluSrc = 1'b1;
			jump=1'b0;
			memtoReg = 1'b0;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp = 4'b0100;
		end
	6'b001101://instruccion ori
		begin
			regDst = 1'b0;
			aluSrc = 1'b1;
			jump=1'b0;
			memtoReg = 1'b0;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp = 4'b0101;
		end
	6'b001110://instruccion xori
		begin
			regDst = 1'b0;
			aluSrc = 1'b1;
			jump=1'b0;
			memtoReg = 1'b0;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp = 4'b0111;
		end
	6'b001010://instruccion slti
		begin
			regDst = 1'b0;
			aluSrc = 1'b1;
			jump=1'b0;
			memtoReg = 1'b0;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp = 4'b0110;
		end
	6'b001011://instruccion sltiU
		begin
			regDst = 1'b0;
			aluSrc = 1'b1;
			jump=1'b0;
			memtoReg = 1'b0;
			regWrite = 1'b1;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b0;
			aluOp = 4'b0110;
		end
	6'b000011://instruccion b
		begin
			regDst = 1'bx;
			aluSrc = 1'b0;
			jump=1'b0;
			memtoReg = 1'bx;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b1;
			aluOp = 4'b1000;
		end
	6'b000100://instruccion beq
		begin
			regDst = 1'bx;
			aluSrc = 1'b0;
			jump=1'b0;
			memtoReg = 1'bx;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b1;
			aluOp = 4'b0001;
		end
	6'b000001://instruccion bgez
		begin
			regDst = 1'bx;
			aluSrc = 1'b0;
			jump=1'b0;
			memtoReg = 1'bx;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b1;
			aluOp = 4'b0011;
		end
	6'b000101://instruccion bne
		begin
			regDst = 1'bx;
			aluSrc = 1'b0;
			jump=1'b0;
			memtoReg = 1'bx;
			regWrite = 1'b0;
			memRead = 1'b0;
			memWrite = 1'b0;
			branch = 1'b1;
			aluOp = 4'b1011;
		end
	
	6'b000010://instruccion jump
		begin
			regDst = 1'bx;
			aluSrc = 1'bx;
			jump=1'b1;
			memtoReg = 1'bx;
			regWrite = 1'bx;
			memRead = 1'bx;
			memWrite = 1'bx;
			branch = 1'bx;
			aluOp = 4'bxxxx;
		end
	endcase
end

endmodule