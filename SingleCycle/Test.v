module Test();

	reg clk, rst;

	MIPS U_MIPS(
		.clk(clk), .rst(rst)
	);

	initial begin
		$readmemh("code.txt" , U_MIPS.U_IM.imem) ;
		$monitor("PC = 0x%8X, IR = 0x%8X", U_MIPS.U_PC.PC, U_MIPS.opCode); 
		clk = 1; rst = 0;
		rst = #5 1;
		rst = #20 0;
	end

	always begin
		#(50) clk = ~clk;
	end

endmodule
