module programme_counter (
    input  wire        clk              ,
    input  wire        rstn             ,
    input  wire        pc_enable        ,
    input  wire        pc_branch        ,
    input  wire [31:0] pc_din_addr      ,
    output reg  [31:0] pc_current       ,
    output reg  [31:0] pc_next          
);

    always @(*) begin
        pc_next = pc_current + 32'b100;
    end

    always @(posedge clk) begin
        if (!rstn) begin
            pc_current <= 32'b0;
        end
        else
        if (pc_enable) begin
            pc_current <= pc_branch? (pc_din_addr):(pc_next);
        end
        else begin
            pc_current <= pc_current;
        end
    end

endmodule