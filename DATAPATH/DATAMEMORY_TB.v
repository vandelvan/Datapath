`timescale 1ns/1ns
module DATAMEMORY_TB();
reg [31:0]address;
reg [31:0]writeData;
reg memRead;
reg memWrite;
wire [31:0]readData;

DATAMEMORY DUV(.address(address),
	.writeData(writeData),.memRead(memRead),
	.memWrite(memWrite),.readData(readData));
	
initial
begin
	$readmemb("datamemoryTest.txt",DUV.memoria);
	memRead = 1'b1;
	address = 32'd0;
	#10;
	memRead = 1'b0;
	memWrite = 1'b1;
	address = 32'd1;
	writeData = 32'd10;
	#10;
	memWrite = 1'b0;
	memRead = 1'b1;
	address = 32'd1;
	#10;
	$stop;
end

endmodule
