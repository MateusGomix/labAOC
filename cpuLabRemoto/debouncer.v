module debouncer(
	input entrada,
	input clk,
	output saida);
	
	reg ultimoEstado = 0;
	reg ultimaEntrada = 0;
	integer cont = 0;
	reg mudou = 0;
	reg saidaPrev = 0;
	
	always @ (posedge clk)
	begin
		
		if (entrada != ultimoEstado) cont = 0;
		else cont = cont + 1;
		
		if (cont >= 1000) 
		begin
		
			if(entrada != ultimaEntrada) mudou = 1;
			else mudou = 0;
			
			if (mudou && entrada) saidaPrev = 1;
			else saidaPrev = 0;
			
			if (entrada == 0) cont = 0;
			
			ultimaEntrada = entrada;
			
		end
		
		ultimoEstado = entrada;
		
	end
	
	assign saida = saidaPrev; // & clk;
	
endmodule
