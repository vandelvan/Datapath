module REGISTERS(
	input [4:0] rr1,rr2,wr,
	input [31:0] wd,
	input enable,
	output reg [31:0] rd1,rd2
);

reg [31:0] mem [0:1023];


always @(rr1,rr2,wd) //No le hace caso a wr, para evitar errores
	begin
		if(enable)
		begin//se lee y escribe
			mem[wr]=wd;
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
