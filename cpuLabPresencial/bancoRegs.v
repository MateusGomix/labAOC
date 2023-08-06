module bancoRegs(
	input [4:0] endLeitura1,			// RS
	input [4:0] endLeitura2,			// RT
	input [4:0] endEscrita,				// RD
	output [31:0] dadoLeitura1,		// Dado de RS 
	output [31:0] dadoLeitura2,		// Dado de RT
	input [31:0] dadoEscrita,			// Dado a ser escrito em RD
	input clock, writeReg,				// Clock e controle de escrita
	output [31:0] dadoEscritaReg);	//Dado de RD, apenas para waveforms
	
	/* Declaração do banco de registradores */
	reg [31:0] banco[31:0];
	
	always @ (negedge clock)
	begin
		/* Escrita no registrador endEscrita */
		if (writeReg) banco[endEscrita] = dadoEscrita;
	end
	
	/* Dados lidos e escritos */
	assign dadoLeitura1 = banco[endLeitura1];
	assign dadoLeitura2 = banco[endLeitura2];
	assign dadoEscritaReg = banco[endEscrita];

endmodule

