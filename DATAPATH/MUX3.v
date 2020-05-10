module MUX3(
	input memtoReg,
	input[31:0] regs,md,
	output reg [31:0]final_esc
);

always @*
begin 
	if(memtoReg)
		final_esc=md;//readData de dataMemory 
	else
		final_esc=regs;//viene de ALUresult
end

endmodule	