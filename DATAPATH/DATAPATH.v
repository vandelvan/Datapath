module DATAPATH(
	input clk,br,zf,regdst,enable,
	input [31:0] datos_esc,
	output [31:0]s1,s2
);

wire [7:0]count;
wire [7:0]counta;
wire [7:0]countb;
wire [31:0]datos;
wire compand;
wire [4:0]rd;


PC p1(.clk(clk),.ent(countb),.pc(count));
ADD p2(.pc(count),.sal(counta));
INST_MEM p3(.dir(count),.datos(datos));
CAND p4(.br(br),.zf(zf),.compand(compand));
MUX5 p5(.compand(compand),.add1(counta),.pc(countb));
MUX1 p6(.rd(datos[15:11]),.rt(datos[20:16]),.regdst(regdst),.finalrd(rd));
REGISTERS p7(.rr1(datos[25:21]),.rr2(datos[20:16]),.wr(rd),.wd(datos_esc),.enable(enable),.rd1(s1),.rd2(s2));

endmodule