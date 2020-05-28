
module PC(
	input clk,
	input [7:0] ent,
	output reg [7:0] pc
);



always @(posedge clk)
	begin
		if(ent>=0)
			begin
				pc=ent;
			end
		else
			begin

				pc=8'd0;
			end
	end
	
endmodule