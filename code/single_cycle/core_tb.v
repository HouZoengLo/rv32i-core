`timescale 1ns/1ns

module core_tb();

reg clk;
reg rstn;

wire                alu_din_a_sel;
wire                alu_din_b_sel;
wire    [3:0]       alu_func;
wire    [31:0]      alu_dout;
wire    [2:0]       bu_func;
wire                bu_branch;
wire    [2:0]       dm_func;
wire                dm_we;
wire    [31:0]      dm_dout;
wire    [31:0]      im_inst;
wire    [31:0]      immediate;
wire    [31:0]      mux_to_alu_din_a;
wire    [31:0]      mux_to_alu_din_b;
wire    [31:0]      mux_to_rf_din;
wire    [31:0]      pc_current;
wire    [31:0]      pc_next;
wire    [1:0]       rf_din_sel;
wire                rf_we;
wire    [4:0]       rf_raddr_rs1;
wire    [4:0]       rf_raddr_rs2;
wire    [4:0]       rf_waddr;
wire    [31:0]      rf_dout_rs1;
wire    [31:0]      rf_dout_rs2;

core core_tb (
    .clk(clk),
    .rstn(rstn),
    .tb_alu_din_a_sel(alu_din_a_sel),
    .tb_alu_din_b_sel(alu_din_b_sel),
    .tb_alu_func(alu_func),
    .tb_alu_dout(alu_dout),
    .tb_bu_func(bu_func),
    .tb_bu_branch(bu_branch),
    .tb_dm_func(dm_func),
    .tb_dm_we(dm_we),
    .tb_dm_dout(dm_dout),
    .tb_im_inst(im_inst),
    .tb_immediate(immediate),
    .tb_mux_to_alu_din_a(mux_to_alu_din_a),
    .tb_mux_to_alu_din_b(mux_to_alu_din_b),
    .tb_mux_to_rf_din(mux_to_rf_din),
    .tb_pc_current(pc_current),
    .tb_pc_next(pc_next),
    .tb_rf_din_sel(rf_din_sel),
    .tb_rf_we(rf_we),
    .tb_rf_raddr_rs1(rf_raddr_rs1),
    .tb_rf_raddr_rs2(rf_raddr_rs2),
    .tb_rf_waddr(rf_waddr),
    .tb_rf_dout_rs1(rf_dout_rs1),
    .tb_rf_dout_rs2(rf_dout_rs2)
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