module mux5b
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=6, parameter A = 16'b0000000000000000, parameter B = 6'b000000)	
	(
	input [ADDR_WIDTH - 1:0] entrada1,
	input [ADDR_WIDTH - 1:0] entrada2,
	input [ADDR_WIDTH - 1:0] entrada3,
	output reg [ADDR_WIDTH - 1:0] saida,
	input selecao1,
	input selecao2);
	
	always @ (*)
	begin
		
		/* RT descrito pela instrucao */
		saida = entrada3;
		
		/* RD descrito pela instrucao */
		if (selecao1) saida = entrada1;
		/* RA, o ultimo registrador */
		if (selecao2) saida = entrada2;
	
	end
	
endmodule