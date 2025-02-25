module inst_mem (
    input wire [31:0] im_addr,
    output reg [31:0] im_inst
);

    reg [31:0] internal_reg [511:0];

    always @(*) begin
        im_inst = internal_reg[im_addr[10:2]];
    end

    // test code
    initial begin
        internal_reg[0]     =   32'h0a800093;
        internal_reg[1]     =   32'hfff08093;
        internal_reg[2]     =   32'h00409093;
        internal_reg[3]     =   32'h0020d093;
        internal_reg[4]     =   32'h4020d093;
        internal_reg[5]     =   32'hfff00113;
        internal_reg[6]     =   32'hf9100193;
        internal_reg[7]     =   32'h00310133;
        internal_reg[8]     =   32'h40310133;
        internal_reg[9]     =   32'h00314133;
        internal_reg[10]    =   32'h00316133;
        internal_reg[11]    =   32'h00317133;
        internal_reg[12]    =   32'h00311133;
        internal_reg[13]    =   32'h00315133;
        internal_reg[14]    =   32'h40315133;
        internal_reg[15]    =   32'h00312133;
        internal_reg[16]    =   32'h00313133;
        internal_reg[17]    =   32'h69814113;
        internal_reg[18]    =   32'hfff16113;
        internal_reg[19]    =   32'h96817113;
        internal_reg[20]    =   32'h29a12113;
        internal_reg[21]    =   32'h37813113;
        internal_reg[22]    =   32'hddccbfb7;
        internal_reg[23]    =   32'h0ba00f13;
        internal_reg[24]    =   32'h004f1f13;
        internal_reg[25]    =   32'h00a00e93;
        internal_reg[26]    =   32'h01df0f33;
        internal_reg[27]    =   32'h01ef8fb3;
        internal_reg[28]    =   32'h00002023;
        internal_reg[29]    =   32'h00002223;
        internal_reg[30]    =   32'h00002423;
        internal_reg[31]    =   32'h01f02023;
        internal_reg[32]    =   32'h01f01223;
        internal_reg[33]    =   32'h01f00423;
        internal_reg[34]    =   32'h00002f03;
        internal_reg[35]    =   32'h00001e83;
        internal_reg[36]    =   32'h00000e03;
        internal_reg[37]    =   32'h00005d83;
        internal_reg[38]    =   32'h00004d03;
        internal_reg[39]    =   32'h00402c83;
        internal_reg[40]    =   32'h00802c03;
        internal_reg[41]    =   32'h019c0033;
    end

endmodule