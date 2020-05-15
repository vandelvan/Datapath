`timescale 1ns/1ns
module DATAMEMORY_TB();
reg [31:0]address;
reg [31:0]writeData;
reg memRead;
reg memWrite;
wire [31:0]readData;

DATAMEMORY DUV(.writeData(writeData),.address(address),
	.memWrite(memWrite),.memRead(memRead),
	.readData(readData));
	
initial
begin
	$readmemb("datamemoryTest.txt",DUV.mem);
	memRead = 1'b1;
	address = 32'd0;
	#10;
	memRead = 1'b0;
	memWrite = 1'b1;
	address = 32'd1;
	writeData = 32'd100;
	#10;
	memRead = 1'b1;
	memWrite = 1'b0;
	address = 32'd1;
	#10;
	address = 32'd2;
	#10;
	$stop;
end

endmodule
