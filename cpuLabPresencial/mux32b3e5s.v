module mux32b3e5s
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=6, parameter A = 16'b0000000000000000, parameter B = 6'b000000)	
	(
	input [DATA_WIDTH - 1:0] entrada1,
	input [DATA_WIDTH - 1:0] entrada2,
	input [DATA_WIDTH - 1:0] entrada3,
	output reg [DATA_WIDTH - 1:0] saida,
	input selecao1,
	input selecao2,
	input selecao3,
	input selecao4,
	input selecao5,
	input selecao6);
	
	always @ (*)
	begin
		
		/* Jump ou jump and link */
		if (selecao1) saida = entrada1;
		/* Jump register */
		else if (selecao2) saida = entrada2;
		/* Branches */
		else if (selecao3 && selecao4) saida = entrada1;
		/* Halt ou in */
		else if (selecao5 == 1 || selecao6 == 1) saida = entrada3;
		/* Saida normal*/
		else saida = entrada3 + 1;
	
	end
	
endmodule