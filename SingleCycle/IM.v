module IM(addr, dout);
    
    input [4:0] addr;
    input [31:0] dout;
    
    reg [31:0] imem[1023:0];
    
    assign dout = imem[addr];
    
endmodule    
