//Memoria de instrucciones
module REGISTERS(
	input [4:0] rr1,rr2,wr,	//read register 1,2, write register - direcciones a leer/escribir
	input [31:0] wd,	//write data - Dato a escribir en la memoria
	input enable,	//Bit que indica si se escribira o no
	output reg [31:0] rd1,rd2	//read data 1,2 - salida de datos a leer
);

reg [31:0] mem [0:31];


always @* 
	begin
		if(enable)	//si la escritura esta habilitada
		begin//se lee y escribe
			if(wr != 5'b00000)	//Si no es el registro $zero
			begin
				mem[wr]=wd;	//Se guarda el dato a guardar en la posicion write register
			end
			rd1=mem[rr1];
			rd2=mem[rr2];
		end
		else
		begin//solo se lee
			rd1=mem[rr1];
			rd2=mem[rr2];
		end
	end


	
endmodule
