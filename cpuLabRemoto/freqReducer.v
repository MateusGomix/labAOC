module freqReducer(
	input entrada,		// Clock da placa
	output saida, 		// Clock atrasado
	input halt);		// Sinal para paralisar o clock

	/* Contador que incrementa com o clock */
	reg [31:0]count = 0;

	always @ (posedge entrada)
	begin

		//count = count + 1;

		if (halt) count = 0;
		else count = count + 1;
	end

	/* Se quiser aumentar o período do clock
	 * basta acrescentar mais bits à esquerda
	 * e se quiser o clock original basta
	 * atribuir a saida ao bit zero do contador
	 * (útil para formas de onda)
	 * Clock lento: 23
	 * Clock rapido: 13
	 */
	assign saida = count[13];

endmodule
