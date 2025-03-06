module inst_mem (
    input wire [31:0] im_addr       ,
    output reg [31:0] im_inst       
);

    reg [31:0] internal_reg [511:0];

    always @(*) begin
        im_inst = internal_reg[im_addr[10:2]];
    end

    // test code
    initial begin
        internal_reg[0]     =   32'h0a800093;
        internal_reg[1]     =   32'h00102023;
        internal_reg[2]     =   32'h00002c03;
        internal_reg[3]     =   32'h001c0c33;
        internal_reg[4]     =   32'h018c0c63;
        internal_reg[5]     =   32'h00a00513;
        internal_reg[6]     =   32'h00b00593;
        internal_reg[7]     =   32'h00c00613;
        internal_reg[8]     =   32'h00d00693;
        internal_reg[9]     =   32'h00e00713;
        internal_reg[10]    =   32'h01f00f93;
    end

endmodule