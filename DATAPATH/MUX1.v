module MUX1(
	input regdst,
	input[4:0] rt,rd,
	output reg [4:0]finalrd
);

always @*
begin 
	if(regdst)
		finalrd=rd;
	else
		finalrd=rt;
end

endmodule	