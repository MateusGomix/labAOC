module testaBCD(
	input [31:0] valor,
	output [6:0] disp1,
	output [6:0] disp2,
	output [6:0] disp3,
	output [6:0] disp4);
	
	wire [3:0] dig1;
	wire [3:0] dig2;
	wire [3:0] dig3;
	wire [3:0] dig4;
	
	converte conv1(
		.entrada(valor),
		.saida1(dig1),
		.saida2(dig2),
		.saida3(dig3),
		.saida4(dig4),
		.yes(0));
	
	bcd bcd1(
		.entradas(dig1),
		.saidas(disp1));
	
	bcd bcd2(
		.entradas(dig2),
		.saidas(disp2));
		
	bcd bcd3(
		.entradas(dig3),
		.saidas(disp3));
		
	bcd bcd4(
		.entradas(dig4),
		.saidas(disp4));
	

endmodule
