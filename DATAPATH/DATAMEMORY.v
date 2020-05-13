module DATAMEMORY(
	input [31:0]address,//viene de aluResult
	input [31:0]writeData,//viene de readData2
	input memRead,
	input memWrite,
	output reg [31:0]readData
);

reg [31:0]memoria[0:2048];

initial
begin
	if(memRead)//lee datos 
	begin
		readData = memoria[address];
	end
	else if(memWrite)//escribe en memoria solo si memRead es 0
	begin
		memoria[address] = writeData;
	end
end
endmodule
