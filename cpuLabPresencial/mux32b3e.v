module mux32b3e
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=6, parameter A = 16'b0000000000000000, parameter B = 6'b000000)	
	(
	input [DATA_WIDTH - 1:0] entrada1,
	input [DATA_WIDTH - 1:0] entrada2,
	input [DATA_WIDTH - 1:0] entrada3,
	output reg [DATA_WIDTH - 1:0] saida,
	input selecao1,
	input selecao2);
	
	always @ (*)
	begin
		
		/* Ula */
		saida = entrada3;
		/* Memoria de dados */
		if (selecao1) saida = entrada1;
		/* PC atual */
		if (selecao2) saida = entrada2;
	
	end
	
endmodule