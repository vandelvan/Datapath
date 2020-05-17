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
	$readmemb("datamemoryTest.txt",DUV.mem2);
	memRead=0;
	memWrite=1;
	address=32'd4;
	writeData=32'd0;
	#5;
	address=32'd1;
	writeData=32'd1;
	#5;
	memRead=1;
	memWrite=0;
	address=32'd0;
	writeData=32'd0;
	#5;
	address=32'd1;
	writeData=32'd1;
	#5;
	$stop;
end

endmodule
