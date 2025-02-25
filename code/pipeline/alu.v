`define     ADD     4'b0000
`define     SUB     4'b1000
`define     XOR     4'b0001
`define     OR      4'b0010
`define     AND     4'b0011
`define     SLL     4'b0100
`define     SRL     4'b0101
`define     SRA     4'b1101
`define     SLT     4'b1110
`define     SLTU    4'b1111
`define     DINA    4'b0110
`define     DINB    4'b0111

module alu (
    input wire [3:0]  alu_func      ,
    input wire [31:0] alu_din_a     ,
    input wire [31:0] alu_din_b     ,
    output reg [31:0] alu_dout      
);

    reg [32:0] result_sub_add;
    reg        sub_overflow;
    reg [31:0] result_xor;
    reg [31:0] result_or;
    reg [31:0] result_and;
    reg [31:0] result_sll;
    reg [31:0] result_sra_srl;

    always @(*) begin
        result_sub_add  =    alu_func[3]? ({1'b0,alu_din_a} + {1'b0,~alu_din_b} + 33'b1):({1'b0,alu_din_a} + {1'b0,alu_din_b});
        sub_overflow    =    (!alu_din_a[31] && alu_din_b[31] && result_sub_add[31]) || (alu_din_a[31] && !alu_din_b[31] && !result_sub_add[31]);
        result_xor      =    alu_din_a   ^   alu_din_b;
        result_or       =    alu_din_a   |   alu_din_b;
        result_and      =    alu_din_a   &   alu_din_b;
        result_sll      =    alu_din_a   <<  alu_din_b[4:0];
        result_sra_srl  =    alu_func[3]? (alu_din_a[31]? (alu_din_a >> alu_din_b[4:0] | ~({32{1'b1}} >> alu_din_b[4:0])):(alu_din_a >> alu_din_b[4:0])):(alu_din_a >> alu_din_b[4:0]);

        case (alu_func)
            `ADD: begin
                alu_dout = result_sub_add[31:0];
            end
            `SUB: begin
                alu_dout = result_sub_add[31:0];
            end
            `XOR: begin
                alu_dout = result_xor;
            end
            `OR: begin
                alu_dout = result_or;
            end
            `AND: begin
                alu_dout = result_and;
            end
            `SLL: begin
                alu_dout = result_sll;
            end
            `SRL: begin
                alu_dout = result_sra_srl;
            end
            `SRA: begin
                alu_dout = result_sra_srl;
            end
            `SLT: begin
                alu_dout = ((!sub_overflow && result_sub_add[31]) || (sub_overflow && alu_din_a[31] && !alu_din_b[31]))? (32'b1):(32'b0);
            end
            `SLTU: begin
                alu_dout = result_sub_add[32]? (32'b0):(32'b1);
            end
            `DINA: begin
                alu_dout = alu_din_a;
            end
            `DINB: begin
                alu_dout = alu_din_b;
            end
            default: begin
                alu_dout = 32'b0;
            end
        endcase
    end

endmodule