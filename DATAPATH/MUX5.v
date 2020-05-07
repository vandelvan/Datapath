module MUX5(
	input [7:0] add1,//vienen del suma+4
	input [7:0] aluResult,
	input compand,//resultado compuerta and
	output reg [7:0] pc
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
