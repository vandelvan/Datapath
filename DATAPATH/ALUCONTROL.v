module ALUCONTROL(
	input [5:0] opf,//func
	input [1:0] aluop,
	output reg [3:0] ops//selector de la alu
);

always @*
begin
	case(aluop)
		2'b00://instrucciones sw y lw, no importa el func
			ops = 4'b0010;//suma
		2'b01://branchEqual, no importa func
			ops = 4'b0110;//resta
		2'b10://tipo r
			case(opf)//func = selector
				6'b100100: ops = 4'b0000;//&
				6'b100101: ops = 4'b0001;//|
				6'b100000: ops = 4'b0010;//+
				6'b100111: ops = 4'b0100;//nor
				6'b000010: ops = 4'b0101;//*
				6'b100010: ops = 4'b0110;//-
				6'b011010: ops = 4'b1000;// /
				6'b101010: ops = 4'b1001;//slt?
				default: ops = 4'b1111;//x
			endcase
		2'b11://branchGTZ, no importa func
			ops=4'b1011;//a >= 0
		default: ops=4'b1111;
	endcase
end

endmodule
