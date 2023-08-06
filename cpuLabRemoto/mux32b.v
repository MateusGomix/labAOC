module mux32b
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=6, parameter A = 16'b0000000000000000, parameter B = 6'b000000)	
	(
	input [DATA_WIDTH - 1:0] entrada1,
	input [DATA_WIDTH - 1:0] entrada2,
	output reg [DATA_WIDTH - 1:0] saida,
	input selecao);
	
	always @ (*)
	begin
	
		/* Instrucao*/
		if (selecao) saida = entrada1;
		/* Banco de registradores */
		else saida = entrada2;
	
	end
	
endmodule