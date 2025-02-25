module reg_if_id (
    input wire          clk                 ,
    input wire          rstn                ,
    input wire          enable              ,
    input wire [31:0]   if_pc_current       ,
    input wire [31:0]   if_im_inst          ,
    input wire [31:0]   if_pc_next          ,
    output reg [31:0]   id_pc_current       ,
    output reg [31:0]   id_im_inst          ,
    output reg [31:0]   id_pc_next          
);

    always @(posedge clk) begin
        if (!rstn) begin
            id_pc_current <= 32'b0;
            id_im_inst    <= 32'b0;
            id_pc_next    <= 32'b0;
        end
        else
        if (enable) begin
            id_pc_current <= if_pc_current;
            id_im_inst    <= if_im_inst;
            id_pc_next    <= if_pc_next;
        end
        else begin
            id_pc_current <= id_pc_current;
            id_im_inst    <= id_im_inst;
            id_pc_next    <= id_pc_next;
        end
    end

endmodule