// instruction format
`define     R_TYPE                              7'b0110011
`define     I_TYPE                              7'b0010011,7'b0000011,7'b1100111
`define     S_TYPE                              7'b0100011
`define     B_TYPE                              7'b1100011
`define     U_TYPE                              7'b0110111,7'b0010111
`define     J_TYPE                              7'b1101111

// instructions
`define     INST_ADD                            (instruction[6:0]==7'b0110011)&&(instruction[14:12]==3'h0)&&(instruction[31:25]==7'h00)
`define     INST_SUB                            (instruction[6:0]==7'b0110011)&&(instruction[14:12]==3'h0)&&(instruction[31:25]==7'h20)
`define     INST_XOR                            (instruction[6:0]==7'b0110011)&&(instruction[14:12]==3'h4)&&(instruction[31:25]==7'h00)
`define     INST_OR                             (instruction[6:0]==7'b0110011)&&(instruction[14:12]==3'h6)&&(instruction[31:25]==7'h00)
`define     INST_AND                            (instruction[6:0]==7'b0110011)&&(instruction[14:12]==3'h7)&&(instruction[31:25]==7'h00)
`define     INST_SLL                            (instruction[6:0]==7'b0110011)&&(instruction[14:12]==3'h1)&&(instruction[31:25]==7'h00)
`define     INST_SRL                            (instruction[6:0]==7'b0110011)&&(instruction[14:12]==3'h5)&&(instruction[31:25]==7'h00)
`define     INST_SRA                            (instruction[6:0]==7'b0110011)&&(instruction[14:12]==3'h5)&&(instruction[31:25]==7'h20)
`define     INST_SLT                            (instruction[6:0]==7'b0110011)&&(instruction[14:12]==3'h2)&&(instruction[31:25]==7'h00)
`define     INST_SLTU                           (instruction[6:0]==7'b0110011)&&(instruction[14:12]==3'h3)&&(instruction[31:25]==7'h00)

`define     INST_ADDI                           (instruction[6:0]==7'b0010011)&&(instruction[14:12]==3'h0)
`define     INST_XORI                           (instruction[6:0]==7'b0010011)&&(instruction[14:12]==3'h4)
`define     INST_ORI                            (instruction[6:0]==7'b0010011)&&(instruction[14:12]==3'h6)
`define     INST_ANDI                           (instruction[6:0]==7'b0010011)&&(instruction[14:12]==3'h7)
`define     INST_SLLI                           (instruction[6:0]==7'b0010011)&&(instruction[14:12]==3'h1)&&(instruction[31:25]==7'h00)
`define     INST_SRLI                           (instruction[6:0]==7'b0010011)&&(instruction[14:12]==3'h5)&&(instruction[31:25]==7'h00)
`define     INST_SRAI                           (instruction[6:0]==7'b0010011)&&(instruction[14:12]==3'h5)&&(instruction[31:25]==7'h20)
`define     INST_SLTI                           (instruction[6:0]==7'b0010011)&&(instruction[14:12]==3'h2)
`define     INST_SLTUI                          (instruction[6:0]==7'b0010011)&&(instruction[14:12]==3'h3)

`define     INST_LB                             (instruction[6:0]==7'b0000011)&&(instruction[14:12]==3'h0)
`define     INST_LH                             (instruction[6:0]==7'b0000011)&&(instruction[14:12]==3'h1)
`define     INST_LW                             (instruction[6:0]==7'b0000011)&&(instruction[14:12]==3'h2)
`define     INST_LBU                            (instruction[6:0]==7'b0000011)&&(instruction[14:12]==3'h4)
`define     INST_LHU                            (instruction[6:0]==7'b0000011)&&(instruction[14:12]==3'h5)

`define     INST_SB                             (instruction[6:0]==7'b0100011)&&(instruction[14:12]==3'h0)
`define     INST_SH                             (instruction[6:0]==7'b0100011)&&(instruction[14:12]==3'h1)
`define     INST_SW                             (instruction[6:0]==7'b0100011)&&(instruction[14:12]==3'h2)

`define     INST_BEQ                            (instruction[6:0]==7'b1100011)&&(instruction[14:12]==3'h0)
`define     INST_BNE                            (instruction[6:0]==7'b1100011)&&(instruction[14:12]==3'h1)
`define     INST_BLT                            (instruction[6:0]==7'b1100011)&&(instruction[14:12]==3'h4)
`define     INST_BGE                            (instruction[6:0]==7'b1100011)&&(instruction[14:12]==3'h5)
`define     INST_BLTU                           (instruction[6:0]==7'b1100011)&&(instruction[14:12]==3'h6)
`define     INST_BGEU                           (instruction[6:0]==7'b1100011)&&(instruction[14:12]==3'h7)

`define     INST_JAL                            (instruction[6:0]==7'b1101111)
`define     INST_JALR                           (instruction[6:0]==7'b1100111)&&(instruction[14:12]==3'h0)

`define     INST_LUI                            (instruction[6:0]==7'b0110111)
`define     INST_AUIPC                          (instruction[6:0]==7'b0010111)

// component function
`define     ALU_DIN_A_SEL_REGFILE_DOUT_RS1      1'b0
`define     ALU_DIN_A_SEL_PC_CURRENT            1'b1
`define     ALU_DIN_B_SEL_REGFILE_DOUT_RS2      1'b0
`define     ALU_DIN_B_SEL_IMMEDIATE             1'b1
`define     ALU_FUNC_ADD                        4'b0000
`define     ALU_FUNC_SUB                        4'b1000
`define     ALU_FUNC_XOR                        4'b0001
`define     ALU_FUNC_OR                         4'b0010
`define     ALU_FUNC_AND                        4'b0011
`define     ALU_FUNC_SLL                        4'b0100
`define     ALU_FUNC_SRL                        4'b0101
`define     ALU_FUNC_SRA                        4'b1101
`define     ALU_FUNC_SLT                        4'b1110
`define     ALU_FUNC_SLTU                       4'b1111
`define     ALU_FUNC_DINA                       4'b0110
`define     ALU_FUNC_DINB                       4'b0111
`define     BU_FUNC_NOP                         3'b000
`define     BU_FUNC_BEQ                         3'b001
`define     BU_FUNC_BNE                         3'b010
`define     BU_FUNC_BLT                         3'b011
`define     BU_FUNC_BGE                         3'b100
`define     BU_FUNC_BLTU                        3'b101
`define     BU_FUNC_BGEU                        3'b110
`define     BU_FUNC_JMP                         3'b111
`define     DM_FUNC_WORD                        3'b000
`define     DM_FUNC_HALF                        3'b001
`define     DM_FUNC_BYTE                        3'b010
`define     DM_FUNC_HALFU                       3'b101
`define     DM_FUNC_BYTEU                       3'b110
`define     RF_DIN_SEL_DMEM_DOUT                2'b00
`define     RF_DIN_SEL_ALU_DOUT                 2'b01
`define     RF_DIN_SEL_PC_NEXT                  2'b10

module control_unit (
    input wire  [31:0]  instruction,
    output reg  [31:0]  immediate,
    output reg          alu_din_a_sel,
    output reg          alu_din_b_sel,
    output reg  [3:0]   alu_func,
    output reg  [2:0]   bu_func,
    output reg  [2:0]   dm_func,
    output reg          dm_we,
    output reg  [1:0]   rf_din_sel,
    output reg          rf_we,
    output reg  [4:0]   rf_raddr_rs1,
    output reg  [4:0]   rf_raddr_rs2,
    output reg  [4:0]   rf_waddr
);

    always @(*) begin
        rf_raddr_rs1    =   instruction[19:15];
        rf_raddr_rs2    =   instruction[24:20];
        rf_waddr        =   instruction[11:7];

        // immediate
        case (instruction[6:0])
            `R_TYPE: begin
                immediate = 32'b0;
            end
            `I_TYPE: begin
                immediate = {{20{instruction[31]}},instruction[31:20]};
            end
            `S_TYPE: begin
                immediate = {{20{instruction[31]}},instruction[31:25],instruction[11:7]};
            end
            `B_TYPE: begin
                immediate = {{19{instruction[31]}},instruction[31],instruction[7],instruction[30:25],instruction[11:8],1'b0};
            end
            `U_TYPE: begin
                immediate = {instruction[31:12],12'b0};
            end
            `J_TYPE: begin
                immediate = {{11{instruction[31]}},instruction[31],instruction[19:12],instruction[20],instruction[30:21],1'b0};
            end
            default: begin
                immediate = 32'b0;
            end
        endcase

        // inst_aluop_reg
        if (`INST_ADD) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_REGFILE_DOUT_RS2;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_SUB) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_REGFILE_DOUT_RS2;
            alu_func        =   `ALU_FUNC_SUB;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_XOR) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_REGFILE_DOUT_RS2;
            alu_func        =   `ALU_FUNC_XOR;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_OR) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_REGFILE_DOUT_RS2;
            alu_func        =   `ALU_FUNC_OR;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_AND) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_REGFILE_DOUT_RS2;
            alu_func        =   `ALU_FUNC_AND;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_SLL) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_REGFILE_DOUT_RS2;
            alu_func        =   `ALU_FUNC_SLL;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_SRL) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_REGFILE_DOUT_RS2;
            alu_func        =   `ALU_FUNC_SRL;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_SRA) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_REGFILE_DOUT_RS2;
            alu_func        =   `ALU_FUNC_SRA;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_SLT) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_REGFILE_DOUT_RS2;
            alu_func        =   `ALU_FUNC_SLT;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_SLTU) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_REGFILE_DOUT_RS2;
            alu_func        =   `ALU_FUNC_SLTU;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else

        // inst_aluop_imm
        if (`INST_ADDI) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_XORI) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_XOR;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_ORI) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_OR;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_ANDI) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_AND;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_SLLI) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_SLL;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_SRLI) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_SRL;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_SRAI) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_SRA;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_SLTI) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_SLT;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_SLTUI) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_SLTU;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else

        // inst_load
        if (`INST_LB) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_BYTE;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_DMEM_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_LH) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_HALF;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_DMEM_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_LW) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_DMEM_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_LBU) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_BYTEU;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_DMEM_DOUT;
            rf_we           =   1'b1;
        end
        else
        if (`INST_LHU) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_HALFU;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_DMEM_DOUT;
            rf_we           =   1'b1;
        end
        else

        // inst_store
        if (`INST_SB) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_BYTE;
            dm_we           =   1'b1;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b0;
        end
        else
        if (`INST_SH) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_HALF;
            dm_we           =   1'b1;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b0;
        end
        else
        if (`INST_SW) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b1;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b0;
        end
        else

        // inst_branch
        if (`INST_BEQ) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_PC_CURRENT;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_BEQ;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b0;
        end
        else
        if (`INST_BNE) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_PC_CURRENT;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_BNE;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b0;
        end
        else
        if (`INST_BLT) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_PC_CURRENT;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_BLT;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b0;
        end
        else
        if (`INST_BGE) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_PC_CURRENT;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_BGE;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b0;
        end
        else
        if (`INST_BLTU) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_PC_CURRENT;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_BLTU;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b0;
        end
        else
        if (`INST_BGEU) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_PC_CURRENT;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_BGEU;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b0;
        end
        else

        // inst_jal
        if (`INST_JAL) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_PC_CURRENT;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_JMP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_PC_NEXT;
            rf_we           =   1'b1;
        end
        else

        // inst_jalr
        if (`INST_JALR) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_JMP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_PC_NEXT;
            rf_we           =   1'b1;
        end
        else

        // inst_lui
        if (`INST_LUI) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_DINB;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else

        // inst_auipc
        if (`INST_AUIPC) begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_PC_CURRENT;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_IMMEDIATE;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b1;
        end
        else

        // default
        begin
            alu_din_a_sel   =   `ALU_DIN_A_SEL_REGFILE_DOUT_RS1;
            alu_din_b_sel   =   `ALU_DIN_B_SEL_REGFILE_DOUT_RS2;
            alu_func        =   `ALU_FUNC_ADD;
            bu_func         =   `BU_FUNC_NOP;
            dm_func         =   `DM_FUNC_WORD;
            dm_we           =   1'b0;
            rf_din_sel      =   `RF_DIN_SEL_ALU_DOUT;
            rf_we           =   1'b0;
        end
    end

endmodule