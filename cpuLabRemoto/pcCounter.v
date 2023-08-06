module pcCounter
	(
	input [31:0] entrada,
	output [27:0] displays);
	
	/* Saídas do extrator de dígitos */
	wire [3:0] pcdig1;
	wire [3:0] pcdig2;
	wire [3:0] pcdig3;
	wire [3:0] pcdig4;

	converte conv2(
		.entrada(entrada),
		.saida1(pcdig1),
		.saida2(pcdig2),
		.saida3(pcdig3),
		.saida4(pcdig4));
	
	bcd hex7(
		.entradas(pcdig4),
		.saidas(displays[27:21]));
	
	bcd hex6(
		.entradas(pcdig3),
		.saidas(displays[20:14]));
		
	bcd hex5(
		.entradas(pcdig2),
		.saidas(displays[13:7]));
		
	bcd hex4(
		.entradas(pcdig1),
		.saidas(displays[6:0]));

endmodule
