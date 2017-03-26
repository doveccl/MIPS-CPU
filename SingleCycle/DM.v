`include "Define.v"

module DM(addr, din, DMWr, clk, dout);

	input DMWr;
	input clk;

	input [9:0] addr;
	input [31:0] din;

	output [31:0] dout;

	reg [31:0] dmem[1023:0];

	always @(posedge clk) begin
		if (DMWr)
			dmem[addr] <= din;
		`ifdef DEBUG
			$display("addr=%8X", addr); //addr to DM
			$display("din=%8X", din); //data to DM
			$display("Mem[00-07]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X",
					dmem[0], dmem[1], dmem[2], dmem[3],
					dmem[4], dmem[5], dmem[6], dmem[7]);
		`endif
	end

	assign dout = dmem[addr];

endmodule
