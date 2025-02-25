`define     NOP     3'b000
`define     BEQ     3'b001
`define     BNE     3'b010
`define     BLT     3'b011
`define     BGE     3'b100
`define     BLTU    3'b101
`define     BGEU    3'b110
`define     JMP     3'b111

module branch_unit (
    input wire [2:0]  bu_func       ,
    input wire [31:0] bu_din_a      ,
    input wire [31:0] bu_din_b      ,
    output reg        bu_branch     
);

    reg [32:0] result_sub;
    reg        sub_overflow;
    reg        equal;
    reg        less_than;
    reg        less_than_unsigned;

    always @(*) begin
        result_sub          =   {1'b0,bu_din_a} + {1'b0,~bu_din_b} + 33'b1;
        sub_overflow        =   (!bu_din_a[31] && bu_din_b[31] && result_sub[31]) || (bu_din_a[31] && !bu_din_b[31] && !result_sub[31]);
        equal               =   (result_sub[31:0]==32'b0);
        less_than           =   ((!sub_overflow && result_sub[31]) || (sub_overflow && bu_din_a[31] && !bu_din_b[31]));
        less_than_unsigned  =   !result_sub[32];

        case (bu_func)
            `NOP: begin
                bu_branch = 1'b0;
            end
            `BEQ: begin
                bu_branch = equal;
            end
            `BNE: begin
                bu_branch = !equal;
            end
            `BLT: begin
                bu_branch = less_than;
            end
            `BGE: begin
                bu_branch = !less_than;
            end
            `BLTU: begin
                bu_branch = less_than_unsigned;
            end
            `BGEU: begin
                bu_branch = !less_than_unsigned;
            end
            `JMP: begin
                bu_branch = 1'b1;
            end
            default: begin
                bu_branch = 1'b0;
            end
        endcase
    end

endmodule