module uc(
	input [5:0] opCode,
	output reg RegDest,
	output reg IOToReg,
	output reg [1:0] OpIO,
	output reg RegWrite,
	output reg ALUSrc,
	output reg [3:0] ALUOp,
	output reg SLT,
	output reg MemtoReg,
	output reg MemWrite,
	output reg MemRead,
	output reg Branch,
	output reg Jump,
	output reg JumpR,
	output reg Hlt,
	output reg Jal);
	
	always @ (opCode)
	begin
	
		case(opCode)
		
			/* ADD */
			6'b000000:
			begin
				
				RegDest = 1;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 0;
				ALUOp = 4'b0000;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* ADDI */
			6'b000001:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 1;
				ALUOp = 4'b0000;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* SUB */
			6'b000010:
			begin
				
				RegDest = 1;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 0;
				ALUOp = 4'b0001;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* SUBI */
			6'b000011:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 1;
				ALUOp = 4'b0001;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* MULT */
			6'b000100:
			begin
				
				RegDest = 1;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 0;
				ALUOp = 4'b0010;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* MULTI */
			6'b000101:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 1;
				ALUOp = 4'b0010;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* DIV */
			6'b000110:
			begin
				
				RegDest = 1;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 0;
				ALUOp = 4'b0011;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* DIVI */
			6'b000111:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 1;
				ALUOp = 4'b0011;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* SLT */
			6'b001000:
			begin
				
				RegDest = 1;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 0;
				ALUOp = 4'b0100;
				SLT = 1;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* AND */
			6'b001001:
			begin
				
				RegDest = 1;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 0;
				ALUOp = 4'b0101;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* ANDI */
			6'b001010:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 1;
				ALUOp = 4'b0101;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* OR */
			6'b001011:
			begin
				
				RegDest = 1;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 0;
				ALUOp = 4'b0110;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* ORI */
			6'b001100:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 1;
				ALUOp = 4'b0110;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* NOT */
			6'b001101:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 0;
				ALUOp = 4'b0111;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* SR */
			6'b001110:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 0;
				ALUOp = 4'b1000;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* SL */
			6'b001111:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 0;
				ALUOp = 4'b1001;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* LOAD */
			6'b010000:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 1; /*AQUI O ERRO*/
				ALUOp = 4'b0000;
				SLT = 0;
				MemtoReg = 1;
				MemWrite = 0;
				MemRead = 1;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* LOADI */
			6'b010001:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 1;
				ALUOp = 4'b1010;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* STORE */
			6'b010010:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 0;
				ALUSrc = 1; /*ACHO QUE O ERRO ESTÁ AQUI*/
				ALUOp = 4'b0000;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 1;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* MOVE */
			6'b010011:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 0;
				ALUOp = 4'b1011;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* J */
			6'b010100:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 0;
				ALUSrc = 0;
				ALUOp = 4'b1111;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 1;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* JR */
			6'b010101:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 0;
				ALUSrc = 0;
				ALUOp = 4'b1111;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 1;
				Hlt = 0;
				Jal = 0;
				
			end
			/* JAL */
			6'b010110:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 1;
				ALUSrc = 0;
				ALUOp = 4'b1111;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 1;
				JumpR = 0;
				Hlt = 0;
				Jal = 1;
				
			end
			/* BEQ */
			6'b010111:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 0;
				ALUSrc = 0;
				ALUOp = 4'b1100;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 1;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* BNE */
			6'b011000:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 0;
				ALUSrc = 0;
				ALUOp = 4'b1101;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 1;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* NOP */
			6'b011001:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 0;
				ALUSrc = 0;
				ALUOp = 4'b1111;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* HLT */
			6'b011010:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 0;
				ALUSrc = 0;
				ALUOp = 4'b1111;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 1;
				Jal = 0;
				
			end
			/* IN */
			6'b011011:
			begin
				
				RegDest = 0;
				IOToReg = 1;
				OpIO = 2'b01;
				RegWrite = 0; //MUDEI
				ALUSrc = 1; //MUDEI
				ALUOp = 4'b0000;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 1;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* OUT */
			6'b011100:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b10;
				RegWrite = 0;
				ALUSrc = 0;
				ALUOp = 4'b1111;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end
			/* OUTROS */
			default:
			begin
				
				RegDest = 0;
				IOToReg = 0;
				OpIO = 2'b00;
				RegWrite = 0;
				ALUSrc = 0;
				ALUOp = 4'b0000;
				SLT = 0;
				MemtoReg = 0;
				MemWrite = 0;
				MemRead = 0;
				Branch = 0;
				Jump = 0;
				JumpR = 0;
				Hlt = 0;
				Jal = 0;
				
			end

		endcase
		
	end

endmodule
