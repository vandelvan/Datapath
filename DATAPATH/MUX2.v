module MUX2(
	input aluSrc,
	input[31:0] regs,sign,//readData2 y signExtend
	output reg [31:0]finaldata2
);

always @*
begin 
	if(aluSrc)
		finaldata2=sign;
	else
		finaldata2=regs;
end

endmodule	