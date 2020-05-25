//Unidad Aritmetico-Logica
module ALU(
	input [31:0] a,b,	//Operadores
	input [3:0] sel,	//Selecciona la operacion a realizar
	output reg zf,		//Zero-Flag Indica si el resultado es 0
	output reg [31:0] res	//Resultado
);

always@*
begin
	case(sel)	//Evalua el selector para realizar una operacion aritmetica o logica
		4'b0000: res= a & b;		//Selector AND
		4'b0001: res= a | b;		//Selector OR
		4'b0010: res= a + b;		//Selector Suma
		4'b0011: res= a % b;		//Selector Modulo
		4'b0100: res= ~(a | b);	//Selector NOR
		4'b0101: res= a * b;		//Selector Multiplicacion
		4'b0110: res= a - b;		//Selector Resta
		4'b0111: res= a ^ b;		//Selector XOR
		4'b1000: res= a / b;		//Selector Division
		4'b1001: res= (a < b);	//Selector AND
		4'b1011: res= (a <= 0);	//Selector AND
		4'b1100: res= ~(b);		//Selector NOT
		4'b1101: res= (a == b);	//Selector 
		4'b1110: res= b << 16;	//Selector 
		4'b1111: res= 32'd0;		//Selector 
		default: res=32'dx;		//Selector 
	endcase

	if(res==0)	//Evalua si el resultado es 0, en tal caso, zero-flag es 1
		zf=1;
	else
		zf=0;
	
	
end
endmodule