module Ctrl(jump, RegDst, Branch, MemR, Mem2R,
	MemW, RegW, Alusrc, ExtOp, Aluctrl, OpCode, funct);

	input [5:0] OpCode;				//指令操作码字段
	input [5:0] funct;				//指令功能字段

	output reg jump;						//指令跳转
	output reg RegDst;						
	output reg Branch;						//分支
	output reg MemR;						//读存储器
	output reg Mem2R;						//数据存储器到寄存器堆
	output reg MemW;						//写数据存储器
	output reg RegW;						//寄存器堆写入数据
	output reg Alusrc;						//运算器操作数选择
	output reg[1:0] ExtOp;					//位扩展/符号扩展选择
	output reg[1:0] Aluctrl;				//Alu运算选择

	always @(*) begin
		if (OpCode == 6'b000000 && funct == 6'b100001) begin //addu
			jump = 1;
			RegDst = 0;
			Branch = 0;
			MemR = 0;
			Mem2R = 0;
			MemW = 0;
			RegW = 1;
			Alusrc = 0;
			ExtOp = 2'b00;
			Aluctrl = 2'b00;
		end
		if (OpCode == 6'b000000 && funct == 6'b100011) begin //subu
			jump = 1;
			RegDst = 0;
			Branch = 0;
			MemR = 0;
			Mem2R = 0;
			MemW = 0;
			RegW = 1;
			Alusrc = 0;
			ExtOp = 2'b00;
			Aluctrl = 2'b01;
		end
		if (OpCode == 6'b001101) begin //ori
			jump = 1;
			RegDst = 1;
			Branch = 0;
			MemR = 0;
			Mem2R = 0;
			MemW = 0;
			RegW = 1;
			Alusrc = 1;
			ExtOp = 2'b01;
			Aluctrl = 2'b10;
		end
		if (OpCode == 6'b100011) begin //lw
			jump = 1;
			RegDst = 1;
			Branch = 0;
			MemR = 1;
			Mem2R = 1;
			MemW = 0;
			RegW = 1;
			Alusrc = 1;
			ExtOp = 2'b00;
			Aluctrl = 2'b00;
		end
		if (OpCode == 6'b101011) begin //sw
			jump = 1;
			RegDst = 1;
			Branch = 0;
			MemR = 0;
			Mem2R = 0;
			MemW = 1;
			RegW = 0;
			Alusrc = 1;
			ExtOp = 2'b00;
			Aluctrl = 2'b00;
		end
		if (OpCode == 6'b000100) begin //beq
			jump = 1;
			RegDst = 0;
			Branch = 1;
			MemR = 0;
			Mem2R = 0;
			MemW = 0;
			RegW = 0;
			Alusrc = 0;
			ExtOp = 2'b00;
			Aluctrl = 2'b01;
		end
		if (OpCode == 6'b000010) begin //j
			jump = 1;
			RegDst = 0;
			Branch = 0;
			MemR = 0;
			Mem2R = 0;
			MemW = 0;
			RegW = 1;
			Alusrc = 1;
			ExtOp = 2'b00;
			Aluctrl = 2'b00;
		end
		if (OpCode == 6'b001111) begin //lui
			jump = 1;
			RegDst = 1;
			Branch = 0;
			MemR = 0;
			Mem2R = 0;
			MemW = 0;
			RegW = 1;
			Alusrc = 1;
			ExtOp = 2'b10;
			Aluctrl = 2'b10;
		end
	end

endmodule
