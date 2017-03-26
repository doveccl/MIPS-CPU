module MIPS( clk, rst );

//Ctrl
	input	clk;	//时钟信号
	input	rst;	//复位信号

//PC
	wire [31:0]	pcOut;
	wire		pcJump;
	wire [25:0] pcJaddr;

//IM
	wire [4:0]	imAdr;
	wire [31:0]	opCode;

//RF
	wire [4:0]	gprWeSel, gprReSel1, gprReSel2;
	wire [31:0]	gprDataIn, gprDataOut1, gprDataOut2;
	
//EXT
	wire [15:0]	extDataIn;
	wire [31:0]	extDataOut;
	
//DM
	wire [9:0]	dmDataAdr;
	wire [31:0]	dmDataOut;

//CTRL
	wire [5:0]	op;
	wire [5:0]	funct;
	wire		jump;		//指令跳转
	wire		RegDst;
	wire		Branch;		//分支
	wire		MemR;		//读存储器
	wire		Mem2R;		//数据存储器到寄存器堆
	wire		MemW;		//写数据存储器
	wire		RegW;		//寄存器堆写入数据
	wire		Alusrc;		//运算器操作数选择
	wire [1:0]	ExtOp;		//位扩展/符号扩展选择
	wire [1:0]	Aluctrl;	//Alu运算选择

//ALU
	wire [31:0] aluDataIn2;
	wire [31:0]	aluDataOut;
	wire 		zero;

//PC 实例化
	assign pcSel = (((Branch && zero) || pcJump) == 1) ? 1 : 0;
	assign pcJaddr = opCode[25:0];
	assign pcJump = (op == 6'b000010) ? 1 : 0; //jump
    PC U_PC(.clk(clk), .rst(rst), .PCWr(pcSel), .Jump(pcJump),
			.Jaddr(pcJaddr), .NPC(extDataOut), .PC(pcOut));

//IM 实例化
	assign imAdr = pcOut[6:2];
	IM U_IM(.dout(opCode), .addr(imAdr));

//RF 实例化
	assign op = opCode[31:26];
	assign funct = opCode[5:0];
	assign gprReSel1 = opCode[25:21];
	assign gprReSel2 = opCode[20:16];

	assign gprWeSel = (RegDst == 1) ? opCode[20:16] : opCode[15:11];
	assign extDataIn = opCode[15:0];

	RF U_RF(.clk(clk), .RD1(gprDataOut1), .RD2(gprDataOut2),
			.A3(gprWeSel), .A1(gprReSel1), .A2(gprReSel2),
			.WD(gprDataIn), .RFWr(RegW));

//CRTL 实例化	
	Ctrl U_Ctrl(.jump(jump), .RegDst(RegDst), .Branch(Branch),
				.MemR(MemR), .Mem2R(Mem2R), .MemW(MemW), .RegW(RegW),
				.Alusrc(Alusrc), .ExtOp(ExtOp), .Aluctrl(Aluctrl),
				.OpCode(op), .funct(funct));

//EXT 实例化
	Ext U_Ext(.Imm32(extDataOut), .Imm16(extDataIn), .EXTOp(ExtOp));

//ALU 实例化
	assign aluDataIn2 = (Alusrc == 1) ? extDataOut : gprDataOut2;
	ALU U_ALU(.A(gprDataOut1), .B(aluDataIn2), .C(aluDataOut),
			.Zero(zero), .ALUOp(Aluctrl));	

//DM 实例化
	assign gprDataIn = (Mem2R == 1) ? dmDataOut : aluDataOut;
	assign dmDataAdr = aluDataOut[11:2];

	DM U_DM(.clk(clk), .addr(dmDataAdr), .dout(dmDataOut),
			.din(gprDataOut2), .DMWr(MemW));

endmodule
