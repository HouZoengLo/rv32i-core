module reg_ex_mem (
    input wire          clk                         ,
    input wire          rstn                        ,
    input wire          enable                      ,
    input wire [31:0]   ex_alu_dout                 ,
    input wire [31:0]   ex_mux_out_rf_dout_rs2      ,
    input wire [2:0]    ex_dm_func                  ,
    input wire          ex_dm_we                    ,
    input wire [1:0]    ex_rf_din_sel               ,
    input wire          ex_rf_we                    ,
    input wire [4:0]    ex_rf_waddr                 ,
    input wire [31:0]   ex_pc_next                  ,
    output reg [31:0]   mem_alu_dout                ,
    output reg [31:0]   mem_mux_out_rf_dout_rs2     ,
    output reg [2:0]    mem_dm_func                 ,
    output reg          mem_dm_we                   ,
    output reg [1:0]    mem_rf_din_sel              ,
    output reg          mem_rf_we                   ,
    output reg [4:0]    mem_rf_waddr                ,
    output reg [31:0]   mem_pc_next                 
);

    always @(posedge clk) begin
        if (!rstn) begin
            mem_alu_dout            <= 32'b0;
            mem_mux_out_rf_dout_rs2 <= 32'b0;
            mem_dm_func             <= 3'b0;
            mem_dm_we               <= 1'b0;
            mem_rf_din_sel          <= 2'b0;
            mem_rf_we               <= 1'b0;
            mem_rf_waddr            <= 5'b0;
            mem_pc_next             <= 32'b0;
        end
        else
        if (enable) begin
            mem_alu_dout            <= ex_alu_dout;
            mem_mux_out_rf_dout_rs2 <= ex_mux_out_rf_dout_rs2;
            mem_dm_func             <= ex_dm_func;
            mem_dm_we               <= ex_dm_we;
            mem_rf_din_sel          <= ex_rf_din_sel;
            mem_rf_we               <= ex_rf_we;
            mem_rf_waddr            <= ex_rf_waddr;
            mem_pc_next             <= ex_pc_next;
        end
        else begin
            mem_alu_dout            <= mem_alu_dout;
            mem_mux_out_rf_dout_rs2 <= mem_mux_out_rf_dout_rs2;
            mem_dm_func             <= mem_dm_func;
            mem_dm_we               <= mem_dm_we;
            mem_rf_din_sel          <= mem_rf_din_sel;
            mem_rf_we               <= mem_rf_we;
            mem_rf_waddr            <= mem_rf_waddr;
            mem_pc_next             <= mem_pc_next;
        end
    end

endmodule