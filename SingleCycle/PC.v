module PC(clk, rst, PCWr, Jump, Jaddr, NPC, PC);

	input rst;
	input clk;
	input Jump;
	input PCWr;

	input [25:0] Jaddr;
	input [31:0] NPC;

	output reg[31:0] PC;

	integer i;
	reg [31:0] temp;
	always@(posedge clk or posedge rst) begin
		if (rst == 1) begin
			PC = 32'h0000_3000;
		end else if (Jump == 1) begin
			for (i = 0; i < 32; i = i + 1)
				PC[i] = 0;
			for (i = 0; i < 24; i = i + 1)
				PC[25 - i] = Jaddr[23 - i];
		end else if (PCWr == 1) begin
			for (i = 0; i < 30; i = i + 1)
				temp[31 - i] = NPC[29 - i];
			temp[0] = 0;
			temp[1] = 0;
			PC = PC + temp + 4;
		end else PC = PC + 4;
	end

endmodule
