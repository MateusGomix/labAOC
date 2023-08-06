module memInst
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=6)
(
	input clk,
	output reg [(DATA_WIDTH-1):0] q,
	input [ADDR_WIDTH-1:0] pc
);

	/* Declaração da RAM */
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
	
	/* Flag para escrita das instrucoes */
	integer primeiroClock = 1;

	always @ (posedge clk)
	begin
		/* Escrita das instrucoes na primeira subida de clock */
		if (primeiroClock)
		begin
			$readmemb("intrucoesLOAD.txt", ram);
			primeiroClock = 0;
		end
		/* Leitura das instrucoes */
		else q = ram[pc];
		
	end

endmodule

