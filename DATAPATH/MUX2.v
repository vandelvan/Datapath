module MUX2(
	input alusrc,
	input[31:0] regs,sign,//readData2 y signExtend
	output reg [31:0]finaldata2
);

always @*
begin 
	if(alusrc)
		finaldata2=sign;
	else
		finaldata2=regs;
end

endmodule	