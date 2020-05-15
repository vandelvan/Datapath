module DATAMEMORY(
	input [31:0]address,
	input memWrite,
	input memRead,
	output reg [31:0] readData
);

reg [31:0] mem [0:1023];


always @(address)
	begin
		if(memWrite && (memRead == 0))
		begin//se escribe
			readData = mem[address];
		end
		else
		begin//solo se lee
			readData = mem[address];
		end
	end


	
endmodule
