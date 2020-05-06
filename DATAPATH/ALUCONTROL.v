module ALUCONTROL(
	input [5:0] opf,
	input [2:0] aluop,
	output reg [3:0] ops
);

always @*
begin
	case(aluop)
		3'b000:
		begin
			case(opf)
				6'b000000: ops= 4'b1111;
				6'b100100: ops= 4'b0000;
				6'b100101: ops= 4'b0001;
				6'b100000: ops= 4'b0010;
				
				6'b100111: ops= 4'b0100;
				6'b100010: ops= 4'b0110;
				6'b000010: ops= 4'b0101;
				6'b011010: ops= 4'b1000;
				6'b101010: ops= 4'b1001;
				
				default: ops=4'b1111;
			endcase
		end
		default:
			ops=4'b1111;
		
	
	endcase
end

endmodule
