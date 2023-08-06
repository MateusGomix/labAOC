module pc
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=6)	
	(
	output reg [2**ADDR_WIDTH - 1:0] atual,
	input [2**ADDR_WIDTH - 1:0] proximo,
	input clock);
	
	integer primeiroClock = 1;
	
	always @ (negedge clock) 
	begin
		
		/* Pular o primeiro clock para carregar instrucoes */
		if(primeiroClock) 
		begin
			
			primeiroClock = 0;
			atual = 0;
			
		end
		else atual = proximo;
		
	end
	
endmodule