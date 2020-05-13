module ALU(
	input [31:0] a,b,
	input [3:0] sel,
	output reg zf,
	output reg [31:0] res
);

always@*
begin
	case(sel)
		4'b0000: res= a & b;
		4'b0001: res= a | b;
		4'b0010: res= a + b;
		4'b0100: res= ~(a | b);
		4'b0101: res= a * b;
		4'b0110: res= a - b;
		4'b0111: res= a ^ b;
		4'b1000: res= a / b;
		4'b1001: res= (a < b);
		4'b1011: res= ~(a >= 0);
		4'b1100: res= ~(b);
		4'b1101: res= 32'd0;
		4'b1110: res= 32'b11111111111111111111111111111111;
		4'b1111: res= 32'dx;
		default: res=32'dx;
	endcase

	if(res==0)
		zf=1;
	else
		zf=0;
	
	
end
endmodule