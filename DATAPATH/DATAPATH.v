module DATAPATH(
	input clk,
	output [31:0]pru,//para debug INST_MEM(d)
	output [31:0]prum//para debug 
);

wire [31:0]entradaPc;//MUX - PC
wire [31:0]salidaPc;//PC - ADD & INST_MEM 
wire [31:0]salidaAdder;//ADD(sal) - MUX5(add1) & BUFFER0(intSiguienteI)
wire [31:0]salidaInst_Mem;//INST_MEM(datos)-BUFFER0(insActualI)
wire [31:0]insSiguiente;//BUFFER0(insSiguienteO) - BUFFER1(instruccionSiguienteI)
wire [31:0]insActual;//BUFFER0(insActualO) - UC & REGISTRERS & SIGNEXTEND & BUFFER1
wire jump1;//UC(jump) - BUFFER1(jumpI)
wire regDst1;//UC(regDst) - BUFFER1(regDstI)
wire branch1;//UC(branch) - BUFFER1(branchI)
wire memRead1;//UC(memRead) - BUFFER1(memReadI)
wire memToReg1;//UC(memToReg) - BUFFER1(memToRegI)
wire [3:0]aluOp1;//UC(aluOp) - BUFFER1(aluOpI)
wire memWrite1;//UC(memWrite) - BUFFER1(memWriteI)
wire aluSrc1;//UC(aluSrc) - BUFFER1(aluSrcI)
wire regWrite1;//UC(regWrite) - BUFFER1(regWriteI)
wire [31:0]readData1;//REGISTRERS(rd1) - BUFFER1(readData1I)
wire [31:0]readData2;//REGISTRERS(rd2) - BUFFER1(readData2I)
wire [31:0]numeroExtendido;//SIGNEXTEND(datoOut) - BUFFER1(signExtendI)
wire jump2;//BUFFER1(jumpO) - BUFFER2(jumpI)
wire regDst2;//BUFFER1(regDstO) - MUX1(regDst)
wire branch2;//BUFFER1(branchO) - BUFFER2(branchI)
wire memRead2;//BUFFER1(memReadO) - BUFFER2(memReadI)
wire memToReg2;//BUFFER1(memToRegO) - BUFFER2(memToRegI)
wire [3:0]aluOp2;//BUFFER1(aluOpO) - ALUCONTROL(aluOp)
wire memWrite2;//BUFFER1(memWriteO) - BUFFER2(memWriteI)
wire aluSrc2;//BUFFER1(aluSrcO) - MUX2(aluSrc)
wire [31:0]insSiguiente2;//BUFFER1(instruccionSiguienteO) - ADDER(op1)
wire [31:0]readData12;//BUFFER1(readData1O) - ALU(a)
wire [31:0]readData22;//BUFFER1(readData2O) - MUX2(regs) & BUFFER2(readData2I)
wire [31:0]numeroExtendido2;//BUFFER1(signExtendO) - ALUCONTROL(opf) & MUX2(sign) & SHIFTLEFT2(entrada)
wire [4:0]rt;//BUFFER1(rtO) - MUX1(rt)
wire [4:0]rd;//BUFFER1(rdO) - MUX1(rd)
wire [31:0]salidaShiftLeft;//SHIFTLEFT(salida) - ADDER(op2)
wire [31:0]salidaMux2;//MUX2(finaldata2) - ALU(b)
wire [3:0]salidaAluControl;//ALUCONTROL(ops) - ALU(sel)
wire [4:0]salidaMux1;//MUX1(finalrd) - BUFFER2(writeRegistrerI)
wire [31:0]salidaAdder;//ADDER(aluResult) - BUFFER2(siguienteInstruccionI)
wire zf;//ALU(zf) - BUFFER2(zfI)
wire [31:0]salidaAlu;//ALU(res) - BUFFER2(aluResultI)
wire jump3;//BUFFER2(jumpO) - BUFFER3(jumpI)
wire branch3;//BUFFER2(branchO) - CAND(br)
wire memRead3;//BUFFER2(memReadO) - DATAMEMORY(memReadI)
wire memToReg3;//BUFFER2(memToRegO) - BUFFER3(memToRegI)
wire memWrite3;//BUFFER2(memWriteO) - DATAMEMORY(memWrite)
wire regWrite3;//BUFFER2(regWriteO) - BUFFER3(regWriteI)
wire [31:0]instruccionAlterada;//BUFFER2(siguienteInstruccionO) - MUX5(aluResult)
wire [31:0]direccionDato;//BUFFER2(aluResultO) - DATAMEMORY(address) & BUFFER3(writeRegistrerI)
wire zf2;//BUFFER2(zfO) - CAND(zf)
wire [31:0]escribirEnDatos;//BUFFER2(readData2O) - DATAMEMORY(writeData)
wire [31:0]direccionEscribirRegistro;//BUFFER2(writeRegistrerO) - BUFFER3(writeRegistrerI)
wire salidaCand;//CAND(compand) - MUX5(compand)
wire [31:0]datoDeDatamemory;//DATAMEMORY(readData) - BUFFER3(readDataI)
wire [31:0]guardarEnRegistro;//BUFFER3(readDataO) - MUX3(md)


