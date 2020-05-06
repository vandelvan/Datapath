//Archivo de TestBench para verilog basico generado por Veriscript_TB BETA 1.0
`timescale 1ns/1ns

module SIGNEXT_TB();
    wire [31:0]datoout;
    reg [15:0]datoin;
    SIGNEXT DUV(.datoin(datoin),.datoout(datoout));

    initial begin
			datoin=16'd10;
			#5;
			datoin=-16'd15;
			#5;
        $stop;

        end

endmodule