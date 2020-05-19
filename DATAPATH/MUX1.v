module MUX1(
	input regDst,
	input[4:0] rt,rd,
	output reg [4:0]finalrd
);

always @*
begin 
	if(regDst)
		finalrd=rd;
	else
		finalrd=rt;
end

endmodule	