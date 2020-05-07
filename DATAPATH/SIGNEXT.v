module SIGNEXT(
	input [15:0] datoin,//entran 16 bits
	output reg [31:0] datoout//salen 32
);

always@*
begin
	if(datoin[15])//si el bit mas significativo es 1
	begin
		datoout={16'b1111111111111111,datoin};//se concatenan 1
	end
	else
	begin 
		datoout={16'b0000000000000000,datoin};//se concatenan 0
	end
	
end
endmodule