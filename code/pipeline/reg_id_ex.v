module reg_id_ex (
    input wire          clk                     ,
    input wire          rstn                    ,
    input wire          enable                  ,
    input wire [31:0]   id_pc_current           ,
    input wire [31:0]   id_immediate            ,
    input wire          id_alu_din_a_sel        ,
    input wire          id_alu_din_b_sel        ,
    input wire [3:0]    id_alu_func             ,
    input wire [2:0]    id_bu_func              ,
    input wire [2:0]    id_dm_func              ,
    input wire          id_dm_we                ,
    input wire [1:0]    id_rf_din_sel           ,
    input wire          id_rf_we                ,
    input wire [31:0]   id_rf_dout_rs1          ,
    input wire [31:0]   id_rf_dout_rs2          ,
    input wire [4:0]    id_rf_raddr_rs1         ,
    input wire [4:0]    id_rf_raddr_rs2         ,
    input wire [4:0]    id_rf_waddr             ,
    input wire [31:0]   id_pc_next              ,
    input wire [6:0]    id_opcode               ,
    output reg [31:0]   ex_pc_current           ,
    output reg [31:0]   ex_immediate            ,
    output reg          ex_alu_din_a_sel        ,
    output reg          ex_alu_din_b_sel        ,
    output reg [3:0]    ex_alu_func             ,
    output reg [2:0]    ex_bu_func              ,
    output reg [2:0]    ex_dm_func              ,
    output reg          ex_dm_we                ,
    output reg [1:0]    ex_rf_din_sel           ,
    output reg          ex_rf_we                ,
    output reg [31:0]   ex_rf_dout_rs1          ,
    output reg [31:0]   ex_rf_dout_rs2          ,
    output reg [4:0]    ex_rf_raddr_rs1         ,
    output reg [4:0]    ex_rf_raddr_rs2         ,
    output reg [4:0]    ex_rf_waddr             ,
    output reg [31:0]   ex_pc_next              ,
    output reg [6:0]    ex_opcode               
);

    always @(posedge clk) begin
        if (!rstn) begin
            ex_pc_current       <= 32'b0;
            ex_immediate        <= 32'b0;
            ex_alu_din_a_sel    <= 1'b0;
            ex_alu_din_b_sel    <= 1'b0;
            ex_alu_func         <= 4'b0;
            ex_bu_func          <= 3'b0;
            ex_dm_func          <= 3'b0;
            ex_dm_we            <= 1'b0;
            ex_rf_din_sel       <= 2'b0;
            ex_rf_we            <= 1'b0;
            ex_rf_dout_rs1      <= 32'b0;
            ex_rf_dout_rs2      <= 32'b0;
            ex_rf_raddr_rs1     <= 5'b0;
            ex_rf_raddr_rs2     <= 5'b0;
            ex_rf_waddr         <= 5'b0;
            ex_pc_next          <= 32'b0;
            ex_opcode           <= 7'b0;
        end
        else
        if (enable) begin
            ex_pc_current       <= id_pc_current;
            ex_immediate        <= id_immediate;
            ex_alu_din_a_sel    <= id_alu_din_a_sel;
            ex_alu_din_b_sel    <= id_alu_din_b_sel;
            ex_alu_func         <= id_alu_func;
            ex_bu_func          <= id_bu_func;
            ex_dm_func          <= id_dm_func;
            ex_dm_we            <= id_dm_we;
            ex_rf_din_sel       <= id_rf_din_sel;
            ex_rf_we            <= id_rf_we;
            ex_rf_dout_rs1      <= id_rf_dout_rs1;
            ex_rf_dout_rs2      <= id_rf_dout_rs2;
            ex_rf_raddr_rs1     <= id_rf_raddr_rs1;
            ex_rf_raddr_rs2     <= id_rf_raddr_rs2;
            ex_rf_waddr         <= id_rf_waddr;
            ex_pc_next          <= id_pc_next;
            ex_opcode           <= id_opcode;
        end
        else begin
            ex_pc_current       <= ex_pc_current;
            ex_immediate        <= ex_immediate;
            ex_alu_din_a_sel    <= ex_alu_din_a_sel;
            ex_alu_din_b_sel    <= ex_alu_din_b_sel;
            ex_alu_func         <= ex_alu_func;
            ex_bu_func          <= ex_bu_func;
            ex_dm_func          <= ex_dm_func;
            ex_dm_we            <= ex_dm_we;
            ex_rf_din_sel       <= ex_rf_din_sel;
            ex_rf_we            <= ex_rf_we;
            ex_rf_dout_rs1      <= ex_rf_dout_rs1;
            ex_rf_dout_rs2      <= ex_rf_dout_rs2;
            ex_rf_raddr_rs1     <= ex_rf_raddr_rs1;
            ex_rf_raddr_rs2     <= ex_rf_raddr_rs2;
            ex_rf_waddr         <= ex_rf_waddr;
            ex_pc_next          <= ex_pc_next;
            ex_opcode           <= ex_opcode;
        end
    end

endmodule