module MUX5(
	input [31:0] add1,//vienen del suma+4
	input [31:0] aluResult,
	input compand,//resultado compuerta and
	output reg [31:0] pc
);

always @*
	begin
		if(compand)
		begin
			pc=aluResult;
		end
		else
		begin
			pc=add1;
		end
	end
endmodule
