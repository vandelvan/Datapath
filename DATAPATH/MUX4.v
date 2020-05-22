module MUX4(
	input [31:0] mx5,//vienen del mux 5
	input [31:0] shift,//viene del shift left jump
	input jump,//señal jump
	output reg [31:0] pc
);

always @*
	begin
		if(jump)
		begin
			pc=shift;
		end
		else
		begin
			pc=mx5;
		end
	end
endmodule
