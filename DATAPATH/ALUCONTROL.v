module ALUCONTROL(
	input [5:0] opf,//func
	input [3:0] aluop,
	output reg [3:0] ops//selector de la alu
);

always @*
begin
	case(aluop)
		4'b0000://instrucciones sw y lw,addi, no importa el func
			ops = 4'b0010;//suma
		4'b0001://branchEqual, no importa func
			ops = 4'b0110;//resta
		4'b0010://tipo r
		begin
			case(opf)//func = selector
				6'b000000: ops = 4'b1111;//no operation
				6'b100100: ops = 4'b0000;//&
				6'b100101: ops = 4'b0001;//|
				6'b100000: ops = 4'b0010;//+
				6'b100001: ops = 4'b0010;//+U
				6'b011011: ops = 4'b0011;//%
				6'b100111: ops = 4'b0100;//nor
				6'b000010: ops = 4'b0101;//*
				6'b100010: ops = 4'b0110;//-
				6'b100011: ops = 4'b0110;//-U
				6'b011010: ops = 4'b1000;// /
				6'b101010: ops = 4'b1001;//slt
				6'b101011: ops = 4'b1001;//sltU
				default: ops = 4'b1111;//x
			endcase
		end
		4'b0011://branchGEZ, no importa func
			ops=4'b1011;//a >= 0
		4'b0100://andi
			ops=4'b0000;
		4'b0101://ori
			ops=4'b0001;
		4'b0110://slti
			ops=4'b1001;
		4'b0111://xori
			ops=4'b0111;
		4'b1000://b
			ops=4'b1111;
		4'b1001://lui
			ops=4'b1110;
		4'b1011://bne
			ops=4'b1101;
		4'b1111://bitswap
			ops=4'b1100;
		default: ops=4'b1111;
	endcase
end

endmodule
