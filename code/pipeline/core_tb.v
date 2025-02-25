`timescale 1ns/1ns

module core_tb();

reg clk;
reg rstn;

wire            pc_enable;
wire            if_id_enable;
wire            if_id_rstn;
wire            id_ex_enable;
wire            id_ex_rstn;
wire [1:0]      ex_rf_dout_rs1_sel;
wire [1:0]      ex_rf_dout_rs2_sel;
wire            ex_mem_enable;
wire            ex_mem_rstn;
wire            mem_wb_enable;
wire            mem_wb_rstn;
wire [31:0]     if_pc_current;
wire [31:0]     if_im_inst;
wire [31:0]     if_pc_next;
wire [31:0]     id_pc_current;
wire [31:0]     id_im_inst;
wire [31:0]     id_pc_next;
wire [31:0]     id_immediate;
wire            id_alu_din_a_sel;
wire            id_alu_din_b_sel;
wire [3:0]      id_alu_func;
wire [2:0]      id_bu_func;
wire [2:0]      id_dm_func;
wire            id_dm_we;
wire [1:0]      id_rf_din_sel;
wire            id_rf_we;
wire [4:0]      id_rf_raddr_rs1;
wire [4:0]      id_rf_raddr_rs2;
wire [4:0]      id_rf_waddr;
wire [31:0]     id_rf_dout_rs1;
wire [31:0]     id_rf_dout_rs2;
wire [31:0]     ex_pc_current;
wire [31:0]     ex_immediate;
wire            ex_alu_din_a_sel;
wire            ex_alu_din_b_sel;
wire [3:0]      ex_alu_func;
wire [2:0]      ex_bu_func;
wire [2:0]      ex_dm_func;
wire            ex_dm_we;
wire [1:0]      ex_rf_din_sel;
wire            ex_rf_we;
wire [31:0]     ex_rf_dout_rs1;
wire [31:0]     ex_rf_dout_rs2;
wire [4:0]      ex_rf_raddr_rs1;
wire [4:0]      ex_rf_raddr_rs2;
wire [4:0]      ex_rf_waddr;
wire [31:0]     ex_pc_next;
wire [6:0]      ex_opcode;
wire [31:0]     ex_mux_out_rf_dout_rs1;
wire [31:0]     ex_mux_out_rf_dout_rs2;
wire [31:0]     ex_mux_to_alu_din_a;
wire [31:0]     ex_mux_to_alu_din_b;
wire [31:0]     ex_alu_dout;
wire            ex_bu_branch;
wire [31:0]     mem_alu_dout;
wire [31:0]     mem_mux_out_rf_dout_rs2;
wire [2:0]      mem_dm_func;
wire            mem_dm_we;
wire [1:0]      mem_rf_din_sel;
wire            mem_rf_we;
wire [4:0]      mem_rf_waddr;
wire [31:0]     mem_pc_next;
wire [31:0]     mem_dm_dout;
wire [1:0]      wb_rf_din_sel;
wire [31:0]     wb_dm_dout;
wire [31:0]     wb_alu_dout;
wire [31:0]     wb_pc_next;
wire            wb_rf_we;
wire [4:0]      wb_rf_waddr;
wire [31:0]     wb_mux_to_rf_din;

core core_tb (
    .clk(clk),
    .rstn(rstn),
    .tb_pc_enable(pc_enable),
    .tb_if_id_enable(if_id_enable),
    .tb_if_id_rstn(if_id_rstn),
    .tb_id_ex_enable(id_ex_enable),
    .tb_id_ex_rstn(id_ex_rstn),
    .tb_ex_rf_dout_rs1_sel(ex_rf_dout_rs1_sel),
    .tb_ex_rf_dout_rs2_sel(ex_rf_dout_rs2_sel),
    .tb_ex_mem_enable(ex_mem_enable),
    .tb_ex_mem_rstn(ex_mem_rstn),
    .tb_mem_wb_enable(mem_wb_enable),
    .tb_mem_wb_rstn(mem_wb_rstn),
    .tb_if_pc_current(if_pc_current),
    .tb_if_im_inst(if_im_inst),
    .tb_if_pc_next(if_pc_next),
    .tb_id_pc_current(id_pc_current),
    .tb_id_im_inst(id_im_inst),
    .tb_id_pc_next(id_pc_next),
    .tb_id_immediate(id_immediate),
    .tb_id_alu_din_a_sel(id_alu_din_a_sel),
    .tb_id_alu_din_b_sel(id_alu_din_b_sel),
    .tb_id_alu_func(id_alu_func),
    .tb_id_bu_func(id_bu_func),
    .tb_id_dm_func(id_dm_func),
    .tb_id_dm_we(id_dm_we),
    .tb_id_rf_din_sel(id_rf_din_sel),
    .tb_id_rf_we(id_rf_we),
    .tb_id_rf_raddr_rs1(id_rf_raddr_rs1),
    .tb_id_rf_raddr_rs2(id_rf_raddr_rs2),
    .tb_id_rf_waddr(id_rf_waddr),
    .tb_id_rf_dout_rs1(id_rf_dout_rs1),
    .tb_id_rf_dout_rs2(id_rf_dout_rs2),
    .tb_ex_pc_current(ex_pc_current),
    .tb_ex_immediate(ex_immediate),
    .tb_ex_alu_din_a_sel(ex_alu_din_a_sel),
    .tb_ex_alu_din_b_sel(ex_alu_din_b_sel),
    .tb_ex_alu_func(ex_alu_func),
    .tb_ex_bu_func(ex_bu_func),
    .tb_ex_dm_func(ex_dm_func),
    .tb_ex_dm_we(ex_dm_we),
    .tb_ex_rf_din_sel(ex_rf_din_sel),
    .tb_ex_rf_we(ex_rf_we),
    .tb_ex_rf_dout_rs1(ex_rf_dout_rs1),
    .tb_ex_rf_dout_rs2(ex_rf_dout_rs2),
    .tb_ex_rf_raddr_rs1(ex_rf_raddr_rs1),
    .tb_ex_rf_raddr_rs2(ex_rf_raddr_rs2),
    .tb_ex_rf_waddr(ex_rf_waddr),
    .tb_ex_pc_next(ex_pc_next),
    .tb_ex_opcode(ex_opcode),
    .tb_ex_mux_out_rf_dout_rs1(ex_mux_out_rf_dout_rs1),
    .tb_ex_mux_out_rf_dout_rs2(ex_mux_out_rf_dout_rs2),
    .tb_ex_mux_to_alu_din_a(ex_mux_to_alu_din_a),
    .tb_ex_mux_to_alu_din_b(ex_mux_to_alu_din_b),
    .tb_ex_alu_dout(ex_alu_dout),
    .tb_ex_bu_branch(ex_bu_branch),
    .tb_mem_alu_dout(mem_alu_dout),
    .tb_mem_mux_out_rf_dout_rs2(mem_mux_out_rf_dout_rs2),
    .tb_mem_dm_func(mem_dm_func),
    .tb_mem_dm_we(mem_dm_we),
    .tb_mem_rf_din_sel(mem_rf_din_sel),
    .tb_mem_rf_we(mem_rf_we),
    .tb_mem_rf_waddr(mem_rf_waddr),
    .tb_mem_pc_next(mem_pc_next),
    .tb_mem_dm_dout(mem_dm_dout),
    .tb_wb_rf_din_sel(wb_rf_din_sel),
    .tb_wb_dm_dout(wb_dm_dout),
    .tb_wb_alu_dout(wb_alu_dout),
    .tb_wb_pc_next(wb_pc_next),
    .tb_wb_rf_we(wb_rf_we),
    .tb_wb_rf_waddr(wb_rf_waddr),
    .tb_wb_mux_to_rf_din(wb_mux_to_rf_din)
);

initial begin
    clk <= 1'b0;
    rstn <= 1'b0;
    #6 rstn <= 1'b1;
end

always begin
    #5 clk <= ~clk;
end

endmodule