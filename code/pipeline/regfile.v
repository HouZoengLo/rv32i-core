module regfile (
    input wire        clk               ,
    input wire        rstn              ,
    input wire        rf_we             ,
    input wire [4:0]  rf_raddr_rs1      ,
    input wire [4:0]  rf_raddr_rs2      ,
    input wire [4:0]  rf_waddr          ,
    input wire [31:0] rf_din            ,
    output reg [31:0] rf_dout_rs1       ,
    output reg [31:0] rf_dout_rs2       
);

    reg [31:0] internal_reg [31:0];

    always @(*) begin
        rf_dout_rs1 = internal_reg[rf_raddr_rs1];
        rf_dout_rs2 = internal_reg[rf_raddr_rs2];
    end

    always @(posedge clk) begin
        if (!rstn) begin
            internal_reg[0] <= 32'b0;
            internal_reg[1] <= 32'b0;
            internal_reg[2] <= 32'b0;
            internal_reg[3] <= 32'b0;
            internal_reg[4] <= 32'b0;
            internal_reg[5] <= 32'b0;
            internal_reg[6] <= 32'b0;
            internal_reg[7] <= 32'b0;
            internal_reg[8] <= 32'b0;
            internal_reg[9] <= 32'b0;
            internal_reg[10] <= 32'b0;
            internal_reg[11] <= 32'b0;
            internal_reg[12] <= 32'b0;
            internal_reg[13] <= 32'b0;
            internal_reg[14] <= 32'b0;
            internal_reg[15] <= 32'b0;
            internal_reg[16] <= 32'b0;
            internal_reg[17] <= 32'b0;
            internal_reg[18] <= 32'b0;
            internal_reg[19] <= 32'b0;
            internal_reg[20] <= 32'b0;
            internal_reg[21] <= 32'b0;
            internal_reg[22] <= 32'b0;
            internal_reg[23] <= 32'b0;
            internal_reg[24] <= 32'b0;
            internal_reg[25] <= 32'b0;
            internal_reg[26] <= 32'b0;
            internal_reg[27] <= 32'b0;
            internal_reg[28] <= 32'b0;
            internal_reg[29] <= 32'b0;
            internal_reg[30] <= 32'b0;
            internal_reg[31] <= 32'b0;
        end
        else if (rf_waddr!=5'b0) begin
            internal_reg[rf_waddr] <= rf_we? (rf_din):(internal_reg[rf_waddr]);
            internal_reg[0] <= 32'b0;
        end
        else begin
            internal_reg[0] <= 32'b0;
        end
    end

endmodule