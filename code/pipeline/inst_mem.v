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
        internal_reg[0]     =   32'h00000093;
        internal_reg[1]     =   32'h30000f93;
        internal_reg[2]     =   32'h40000f13;
        internal_reg[3]     =   32'h004f1f13;
        internal_reg[4]     =   32'h00000e93;
        internal_reg[5]     =   32'h001e8e93;
        internal_reg[6]     =   32'hffee9ee3;
        internal_reg[7]     =   32'h00008103;
        internal_reg[8]     =   32'h00510113;
        internal_reg[9]     =   32'h00208023;
        internal_reg[10]    =   32'h00108093;
        internal_reg[11]    =   32'hfdf09ee3;
        internal_reg[12]    =   32'h00000093;
        internal_reg[13]    =   32'hfc000ae3;
    end

endmodule