PC p1(.clk(clk),.ent(entradaPc),.pc(salidaPc));

ADD p2(.pc(salidaPc),.sal(salidaAdder));

INST_MEM p3(.dir(salidaPc),.datos(salidaInst_Mem),.d(pru));

BUFFER0 p17(.clk(clk),.insSiguienteI(salidaAdder),.insActualI(salidaInst_Mem),.insSiguienteO(insSiguiente),.insActualO(insActual));

REGISTERS p7(.rr1(insActual[25:21]),.rr2(insActual[20:16]),.wr(),.wd(),.enable(),.rd1(readData1),.rd2(readData2));

UC p12(.opcode(insActual[31:26]),.jump(jump1),.regDst(regDst1),.branch(branch1),.memRead(memRead1),.memToReg(memToReg1),.aluOp(aluOp1),.memWrite(memWrite1),.aluSrc(aluSrc1),.regWrite(regWrite1));

SIGNEXT p10(.datoIn(insActual[15:0]),.datoOut(numeroExtendido));

BUFFER1 p18(.clk(clk),.regDstI(regDst1),.jumpI(jump1),.branchI(branch1),.memReadI(memRead1),.memToRegI(memToReg1),.aluOpI(aluOp1),.memWriteI(memWrite1),	.aluSrcI(aluSrc1),.regWriteI(regWrite1),.instruccionSiguienteI(insSiguiente),.readData1I(readData1),.readData2I(readData2),.signExtendI(numeroExtendido),.rtI(insActual[20:16]),.rdI(insActual[15:11]),.regDstO(regDst2),.jumpO(jump2),.branchO(branch2),.memReadO(memRead2),.memToRegO(memToReg2),.aluOpO(aluOp2),.memWriteO(memWrite2),.aluSrcO(aluSrc2),.regWriteO(regWrite2),.instruccionSiguienteO(insSiguiente2),.readData1O(readData12),.readData2O(readData22),.signExtendO(numeroExtendido2),.rtO(rt),.rdO(rd));

MUX1 p6(.rd(rd),.rt(rt),.regDst(regDst2),.finalrd(salidaMux1));

ALUCONTROL p11(.opf(numeroExtendido2[5:0]),.aluOp(aluOp2),.ops(salidaAluControl));

MUX2 p8(.aluSrc(aluSrc2),.regs(readData22),.sign(numeroExtendido2),.finaldata2(salidaMux2));

ADDER p15(.op1(insSiguiente2),.op2(salidaShiftLeft),.aluResult(salidaAdder));

SHIFTLEFT2 p14(.entrada(numeroExtendido2),.salida(salidaShiftLeft));

ALU p9(.a(readData12),.b(salidaMux2),.sel(salidaAluControl),.zf(zf),.res(salidaAlu));

MUX5 p5(.compand(salidaCand),.add1(salidaAdder),.aluResult(instruccionAlterada),.pc());

SIGNEXT p10(.datoin(insActual[15:0]),.datoout());

UC p12(.opcode(insActual[31:26]),.jump(),.regDst(),.branch(),.memRead(),.memtoReg(),.aluOp(),.memWrite(),.aluSrc(),.regWrite());

MUX3 p13(.memtoReg(),.regs(),.md(guardarEnRegistro),.final_esc(),.prum());

BUFFER2 p19(.clk(clk),.jumpI(jump2),.branchI(branch2),.memReadI(memRead2),.memToRegI(memToReg2),.memWriteI(memWrite2),.regWriteI(regWrite2),.siguienteInstruccionI(salidaAdder),.zfI(zf),.aluResultI(salidaAlu),.readData2I(readData22),.writeRegistrerI(salidaMux1),.jumpO(jump3),.branchO(branch3),.memReadO(memRead3),.memtoRegO(memToReg3),.memWriteO(memWrite3),.regWriteO(regWrite3),.siguienteInstruccionO(instruccionAlterada),.zfO(zf2),.aluResultO(direccionDato),.readData2O(escribirEnDatos),.writeRegistrerO(direccionEscribirRegistro));

CAND p4(.br(branch3),.zf(zf2),.compand(salidaCand));

DATAMEMORY p16(.writeData(escribirEnDatos),.address(direccionDato),.memWrite(memWrite3),.memRead(memRead3),.readData(datoDeDatamemory));

BUFFER3 p20(.clk(clk),.jumpI(jump3),.memToRegI(memToReg3),.regWriteI(regWrite3),.readDataI(datoDeDatamemory),.aluResultI(),.writeRegistrerI(direccionDato),.jumpO(),.memtoRegO(),.regWriteO(),.readDataO(guardarEnRegistro),.aluResultO(),.writeRegistrerO(direccionEscribirRegistro));
	 
endmodule