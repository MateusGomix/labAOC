module memDados
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=6)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input we, re, clk,
	output reg [(DATA_WIDTH-1):0] q
);

	/* Declaração da RAM */
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

	always @ (negedge clk)
	begin
		/* Escrita do dado de entrada */
		if (we)
			ram[addr] = data;
	end
	
	always @ (*)
		/* Leitura da memoria */
		if (re)
			q = ram[addr];

endmodule

