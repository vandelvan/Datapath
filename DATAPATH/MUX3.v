module MUX3(
	input memtoReg,
	input[31:0] regs,md,
	output reg [31:0]final_esc,
	output reg [31:0]prum
);

always @*
begin 
	if(memtoReg)
	begin
		final_esc=md;//readData de dataMemory 
		prum=final_esc;
	end
	else
	begin
		final_esc=regs;//viene de ALUresult
		prum=final_esc;
	end
end

endmodule	