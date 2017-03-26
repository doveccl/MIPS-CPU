`include "Define.v"

module ALU(A, B, ALUOp, C, Zero);

   input [31:0]     A, B;
   input [1:0]      ALUOp;
   output reg[31:0] C;
   output reg       Zero;

   initial
   begin
      Zero = 0;
      C = 0;
   end

   always @( A or B or ALUOp ) begin
      case ( ALUOp )
         2'b00: C = A + B;
         2'b01: C = A - B;
         2'b10: C = A | B;
         default:   ;
      endcase
      Zero = (C == 0) ? 1 : 0;
   end

endmodule
