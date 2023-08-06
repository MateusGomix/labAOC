module alu 
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=6)	
	(
	input [DATA_WIDTH-1:0] eAlu1, 
	input [DATA_WIDTH-1:0] eAlu2,
	input [3:0] opAlu,  
	input clock,
	output reg [DATA_WIDTH-1:0] sAlu,
	output reg branch);
	
	

	always @ (eAlu1 or eAlu2 or opAlu)
	begin
		
		branch = 0;
	
		case(opAlu)
			
			/* soma, load, store, in */
			4'b0000: sAlu = eAlu1 + eAlu2;
			/* subtracao */
			4'b0001: sAlu = eAlu1 - eAlu2;
			/* multiplicacao */
			4'b0010: sAlu = eAlu1 * eAlu2;
			/* divisao */
			4'b0011: sAlu = eAlu1 / eAlu2;
			/* slt */
			4'b0100: 
			begin
				sAlu = eAlu1 - eAlu2;
				/* Se o msb for 1, o resultado da subtração é negativo */
				if (sAlu[DATA_WIDTH-1] == 1)
					sAlu = 1;
				else
					sAlu = 0;
			end
			// and */
			4'b0101: sAlu = eAlu1 & eAlu2;
			/* or */
			4'b0110: sAlu = eAlu1 | eAlu2;
			/* not */
			4'b0111: sAlu = ~eAlu1;
			/* sr */
			4'b1000: sAlu = eAlu1 * 2;
			/* sl */
			4'b1001: sAlu = eAlu1 / 2;
			/* loadi */
			4'b1010: sAlu = eAlu2;
			/* move */
			4'b1011: sAlu = eAlu1;
			/* beq */
			4'b1100: 
				begin
					sAlu = eAlu1 - eAlu2;
					if (sAlu == 0)
						branch = 1;
					else 
						branch = 0;
				end
			/* bne */
			4'b1101: 
				begin
					sAlu = eAlu1 - eAlu2;
					if (sAlu != 0)
						branch = 1;
					else 
						branch = 0;
				end
			/* outros */
			default: sAlu = 0;
		
		endcase
	
	end

endmodule
