module mux4 (
    input wire [1:0]    mux4_sel,
    input wire [31:0]   mux4_din_0,
    input wire [31:0]   mux4_din_1,
    input wire [31:0]   mux4_din_2,
    input wire [31:0]   mux4_din_3,
    output reg [31:0]   mux4_dout
);

    always @(*) begin
        case (mux4_sel)
            2'b00: begin
                mux4_dout = mux4_din_0;
            end
            2'b01: begin
                mux4_dout = mux4_din_1;
            end
            2'b10: begin
                mux4_dout = mux4_din_2;
            end
            2'b11: begin
                mux4_dout = mux4_din_3;
            end
        endcase
    end

endmodule