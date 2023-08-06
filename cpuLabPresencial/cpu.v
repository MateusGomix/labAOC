module cpu
#(
	parameter DATA_WIDTH=32, 
	parameter ADDR_WIDTH=10, 
	parameter A = 16'b0000000000000000, 
	parameter B = 6'b000000
)	
	(
	input clock50,								// Clock da placa
	input [17:0] entrada, 					// Switches
	input inserir, 							// Botão da entrada
	output [DATA_WIDTH - 1:0] dado3s, 	// Saída do banco
	output [DATA_WIDTH - 1:0] instAtual, //comentar
	//output [4:0] endRS,
	//output [4:0] endRT, //comentar
	output [4:0] endRD,
	output [DATA_WIDTH - 1:0] dado3e,	// Saída da ULA //comentar
	//output waitIo, 							// Sinal de espera por entrada
	output ck,
	//output inserirDeb,
	output [27:0] displaysSeg,				// Ler abaixo sobre os displays
	output [27:0] displaysSegPC,
	output wire [DATA_WIDTH - 1:0] entradaDados, //comentar
	output wire [DATA_WIDTH - 1:0] saidaDados, //comentar
	output wire mw,  //comentar
	output wire wr, //comentar
	output wire [DATA_WIDTH - 1:0] dado2,  //comentar
	output wire [DATA_WIDTH - 1:0] escritaBanco
	);
	
	/*  */
	
	/* Os displays de 7 segmentos estão pinados em apenas
	 * um array, os bits [6:0] representam o HEX0,
	 * [13:7] representa o HEX1 e assim por diante,
	 * os pinos devem ser preenchidos da seguinte maneira:
	 * HEX#: a (msb), b, c, d, e, f, g (lsb)
	 * onde a-g são os segmentos de cada display*/
	
	/* Essas linhas podem ser removidas da saída */
	//wire [DATA_WIDTH - 1:0] dado3s;
	//wire [DATA_WIDTH - 1:0] instAtual;
	wire [4:0] endRS;
	wire [4:0] endRT; 
	//wire [4:0] endRD;
	//wire [DATA_WIDTH - 1:0] dado3e;
	wire waitIo;
	
	/* Botão com debounce */
	wire inserirDeb;
	
	/* Clock atrasado */
	//wire ck;
	
	/* Saidas do banco de registradores */ 
	wire [DATA_WIDTH - 1:0] dado1;
	//wire [DATA_WIDTH - 1:0] dado2;
	 
	
	/* Saidas da UC */
	wire rd;
	wire iom;
	wire [1:0] opio;
	//wire wr;
	wire alus;
	wire [3:0] aluop;
	wire slt;
	wire mr;
	//wire mw;
	wire mre; //Esse sinal não está mais sendo usado
	wire bUc;
	wire j;
	wire jr;
	wire h;
	wire jal;
	
	/* Saida branch da ULA */
	wire bUla;
	
	/* Segunda entrada da ALU, 
	 * pode vir do banco ou da instrucao 
	 */
	wire [DATA_WIDTH - 1:0] entradaAlu2;
	
	/* Valor a ser escrito no banco, 
	 * pode vir da memoria, da ula, 
	 * do modulo de entrada e saida, ou do pc 
	 */
	//wire [DATA_WIDTH - 1:0] escritaBanco;
	
	//Saida da memoria de dados 
	//wire [DATA_WIDTH - 1:0] saidaDados;
	
	/* Entrada da memoria de dados, 
	 * pode vir do banco de registradores 
	 * ou da propria instrucao 
	 */
	//wire [DATA_WIDTH - 1:0] entradaDados;
	
	/* Registrador do pc atual e seguinte, 
	 * o pc pode ser atualizado normalmente 
	 * (incremento) ou por jumps, branches e halts 
	 */
	wire [2**ADDR_WIDTH - 1:0] pcAtual;
	wire [2**ADDR_WIDTH - 1:0] pcSeguinte;
	
	/* Leitura e flag do modulo de entrada e saida */
	wire [DATA_WIDTH - 1:0] leitura;
	//wire waitIo;
	
	/* Endereço de RT e RS */
	assign endRS = instAtual[25:21];
	assign endRT = instAtual[20:16];
	
	/* Divisor de frequencia */
	freqReducer freq(
		.entrada(clock50),
		.saida(ck),
		.halt(h));
	
	/* Debounce pro botão de inserção */
	debouncer deb(
		.entrada(~inserir),
		.clk(ck),
		.saida(inserirDeb));
		
	
	/* MUX de 5 bits para selecionar RD */
	mux5b mux1e2(
		.entrada1(instAtual[15:11]),
		.entrada2(5'b11111),
		.entrada3(instAtual[20:16]),
		.saida(endRD),
		.selecao1(rd),
		.selecao2(jal));
		
	/* MUX de 32 bits para selecionar 
	 * a segunda entrada da ULA 
	 */
	mux32b mux3(
		.entrada1({A,instAtual[15:0]}),
		.entrada2(dado2),
		.saida(entradaAlu2),
		.selecao(alus));
	
	/* MUX de 32 bits para selecionar 
	 * o dado de escrito do banco 
	 */
	mux32b3e mux4e5(
		.entrada1(saidaDados),
		.entrada2(pcAtual),
		.entrada3(dado3e),
		.saida(escritaBanco),
		.selecao1(mr),
		.selecao2(jal));
	
	/* Modulo da memoria de instrucoes */
	single_port_rom instrucoes(
		.addr(pcAtual),
		.clk(ck),
		.q(instAtual));
	
	/* Modulo da UC */
	uc ucAtual(
		.opCode(instAtual[31:26]),
		.RegDest(rd),
		.IOToReg(iom),
		.OpIO(opio),
		.RegWrite(wr),
		.ALUSrc(alus),
		.ALUOp(aluop),
		.SLT(slt),
		.MemtoReg(mr),
		.MemWrite(mw),
		.MemRead(mre),
		.Branch(bUc),
		.Jump(j),
		.JumpR(jr),
		.Hlt(h),
		.Jal(jal));
	
	/* Modulo do banco de registradores */
	bancoRegs banco(
		.endLeitura1(endRS), 
		.endLeitura2(endRT), 
		.endEscrita(endRD), 
		.dadoLeitura1(dado1), 
		.dadoLeitura2(dado2), 
		.dadoEscrita(escritaBanco), 
		.clock(ck),
		.writeReg(wr), 
		.dadoEscritaReg(dado3s));
	
	/* Modulo da ULA */
	alu ula(
		.eAlu1(dado1), 
		.eAlu2(entradaAlu2),
		.opAlu(aluop),  
		.clock(ck),
		.sAlu(dado3e),
		.branch(bUla));
		
	/* Modulo de entrada e saida */
	ioModule moduloIo(
		.switches(entrada), 
		.dataDisp(dado2),
		.button(~inserir),  // usar inserirDeb em clock rapido e ~inserir em clock devagar, consultar o arquivo de reducao de frequencia
		.opIo(opio),
		.sIo(leitura),
		.waitFlag(waitIo),
		.displays(displaysSeg));
	
	/* Mux de 32 bits para selecionar 
	 * a entrada da memoria de dados
	 */
	 mux32b mux9(
		.entrada1(leitura),
		.entrada2(dado2),
		.saida(entradaDados),
		.selecao(iom));
	
	/* Modulo da memoria de dados */
	single_port_ram dados(
		.data(entradaDados),
		.addr(dado3e),
		.we(mw),
		.clk(~ck),
		.q(saidaDados));
	
	/* MUX de 32 bits para selecionar 
	 * o endereco da proxima instrucao 
	 */
	mux32b3e5s mux6e7e8(
		.entrada1({B,instAtual[25:0]}),
		.entrada2(dado2),
		.entrada3(pcAtual),
		.saida(pcSeguinte),
		.selecao1(j),
		.selecao2(jr),
		.selecao3(bUc),
		.selecao4(bUla),
		.selecao5(h),
		.selecao6(waitIo));
	
	/* Modulo do PC */
	pc pcMod(
		.atual(pcAtual),
		.proximo(pcSeguinte), 
		.clock(ck));
		
	pcCounter pcContador(
		.entrada(pcAtual),
		.displays(displaysSegPC));
	
endmodule
