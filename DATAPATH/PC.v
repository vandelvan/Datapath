
module PC(
	input clk,
	input [31:0] ent,
	output reg [31:0] pc
);



always @(posedge clk)
	begin
		if(ent>=0)
			begin
				pc=ent;
			end
		else
			begin

				pc=32'd0;
			end
	end
	
endmodule