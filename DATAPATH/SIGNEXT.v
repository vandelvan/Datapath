module SIGNEXT(
	input [15:0] datoin,
	output reg [31:0] datoout
);

always@*
begin
	if(datoin[15])
	begin
		datoout={16'b1111111111111111,datoin};
	end
	else
	begin 
		datoout={16'b0000000000000000,datoin};
	end
	
end
endmodule