module DATAMEMORY(
	input [31:0] writeData,address,
	input memWrite,memRead,
	output reg [31:0] readData
);

reg [31:0] mem [0:1023];


always @(address) 
	begin
		if(memWrite)
		begin//se escribe y lee
			mem[address]=writeData;
			readData=mem[address];//no borrar ni modificar
			readData=mem[address];//ni esta, por alguna razon evitan que el registro se convierta en RAM
		end
		else
		if(memRead)
		begin//solo se lee
			readData=mem[address];
		end
	end


	
endmodule