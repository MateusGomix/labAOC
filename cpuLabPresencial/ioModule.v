module ioModule 
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=6)	
	(
	input [17:0] switches,
	input [DATA_WIDTH-1:0] dataDisp,	
	input button,
	input [1:0] opIo,  
	output reg [DATA_WIDTH-1:0] sIo,
	output reg waitFlag,
	output [27:0] displays);
	
	reg [DATA_WIDTH-1:0] number = 0;
	
	/*reg [DATA_WIDTH-1:0] dataDisp; //apagar essas linhas
	reg [DATA_WIDTH-1:0] sIo;
	reg waitFlag;*/
	
	/* Saídas do extrator de dígitos */
	wire [3:0] dig1;
	wire [3:0] dig2;
	wire [3:0] dig3;
	wire [3:0] dig4;

	always @ (*)
	begin
	
		case(opIo)
			
			/* in */
			2'b01: 
			begin
				//waitFlag = 1;
				number = number;
				if (button) 
				begin
					sIo = {14'b00000000000000, switches};
					waitFlag = 0;
				end
				else //if ({14'b00000000000000, switches} != sIo) //COISA NOVA AQUI
				begin
					sIo = sIo;
					waitFlag = 1;
				end
			end
			
			/* out */
			2'b10: 
			begin
				number = dataDisp;
				waitFlag = 0;
				sIo = 0;
				//if (button) dataDisp = {14'b00000000000000, switches}; // apagar essa linha
			end
			/* outros */
			default:
			begin
				waitFlag = 0;
				number = number;
				sIo = 0;
			end
		
		endcase
	
	end
	
	converte conv1(
		.entrada(number),
		.saida1(dig1),
		.saida2(dig2),
		.saida3(dig3),
		.saida4(dig4));
	
	bcd hex3(
		.entradas(dig4),
		.saidas(displays[27:21]));
	
	bcd hex2(
		.entradas(dig3),
		.saidas(displays[20:14]));
		
	bcd hex1(
		.entradas(dig2),
		.saidas(displays[13:7]));
		
	bcd hex0(
		.entradas(dig1),
		.saidas(displays[6:0]));

endmodule
