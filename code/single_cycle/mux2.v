module mux2 (
    input wire          mux2_sel,
    input wire  [31:0]  mux2_din_0,
    input wire  [31:0]  mux2_din_1,
    output reg  [31:0]  mux2_dout
);

    always @(*) begin
        mux2_dout = mux2_sel? (mux2_din_1):(mux2_din_0);
    end

endmodule