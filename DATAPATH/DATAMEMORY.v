module DATAMEMORY(
	input [31:0] writeData,
	input [31:0]address,
	input memWrite,memRead,
	output reg [31:0] readData
);

reg [31:0] mem2 [0:1023];


always @*
	begin
		if(memWrite)
		begin//se escribe y lee
			mem2[address]=writeData;

		end

		if(memRead)
		begin//solo se lee
			readData=mem2[address];
		end
	end


	
endmodule