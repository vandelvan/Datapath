module SIGNEXT(
	input [15:0] datoIn,//entran 16 bits
	output reg [31:0] datoOut//salen 32
);

always@*
begin
	if(datoIn[15])//si el bit mas significativo es 1
	begin
		datoOut={16'b1111111111111111,datoIn};//se concatenan 1
	end
	else
	begin 
		datoOut={16'b0000000000000000,datoIn};//se concatenan 0
	end
	
end
endmodule