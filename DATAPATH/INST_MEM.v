
module INST_MEM(
	input [7:0] dir,
	output reg [31:0] datos,d
);
reg [7:0] MR [0:127];


always@*
	begin
		datos={MR[dir],MR[dir+1],MR[dir+2],MR[dir+3]};
		d=datos;
	end
endmodule
