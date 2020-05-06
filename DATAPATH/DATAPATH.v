module DATAPATH(
	input clk,br,regdst,enable,alusrc,
	input [2:0]aluop,
	output [31:0]pru
);

wire [7:0]count;
wire [7:0]counta;
wire [7:0]countb;
wire [31:0]datos;
wire [31:0]s1;
wire [31:0]s2;
wire [31:0]s2_fin;
wire [31:0]sign;
wire [31:0]datos_esc;
wire compand;
wire [4:0]rd;
wire [3:0]sel;



PC p1(.clk(clk),.ent(countb),.pc(count));
ADD p2(.pc(count),.sal(counta));
INST_MEM p3(.dir(count),.datos(datos),.d(pru));
CAND p4(.br(br),.zf(zf),.compand(compand));
MUX5 p5(.compand(compand),.add1(counta),.pc(countb));
MUX1 p6(.rd(datos[15:11]),.rt(datos[20:16]),.regdst(regdst),.finalrd(rd));
REGISTERS p7(.rr1(datos[25:21]),.rr2(datos[20:16]),.wr(rd),.wd(datos_esc),.enable(enable),.rd1(s1),.rd2(s2));
MUX2 p8(.alusrc(alusrc),.regs(s2),.sign(sign),.finaldata2(s2_fin));
ALU p9(.a(s1),.b(s2_fin),.sel(sel),.zf(zf),.res(datos_esc));
SIGNEXT p10(.datoin(datos[15:0]),.datoout(sign));
ALUCONTROL p11(.opf(datos[5:0]),.aluop(aluop),.ops(sel));

endmodule