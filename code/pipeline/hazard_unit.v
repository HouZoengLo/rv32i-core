`define     EX_RF_DOUT_SEL_EX       2'b00
`define     EX_RF_DOUT_SEL_MEM      2'b01
`define     EX_RF_DOUT_SEL_WB       2'b10

module hazard_unit (
    input wire [4:0]    id_rf_raddr_rs1         ,
    input wire [4:0]    id_rf_raddr_rs2         ,
    input wire [6:0]    ex_opcode               ,
    input wire [4:0]    ex_rf_raddr_rs1         ,
    input wire [4:0]    ex_rf_raddr_rs2         ,
    input wire [4:0]    ex_rf_waddr             ,
    input wire          ex_bu_branch            ,
    input wire          mem_rf_we               ,
    input wire [4:0]    mem_rf_waddr            ,
    input wire          wb_rf_we                ,
    input wire [4:0]    wb_rf_waddr             ,
    output reg          pc_enable               ,
    output reg          if_id_enable            ,
    output reg          if_id_rstn              ,
    output reg          id_ex_enable            ,
    output reg          id_ex_rstn              ,
    output reg [1:0]    ex_rf_dout_rs1_sel      ,
    output reg [1:0]    ex_rf_dout_rs2_sel      ,
    output reg          ex_mem_enable           ,
    output reg          ex_mem_rstn             ,
    output reg          mem_wb_enable           ,
    output reg          mem_wb_rstn             
);

    reg load_use_hazard;

    always @(*) begin
        load_use_hazard = ex_opcode==7'b0000011 && ex_rf_waddr!=5'b0 && (ex_rf_waddr==id_rf_raddr_rs1 || ex_rf_waddr==id_rf_raddr_rs2);
        mem_wb_enable   = 1'b1;
        mem_wb_rstn     = 1'b1;
        ex_mem_enable   = 1'b1;
        ex_mem_rstn     = 1'b1;

        // rs1 data hazard, forward data from MEM/WB stage
        if ((mem_rf_we) && (mem_rf_waddr!=5'b0) && (mem_rf_waddr==ex_rf_raddr_rs1)) begin
            ex_rf_dout_rs1_sel = `EX_RF_DOUT_SEL_MEM;
        end
        else
        if ((wb_rf_we) && (wb_rf_waddr!=5'b0) && (wb_rf_waddr==ex_rf_raddr_rs1)) begin
            ex_rf_dout_rs1_sel = `EX_RF_DOUT_SEL_WB;
        end
        else begin
            ex_rf_dout_rs1_sel = `EX_RF_DOUT_SEL_EX;
        end

        // rs2 data hazard, forward data from MEM/WB stage
        if ((mem_rf_we) && (mem_rf_waddr!=5'b0) && (mem_rf_waddr==ex_rf_raddr_rs2)) begin
            ex_rf_dout_rs2_sel = `EX_RF_DOUT_SEL_MEM;
        end
        else
        if ((wb_rf_we) && (wb_rf_waddr!=5'b0) && (wb_rf_waddr==ex_rf_raddr_rs2)) begin
            ex_rf_dout_rs2_sel = `EX_RF_DOUT_SEL_WB;
        end
        else begin
            ex_rf_dout_rs2_sel = `EX_RF_DOUT_SEL_EX;
        end

        id_ex_enable    = 1'b1;
        id_ex_rstn      = (ex_bu_branch || load_use_hazard)? 1'b0:1'b1;

        pc_enable       = load_use_hazard? 1'b0:1'b1;
        if_id_enable    = load_use_hazard? 1'b0:1'b1;
        if_id_rstn      = ex_bu_branch? 1'b0:1'b1;
    end

endmodule