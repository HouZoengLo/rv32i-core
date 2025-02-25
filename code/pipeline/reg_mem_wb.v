module reg_mem_wb (
    input wire          clk                 ,
    input wire          rstn                ,
    input wire          enable              ,
    input wire [1:0]    mem_rf_din_sel      ,
    input wire [31:0]   mem_dm_dout         ,
    input wire [31:0]   mem_alu_dout        ,
    input wire [31:0]   mem_pc_next         ,
    input wire          mem_rf_we           ,
    input wire [4:0]    mem_rf_waddr        ,
    output reg [1:0]    wb_rf_din_sel       ,
    output reg [31:0]   wb_dm_dout          ,
    output reg [31:0]   wb_alu_dout         ,
    output reg [31:0]   wb_pc_next          ,
    output reg          wb_rf_we            ,
    output reg [4:0]    wb_rf_waddr         
);

    always @(posedge clk) begin
        if (!rstn) begin
            wb_rf_din_sel <= 2'b0;
            wb_dm_dout    <= 32'b0;
            wb_alu_dout   <= 32'b0;
            wb_pc_next    <= 32'b0;
            wb_rf_we      <= 1'b0;
            wb_rf_waddr   <= 5'b0;
        end
        else
        if (enable) begin
            wb_rf_din_sel <= mem_rf_din_sel;
            wb_dm_dout    <= mem_dm_dout;
            wb_alu_dout   <= mem_alu_dout;
            wb_pc_next    <= mem_pc_next;
            wb_rf_we      <= mem_rf_we;
            wb_rf_waddr   <= mem_rf_waddr;
        end
        else begin
            wb_rf_din_sel <= wb_rf_din_sel;
            wb_dm_dout    <= wb_dm_dout;
            wb_alu_dout   <= wb_alu_dout;
            wb_pc_next    <= wb_pc_next;
            wb_rf_we      <= wb_rf_we;
            wb_rf_waddr   <= wb_rf_waddr;
        end
    end

endmodule