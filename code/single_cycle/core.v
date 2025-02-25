module core (
    input wire          clk,
    input wire          rstn,
    output reg          tb_alu_din_a_sel,
    output reg          tb_alu_din_b_sel,
    output reg [3:0]    tb_alu_func,
    output reg [31:0]   tb_alu_dout,
    output reg [2:0]    tb_bu_func,
    output reg          tb_bu_branch,
    output reg [2:0]    tb_dm_func,
    output reg          tb_dm_we,
    output reg [31:0]   tb_dm_dout,
    output reg [31:0]   tb_im_inst,
    output reg [31:0]   tb_immediate,
    output reg [31:0]   tb_mux_to_alu_din_a,
    output reg [31:0]   tb_mux_to_alu_din_b,
    output reg [31:0]   tb_mux_to_rf_din,
    output reg [31:0]   tb_pc_current,
    output reg [31:0]   tb_pc_next,
    output reg [1:0]    tb_rf_din_sel,
    output reg          tb_rf_we,
    output reg [4:0]    tb_rf_raddr_rs1,
    output reg [4:0]    tb_rf_raddr_rs2,
    output reg [4:0]    tb_rf_waddr,
    output reg [31:0]   tb_rf_dout_rs1,
    output reg [31:0]   tb_rf_dout_rs2
);

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

    always @(*) begin
        tb_alu_din_a_sel = alu_din_a_sel;
        tb_alu_din_b_sel = alu_din_b_sel;
        tb_alu_func = alu_func;
        tb_alu_dout = alu_dout;
        tb_bu_func = bu_func;
        tb_bu_branch = bu_branch;
        tb_dm_func = dm_func;
        tb_dm_we = dm_we;
        tb_dm_dout = dm_dout;
        tb_im_inst = im_inst;
        tb_immediate = immediate;
        tb_mux_to_alu_din_a = mux_to_alu_din_a;
        tb_mux_to_alu_din_b = mux_to_alu_din_b;
        tb_mux_to_rf_din = mux_to_rf_din;
        tb_pc_current = pc_current;
        tb_pc_next = pc_next;
        tb_rf_din_sel = rf_din_sel;
        tb_rf_we = rf_we;
        tb_rf_raddr_rs1 = rf_raddr_rs1;
        tb_rf_raddr_rs2 = rf_raddr_rs2;
        tb_rf_waddr = rf_waddr;
        tb_rf_dout_rs1 = rf_dout_rs1;
        tb_rf_dout_rs2 = rf_dout_rs2;
    end

    alu alu (
        .alu_func(alu_func),
        .alu_din_a(mux_to_alu_din_a),
        .alu_din_b(mux_to_alu_din_b),
        .alu_dout(alu_dout)
    );

    branch_unit branch_unit (
        .bu_func(bu_func),
        .bu_din_a(rf_dout_rs1),
        .bu_din_b(rf_dout_rs2),
        .bu_branch(bu_branch)
    );

    control_unit control_unit (
        .instruction(im_inst),
        .immediate(immediate),
        .alu_din_a_sel(alu_din_a_sel),
        .alu_din_b_sel(alu_din_b_sel),
        .alu_func(alu_func),
        .bu_func(bu_func),
        .dm_func(dm_func),
        .dm_we(dm_we),
        .rf_din_sel(rf_din_sel),
        .rf_we(rf_we),
        .rf_raddr_rs1(rf_raddr_rs1),
        .rf_raddr_rs2(rf_raddr_rs2),
        .rf_waddr(rf_waddr)
    );

    data_mem data_mem (
        .clk(~clk),
        .dm_func(dm_func),
        .dm_we(dm_we),
        .dm_addr(alu_dout),
        .dm_din(rf_dout_rs2),
        .dm_dout(dm_dout)
    );

    inst_mem inst_mem (
        .im_addr(pc_current),
        .im_inst(im_inst)
    );

    mux2 mux_alu_din_a (
        .mux2_sel(alu_din_a_sel),
        .mux2_din_0(rf_dout_rs1),
        .mux2_din_1(pc_current),
        .mux2_dout(mux_to_alu_din_a)
    );

    mux2 mux_alu_din_b (
        .mux2_sel(alu_din_b_sel),
        .mux2_din_0(rf_dout_rs2),
        .mux2_din_1(immediate),
        .mux2_dout(mux_to_alu_din_b)
    );

    mux4 mux_rf_din (
        .mux4_sel(rf_din_sel),
        .mux4_din_0(dm_dout),
        .mux4_din_1(alu_dout),
        .mux4_din_2(pc_next),
        .mux4_din_3(32'b0),
        .mux4_dout(mux_to_rf_din)
    );

    programme_counter programme_counter (
        .clk(clk),
        .rstn(rstn),
        .pc_branch(bu_branch),
        .pc_din_addr(alu_dout),
        .pc_current(pc_current),
        .pc_next(pc_next)
    );

    regfile regfile (
        .clk(~clk),
        .rstn(rstn),
        .rf_we(rf_we),
        .rf_raddr_rs1(rf_raddr_rs1),
        .rf_raddr_rs2(rf_raddr_rs2),
        .rf_waddr(rf_waddr),
        .rf_din(mux_to_rf_din),
        .rf_dout_rs1(rf_dout_rs1),
        .rf_dout_rs2(rf_dout_rs2)
    );

endmodule