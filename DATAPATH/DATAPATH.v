module DATAPATH(
	input clk,
	input [31:0] md,
	output [31:0]pru
);

wire [31:0]count;//direccion a leer
wire [31:0]counta;//direccion +4
wire [31:0]countb;//direccion guardada en pc
wire [31:0]datos;//instruccion
wire [31:0]s1; //Read data 1
wire [31:0]s2; //Read data 2
wire [31:0]s2_fin; //Read data despues del mux
wire [31:0]sign; //Sign extend
wire [31:0]datos_esc; //ALUresult a DATAMEMORY o MUX3
wire compand;//CAND a MUX5
wire [4:0]rd;//MUX1 a REGISTRERS 
wire [3:0]sel;//ALUCONTROL a ALU
wire regDst;//UC a MUX1
wire branch;//UC a CAND
wire memRead;//UC a dataMemory
wire memtoReg;//UC a  MUX3
wire [1:0]aluOp;//UC a ALUControl
wire memWrite;//UC a dataMemory
wire aluSrc;//UC a MUX2
wire regWrite;//UC a REGISTRERS
wire [31:0]final_esc; //Datos a escribir en los registros
wire [31:0]direccionASumar;//de SHIFTLEFT a ADDER
wire [31:0]aluResult;//de ADDER a MUX5
wire [31:0]readData;//DATAMEMORY a MUX3


PC p1(.clk(clk),.ent(countb),.pc(count));
ADD p2(.pc(count),.sal(counta));
INST_MEM p3(.dir(count),.datos(datos),.d(pru));
CAND p4(.br(branch),.zf(zf),.compand(compand));

MUX5 p5(.compand(compand),.add1(counta),.aluResult(aluResult),.pc(countb));

MUX1 p6(.rd(datos[15:11]),.rt(datos[20:16]),.regdst(regDst),.finalrd(rd));
REGISTERS p7(.rr1(datos[25:21]),.rr2(datos[20:16]),.wr(rd),.wd(final_esc),.enable(regWrite),.rd1(s1),.rd2(s2));
MUX2 p8(.alusrc(aluSrc),.regs(s2),.sign(sign),.finaldata2(s2_fin));
ALU p9(.a(s1),.b(s2_fin),.sel(sel),.zf(zf),.res(datos_esc));
SIGNEXT p10(.datoin(datos[15:0]),.datoout(sign));
ALUCONTROL p11(.opf(datos[5:0]),.aluop(aluOp),.ops(sel));
UC p12(.opcode(datos[31:26]),.regDst(regDst),.branch(branch),.memRead(memRead),.memtoReg(memtoReg),.aluOp(aluOp),.memWrite(memWrite),.aluSrc(aluSrc),.regWrite(regWrite));
MUX3 p13(.memtoReg(memtoReg),.regs(datos_esc),.md(readData),.final_esc(final_esc));
SHIFTLEFT2 p14(.entrada(sign),.salida(direccionASumar));
ADDER p15(.op1(counta),.op2(direccionASumar),.aluResult(aluResult));
DATAMEMORY p16(.writeData(s2),.address(datos_esc),.memWrite(memWrite),.memRead(memRead),.readData(readData));
endmodule