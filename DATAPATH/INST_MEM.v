//Modulo memoria de instrucciones
module INST_MEM(
	input [31:0] dir,
	output reg [31:0] datos,d
);
reg [7:0] MR [0:2047];


always@*
	begin
		//Da salida a la instuccion completa originalmente dividida en 4 secciones
		datos={MR[dir],MR[dir+1],MR[dir+2],MR[dir+3]};
		d=datos;
	end
endmodule
