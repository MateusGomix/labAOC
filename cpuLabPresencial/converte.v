module converte(
	input [31:0] entrada,	// Valor a se retirar os 4 dígitos
	output [3:0] saida1,		// Dígito 1
	output [3:0] saida2,		// Dígito 2
	output [3:0] saida3,		// Dígito 3
	output [3:0] saida4		// Dígito 4
);
	
	/* Guarda os dígitos, 
	 * pode ser trocada por cada wire saidaX, 
	 * porém é mais fácil de se usar no laço
	 */
	reg [6:0] aux [3:0];
	
	integer i;
	
	always @ (*) 
	 begin
		
		/* Conversão com laço, aparentemente 
		 * estava atrasando a compilação 
		 */
		/*for(i = 0; i < 4; i = i + 1)
			aux[i] = (entrada % 10**(i + 1)) / 10**i;*/
		
		/* Conversão com atribuições fixas */
		aux[0] = entrada % 10;					// Primeiro dígito
		aux[1] = (entrada % 100) / 10;		// Segundo dígito
		aux[2] = (entrada % 1000) / 100;		// Terceiro dígito
		aux[3] = (entrada % 10000) / 1000;	// Quarto dígito

	 end
	
	assign saida1 = aux[0];
	assign saida2 = aux[1];
	assign saida3 = aux[2];
	assign saida4 = aux[3];
	
endmodule
