module core (
    input wire          clk,
    input wire          rstn,
    output reg          tb_pc_enable,
    output reg          tb_if_id_enable,
    output reg          tb_if_id_rstn,
    output reg          tb_id_ex_enable,
    output reg          tb_id_ex_rstn,
    output reg [1:0]    tb_ex_rf_dout_rs1_sel,
    output reg [1:0]    tb_ex_rf_dout_rs2_sel,
    output reg          tb_ex_mem_enable,
    output reg          tb_ex_mem_rstn,
    output reg          tb_mem_wb_enable,
    output reg          tb_mem_wb_rstn,

    output reg [31:0]   tb_if_pc_current,
    output reg [31:0]   tb_if_im_inst,
    output reg [31:0]   tb_if_pc_next,

    output reg [31:0]   tb_id_pc_current,
    output reg [31:0]   tb_id_im_inst,
    output reg [31:0]   tb_id_pc_next,
    output reg [31:0]   tb_id_immediate,
    output reg          tb_id_alu_din_a_sel,
    output reg          tb_id_alu_din_b_sel,
    output reg [3:0]    tb_id_alu_func,
    output reg [2:0]    tb_id_bu_func,
    output reg [2:0]    tb_id_dm_func,
    output reg          tb_id_dm_we,
    output reg [1:0]    tb_id_rf_din_sel,
    output reg          tb_id_rf_we,
    output reg [4:0]    tb_id_rf_raddr_rs1,
    output reg [4:0]    tb_id_rf_raddr_rs2,
    output reg [4:0]    tb_id_rf_waddr,
    output reg [31:0]   tb_id_rf_dout_rs1,
    output reg [31:0]   tb_id_rf_dout_rs2,

    output reg [31:0]   tb_ex_pc_current,
    output reg [31:0]   tb_ex_immediate,
    output reg          tb_ex_alu_din_a_sel,
    output reg          tb_ex_alu_din_b_sel,
    output reg [3:0]    tb_ex_alu_func,
    output reg [2:0]    tb_ex_bu_func,
    output reg [2:0]    tb_ex_dm_func,
    output reg          tb_ex_dm_we,
    output reg [1:0]    tb_ex_rf_din_sel,
    output reg          tb_ex_rf_we,
    output reg [31:0]   tb_ex_rf_dout_rs1,
    output reg [31:0]   tb_ex_rf_dout_rs2,
    output reg [4:0]    tb_ex_rf_raddr_rs1,
    output reg [4:0]    tb_ex_rf_raddr_rs2,
    output reg [4:0]    tb_ex_rf_waddr,
    output reg [31:0]   tb_ex_pc_next,
    output reg [6:0]    tb_ex_opcode,
    output reg [31:0]   tb_ex_mux_out_rf_dout_rs1,
    output reg [31:0]   tb_ex_mux_out_rf_dout_rs2,
    output reg [31:0]   tb_ex_mux_to_alu_din_a,
    output reg [31:0]   tb_ex_mux_to_alu_din_b,
    output reg [31:0]   tb_ex_alu_dout,
    output reg          tb_ex_bu_branch,

    output reg [31:0]   tb_mem_alu_dout,
    output reg [31:0]   tb_mem_mux_out_rf_dout_rs2,
    output reg [2:0]    tb_mem_dm_func,
    output reg          tb_mem_dm_we,
    output reg [1:0]    tb_mem_rf_din_sel,
    output reg          tb_mem_rf_we,
    output reg [4:0]    tb_mem_rf_waddr,
    output reg [31:0]   tb_mem_pc_next,
    output reg [31:0]   tb_mem_dm_dout,

    output reg [1:0]    tb_wb_rf_din_sel,
    output reg [31:0]   tb_wb_dm_dout,
    output reg [31:0]   tb_wb_alu_dout,
    output reg [31:0]   tb_wb_pc_next,
    output reg          tb_wb_rf_we,
    output reg [4:0]    tb_wb_rf_waddr,
    output reg [31:0]   tb_wb_mux_to_rf_din
);
    
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

    always @(*) begin
        tb_pc_enable = pc_enable;
        tb_if_id_enable = if_id_enable;
        tb_if_id_rstn = if_id_rstn;
        tb_id_ex_enable = id_ex_enable;
        tb_id_ex_rstn = id_ex_rstn;
        tb_ex_rf_dout_rs1_sel = ex_rf_dout_rs1_sel;
        tb_ex_rf_dout_rs2_sel = ex_rf_dout_rs2_sel;
        tb_ex_mem_enable = ex_mem_enable;
        tb_ex_mem_rstn = ex_mem_rstn;
        tb_mem_wb_enable = mem_wb_enable;
        tb_mem_wb_rstn = mem_wb_rstn;

        tb_if_pc_current = if_pc_current;
        tb_if_im_inst = if_im_inst;
        tb_if_pc_next = if_pc_next;

        tb_id_pc_current = id_pc_current;
        tb_id_im_inst = id_im_inst;
        tb_id_pc_next = id_pc_next;
        tb_id_immediate = id_immediate;
        tb_id_alu_din_a_sel = id_alu_din_a_sel;
        tb_id_alu_din_b_sel = id_alu_din_b_sel;
        tb_id_alu_func = id_alu_func;
        tb_id_bu_func = id_bu_func;
        tb_id_dm_func = id_dm_func;
        tb_id_dm_we = id_dm_we;
        tb_id_rf_din_sel = id_rf_din_sel;
        tb_id_rf_we = id_rf_we;
        tb_id_rf_raddr_rs1 = id_rf_raddr_rs1;
        tb_id_rf_raddr_rs2 = id_rf_raddr_rs2;
        tb_id_rf_waddr = id_rf_waddr;
        tb_id_rf_dout_rs1 = id_rf_dout_rs1;
        tb_id_rf_dout_rs2 = id_rf_dout_rs2;

        tb_ex_pc_current = ex_pc_current;
        tb_ex_immediate = ex_immediate;
        tb_ex_alu_din_a_sel = ex_alu_din_a_sel;
        tb_ex_alu_din_b_sel = ex_alu_din_b_sel;
        tb_ex_alu_func = ex_alu_func;
        tb_ex_bu_func = ex_bu_func;
        tb_ex_dm_func = ex_dm_func;
        tb_ex_dm_we = ex_dm_we;
        tb_ex_rf_din_sel = ex_rf_din_sel;
        tb_ex_rf_we = ex_rf_we;
        tb_ex_rf_dout_rs1 = ex_rf_dout_rs1;
        tb_ex_rf_dout_rs2 = ex_rf_dout_rs2;
        tb_ex_rf_raddr_rs1 = ex_rf_raddr_rs1;
        tb_ex_rf_raddr_rs2 = ex_rf_raddr_rs2;
        tb_ex_rf_waddr = ex_rf_waddr;
        tb_ex_pc_next = ex_pc_next;
        tb_ex_opcode = ex_opcode;
        tb_ex_mux_out_rf_dout_rs1 = ex_mux_out_rf_dout_rs1;
        tb_ex_mux_out_rf_dout_rs2 = ex_mux_out_rf_dout_rs2;
        tb_ex_mux_to_alu_din_a = ex_mux_to_alu_din_a;
        tb_ex_mux_to_alu_din_b = ex_mux_to_alu_din_b;
        tb_ex_alu_dout = ex_alu_dout;
        tb_ex_bu_branch = ex_bu_branch;

        tb_mem_alu_dout = mem_alu_dout;
        tb_mem_mux_out_rf_dout_rs2 = mem_mux_out_rf_dout_rs2;
        tb_mem_dm_func = mem_dm_func;
        tb_mem_dm_we = mem_dm_we;
        tb_mem_rf_din_sel = mem_rf_din_sel;
        tb_mem_rf_we = mem_rf_we;
        tb_mem_rf_waddr = mem_rf_waddr;
        tb_mem_pc_next = mem_pc_next;
        tb_mem_dm_dout = mem_dm_dout;

        tb_wb_rf_din_sel = wb_rf_din_sel;
        tb_wb_dm_dout = wb_dm_dout;
        tb_wb_alu_dout = wb_alu_dout;
        tb_wb_pc_next = wb_pc_next;
        tb_wb_rf_we = wb_rf_we;
        tb_wb_rf_waddr = wb_rf_waddr;
        tb_wb_mux_to_rf_din = wb_mux_to_rf_din;
    end

    alu alu (
        .alu_func      (ex_alu_func),
        .alu_din_a     (ex_mux_to_alu_din_a),
        .alu_din_b     (ex_mux_to_alu_din_b),
        .alu_dout      (ex_alu_dout)
    );

    branch_unit bu (
        .bu_func       (ex_bu_func),
        .bu_din_a      (ex_mux_out_rf_dout_rs1),
        .bu_din_b      (ex_mux_out_rf_dout_rs2),
        .bu_branch     (ex_bu_branch)
    );

    control_unit cu (
       .instruction      (id_im_inst),
       .immediate        (id_immediate),
       .alu_din_a_sel    (id_alu_din_a_sel),
       .alu_din_b_sel    (id_alu_din_b_sel),
       .alu_func         (id_alu_func),
       .bu_func          (id_bu_func),
       .dm_func          (id_dm_func),
       .dm_we            (id_dm_we),
       .rf_din_sel       (id_rf_din_sel),
       .rf_we            (id_rf_we),
       .rf_raddr_rs1     (id_rf_raddr_rs1),
       .rf_raddr_rs2     (id_rf_raddr_rs2),
       .rf_waddr         (id_rf_waddr)
    );

    data_mem dm (
        .clk         (~clk),
        .dm_func     (mem_dm_func),
        .dm_we       (mem_dm_we),
        .dm_addr     (mem_alu_dout),
        .dm_din      (mem_mux_out_rf_dout_rs2),
        .dm_dout     (mem_dm_dout)
    );

    hazard_unit hazard_unit (
        .id_rf_raddr_rs1         (id_rf_raddr_rs1),
        .id_rf_raddr_rs2         (id_rf_raddr_rs2),
        .ex_opcode               (ex_opcode),
        .ex_rf_raddr_rs1         (ex_rf_raddr_rs1),
        .ex_rf_raddr_rs2         (ex_rf_raddr_rs2),
        .ex_rf_waddr             (ex_rf_waddr),
        .ex_bu_branch            (ex_bu_branch),
        .mem_rf_we               (mem_rf_we),
        .mem_rf_waddr            (mem_rf_waddr),
        .wb_rf_we                (wb_rf_we),
        .wb_rf_waddr             (wb_rf_waddr),
        .pc_enable               (pc_enable),
        .if_id_enable            (if_id_enable),
        .if_id_rstn              (if_id_rstn),
        .id_ex_enable            (id_ex_enable),
        .id_ex_rstn              (id_ex_rstn),
        .ex_rf_dout_rs1_sel      (ex_rf_dout_rs1_sel),
        .ex_rf_dout_rs2_sel      (ex_rf_dout_rs2_sel),
        .ex_mem_enable           (ex_mem_enable),
        .ex_mem_rstn             (ex_mem_rstn),
        .mem_wb_enable           (mem_wb_enable),
        .mem_wb_rstn             (mem_wb_rstn)
    );

    inst_mem im (
        .im_addr       (if_pc_current),
        .im_inst       (if_im_inst)
    );

    mux2 to_alu_din_a (
        .mux2_sel        (ex_alu_din_a_sel),
        .mux2_din_0      (ex_mux_out_rf_dout_rs1),
        .mux2_din_1      (ex_pc_current),
        .mux2_dout       (ex_mux_to_alu_din_a)
    );

    mux2 to_alu_din_b (
        .mux2_sel        (ex_alu_din_b_sel),
        .mux2_din_0      (ex_mux_out_rf_dout_rs2),
        .mux2_din_1      (ex_immediate),
        .mux2_dout       (ex_mux_to_alu_din_b)
    );

    mux4 out_rf_dout_rs1 (
        .mux4_sel        (ex_rf_dout_rs1_sel),
        .mux4_din_0      (ex_rf_dout_rs1),
        .mux4_din_1      (mem_alu_dout),
        .mux4_din_2      (wb_mux_to_rf_din),
        .mux4_din_3      (32'b0),
        .mux4_dout       (ex_mux_out_rf_dout_rs1)
    );
    mux4 out_rf_dout_rs2 (
        .mux4_sel        (ex_rf_dout_rs2_sel),
        .mux4_din_0      (ex_rf_dout_rs2),
        .mux4_din_1      (mem_alu_dout),
        .mux4_din_2      (wb_mux_to_rf_din),
        .mux4_din_3      (32'b0),
        .mux4_dout       (ex_mux_out_rf_dout_rs2)
    );

    mux4 to_rf_din (
        .mux4_sel        (wb_rf_din_sel),
        .mux4_din_0      (wb_dm_dout),
        .mux4_din_1      (wb_alu_dout),
        .mux4_din_2      (wb_pc_next),
        .mux4_din_3      (32'b0),
        .mux4_dout       (wb_mux_to_rf_din)
    );

    programme_counter pc (
        .clk              (clk),
        .rstn             (rstn),
        .pc_enable        (pc_enable),
        .pc_branch        (ex_bu_branch),
        .pc_din_addr      (ex_alu_dout),
        .pc_current       (if_pc_current),
        .pc_next          (if_pc_next)
    );

    reg_ex_mem reg_ex_mem (
        .clk                         (clk),
        .rstn                        (rstn&&ex_mem_rstn),
        .enable                      (ex_mem_enable),
        .ex_alu_dout                 (ex_alu_dout),
        .ex_mux_out_rf_dout_rs2      (ex_mux_out_rf_dout_rs2),
        .ex_dm_func                  (ex_dm_func),
        .ex_dm_we                    (ex_dm_we),
        .ex_rf_din_sel               (ex_rf_din_sel),
        .ex_rf_we                    (ex_rf_we),
        .ex_rf_waddr                 (ex_rf_waddr),
        .ex_pc_next                  (ex_pc_next),
        .mem_alu_dout                (mem_alu_dout),
        .mem_mux_out_rf_dout_rs2     (mem_mux_out_rf_dout_rs2),
        .mem_dm_func                 (mem_dm_func),
        .mem_dm_we                   (mem_dm_we),
        .mem_rf_din_sel              (mem_rf_din_sel),
        .mem_rf_we                   (mem_rf_we),
        .mem_rf_waddr                (mem_rf_waddr),
        .mem_pc_next                 (mem_pc_next)
    );

    reg_id_ex reg_id_ex (
        .clk                     (clk),
        .rstn                    (rstn&&id_ex_rstn),
        .enable                  (id_ex_enable),
        .id_pc_current           (id_pc_current),
        .id_immediate            (id_immediate),
        .id_alu_din_a_sel        (id_alu_din_a_sel),
        .id_alu_din_b_sel        (id_alu_din_b_sel),
        .id_alu_func             (id_alu_func),
        .id_bu_func              (id_bu_func),
        .id_dm_func              (id_dm_func),
        .id_dm_we                (id_dm_we),
        .id_rf_din_sel           (id_rf_din_sel),
        .id_rf_we                (id_rf_we),
        .id_rf_dout_rs1          (id_rf_dout_rs1),
        .id_rf_dout_rs2          (id_rf_dout_rs2),
        .id_rf_raddr_rs1         (id_rf_raddr_rs1),
        .id_rf_raddr_rs2         (id_rf_raddr_rs2),
        .id_rf_waddr             (id_rf_waddr),
        .id_pc_next              (id_pc_next),
        .id_opcode               (id_im_inst[6:0]),
        .ex_pc_current           (ex_pc_current),
        .ex_immediate            (ex_immediate),
        .ex_alu_din_a_sel        (ex_alu_din_a_sel),
        .ex_alu_din_b_sel        (ex_alu_din_b_sel),
        .ex_alu_func             (ex_alu_func),
        .ex_bu_func              (ex_bu_func),
        .ex_dm_func              (ex_dm_func),
        .ex_dm_we                (ex_dm_we),
        .ex_rf_din_sel           (ex_rf_din_sel),
        .ex_rf_we                (ex_rf_we),
        .ex_rf_dout_rs1          (ex_rf_dout_rs1),
        .ex_rf_dout_rs2          (ex_rf_dout_rs2),
        .ex_rf_raddr_rs1         (ex_rf_raddr_rs1),
        .ex_rf_raddr_rs2         (ex_rf_raddr_rs2),
        .ex_rf_waddr             (ex_rf_waddr),
        .ex_pc_next              (ex_pc_next),
        .ex_opcode               (ex_opcode)
    );

    reg_if_id reg_if_id (
        .clk                 (clk),
        .rstn                (rstn&&if_id_rstn),
        .enable              (if_id_enable),
        .if_pc_current       (if_pc_current),
        .if_im_inst          (if_im_inst),
        .if_pc_next          (if_pc_next),
        .id_pc_current       (id_pc_current),
        .id_im_inst          (id_im_inst),
        .id_pc_next          (id_pc_next)
    );

    reg_mem_wb reg_mem_wb (
        .clk                 (clk),
        .rstn                (rstn&&mem_wb_rstn),
        .enable              (mem_wb_enable),
        .mem_rf_din_sel      (mem_rf_din_sel),
        .mem_dm_dout         (mem_dm_dout),
        .mem_alu_dout        (mem_alu_dout),
        .mem_pc_next         (mem_pc_next),
        .mem_rf_we           (mem_rf_we),
        .mem_rf_waddr        (mem_rf_waddr),
        .wb_rf_din_sel       (wb_rf_din_sel),
        .wb_dm_dout          (wb_dm_dout),
        .wb_alu_dout         (wb_alu_dout),
        .wb_pc_next          (wb_pc_next),
        .wb_rf_we            (wb_rf_we),
        .wb_rf_waddr         (wb_rf_waddr)
    );

    regfile regfile (
        .clk               (~clk),
        .rstn              (rstn),
        .rf_we             (wb_rf_we),
        .rf_raddr_rs1      (id_rf_raddr_rs1),
        .rf_raddr_rs2      (id_rf_raddr_rs2),
        .rf_waddr          (wb_rf_waddr),
        .rf_din            (wb_mux_to_rf_din),
        .rf_dout_rs1       (id_rf_dout_rs1),
        .rf_dout_rs2       (id_rf_dout_rs2)
    );

endmodule