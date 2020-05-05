module ADD(
	input [7:0] pc,
	output reg [7:0] sal
);



always@*
	begin
		sal=pc+4;
	end

endmodule