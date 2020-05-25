//Modulo adder para el PC, añade 4 a la direccion de la memoria de isntrucciones
module ADD(
	input [31:0] pc,
	output reg [31:0] sal
);



always@*
	begin
		sal=pc+4;	//Añade 4 al contador de programa
	end

endmodule