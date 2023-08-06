module bcd(   
    input wire [3:0] entradas,  
    output reg [6:0] saidas	
	 );    
	 
	 always @ (entradas)  
    begin
	 	
			case(entradas) 
			
			4'b0000: saidas = 7'b0000001; //caso 0
			4'b0001: saidas = 7'b1001111; //caso 1
			4'b0010: saidas = 7'b0010010; //caso 2
			4'b0011: saidas = 7'b0000110; //caso 3
			4'b0100: saidas = 7'b1001100; //caso 4
			4'b0101: saidas = 7'b0100100; //caso 5
			4'b0110: saidas = 7'b0100000; //caso 6
			4'b0111: saidas = 7'b0001111; //caso 7
			4'b1000: saidas = 7'b0000000; //caso 8
			4'b1001: saidas = 7'b0000100; //caso 9
			default: saidas = 7'b1111111; //caso apagado
			
			endcase
				    
    end
	 

endmodule
