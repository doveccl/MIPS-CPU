// DEBUG
`define DEBUG 1

// NPC control signal
`define NPC_PLUS4   2'b00
`define NPC_BRANCH  2'b01
`define NPC_JUMP    2'b10   

// EXT control signal
`define EXT_ZERO    2'b00
`define EXT_SIGNED  2'b01
`define EXT_HIGHPOS 2'b10

// ALU control signal
`define ALUOp_NOP   5'b00000 
`define ALUOp_ADDU  5'b00001
`define ALUOp_ADD   5'b00010
`define ALUOp_SUBU  5'b00011
`define ALUOp_SUB   5'b00100 
`define ALUOp_AND   5'b00101
`define ALUOp_OR    5'b00110
`define ALUOp_NOR   5'b00111
`define ALUOp_XOR   5'b01000
`define ALUOp_SLT   5'b01001
`define ALUOp_SLTU  5'b01010 
`define ALUOp_EQL   5'b01011
`define ALUOp_BNE   5'b01100
`define ALUOp_GT0   5'b01101
`define ALUOp_GE0   5'b01110
`define ALUOp_LT0   5'b01111
`define ALUOp_LE0   5'b10000
`define ALUOp_SLL   5'b10001
`define ALUOp_SRL   5'b10010
`define ALUOp_SRA   5'b10011

// GPR control signal
`define GPRSel_RD   2'b00
`define GPRSel_RT   2'b01
`define GPRSel_31   2'b10

`define WDSel_FromALU 2'b00
`define WDSel_FromMEM 2'b01
`define WDSel_FromPC  2'b10 

// Memory control signal
`define BE_SB  2'b00
`define BE_SH  2'b01
`define BE_SW  2'b10

`define ME_LB  3'b000
`define ME_LBU 3'b001
`define ME_LH  3'b010
`define ME_LHU 3'b011
`define ME_LW  3'b100

// OP
`define INSTR_RTYPE_OP      6'b000000

`define INSTR_LB_OP         6'b100000
`define INSTR_LH_OP         6'b100001
`define INSTR_LBU_OP        6'b100100
`define INSTR_LHU_OP        6'b100101
`define INSTR_LW_OP         6'b100011

`define INSTR_SB_OP         6'b101000
`define INSTR_SH_OP         6'b101001
`define INSTR_SW_OP         6'b101011

`define INSTR_ADDI_OP       6'b001000
`define INSTR_ADDIU_OP      6'b001001
`define INSTR_ANDI_OP       6'b001100
`define INSTR_ORI_OP        6'b001101 
`define INSTR_XORI_OP       6'b001110
`define INSTR_LUI_OP        6'b001111
`define INSTR_SLTI_OP       6'b001010
`define INSTR_SLTIU_OP      6'b001011

`define INSTR_BEQ_OP        6'b000100
`define INSTR_BNE_OP        6'b000101
`define INSTR_BGEZ_OP       6'b000001
`define INSTR_BGTZ_OP       6'b000111
`define INSTR_BLEZ_OP       6'b000110
`define INSTR_BLTZ_OP       6'b000001

`define INSTR_J_OP          6'b000010
`define INSTR_JAL_OP        6'b000011

// Funct
`define INSTR_ADD_FUNCT     6'b100000
`define INSTR_ADDU_FUNCT    6'b100001
`define INSTR_SUB_FUNCT     6'b100010
`define INSTR_SUBU_FUNCT    6'b100011
`define INSTR_AND_FUNCT     6'b100100
`define INSTR_NOR_FUNCT     6'b100111
`define INSTR_OR_FUNCT      6'b100101
`define INSTR_XOR_FUNCT     6'b100110
`define INSTR_SLT_FUNCT     6'b101010
`define INSTR_SLTU_FUNCT    6'b101011
`define INSTR_SLL_FUNCT     6'b000000
`define INSTR_SRL_FUNCT     6'b000010
`define INSTR_SRA_FUNCT     6'b000011
`define INSTR_SLLV_FUNCT    6'b000100
`define INSTR_SRLV_FUNCT    6'b000110
`define INSTR_SRAV_FUNCT    6'b000111      
`define INSTR_JR_FUNCT      6'b001000
`define INSTR_JALR_FUNCT    6'b001001     
 
`define INSTR_BGEZ_RT       5'b00001
`define INSTR_BLTZ_RT       5'b00000
