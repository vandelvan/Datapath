//Program Counter
module PC(
	input clk,
	input [31:0] ent,
	output reg [31:0] pc
);

always @(posedge clk)
	begin
		if(ent>=0)
			begin
				//si no es la primera vez recibe el resultado del adder para iterar la memoria
				pc=ent;
			end
		else
			begin
				//si es la primera vez inicializa el contador de programa en 0
				pc=32'd0;
			end
	end
	
endmodule