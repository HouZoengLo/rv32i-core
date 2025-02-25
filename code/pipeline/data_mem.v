`define     WORD    3'b000
`define     HALF    3'b001
`define     BYTE    3'b010
`define     HALFU   3'b101
`define     BYTEU   3'b110

module data_mem (
    input wire          clk         ,
    input wire  [2:0]   dm_func     ,
    input wire          dm_we       ,
    input wire  [31:0]  dm_addr     ,
    input wire  [31:0]  dm_din      ,
    output reg  [31:0]  dm_dout     
);

    reg     [7:0]   byte_a_reg  [255:0];
    reg     [7:0]   byte_b_reg  [255:0];
    reg     [7:0]   byte_c_reg  [255:0];
    reg     [7:0]   byte_d_reg  [255:0];
    reg             byte_a_we;
    reg             byte_b_we;
    reg             byte_c_we;
    reg             byte_d_we;
    reg     [7:0]   byte_a_din;
    reg     [7:0]   byte_b_din;
    reg     [7:0]   byte_c_din;
    reg     [7:0]   byte_d_din;
    reg     [7:0]   byte_a_dout;
    reg     [7:0]   byte_b_dout;
    reg     [7:0]   byte_c_dout;
    reg     [7:0]   byte_d_dout;

    // write funtion select
    always @(*) begin
        case (dm_func)
            `WORD: begin
                byte_a_din = dm_din[7:0];
                byte_b_din = dm_din[15:8];
                byte_c_din = dm_din[23:16];
                byte_d_din = dm_din[31:24];
                byte_a_we  = 1'b1;
                byte_b_we  = 1'b1;
                byte_c_we  = 1'b1;
                byte_d_we  = 1'b1;
            end
            `HALF: begin
                byte_a_din  =   dm_din[7:0];
                byte_b_din  =   dm_din[15:8];
                byte_c_din  =   dm_din[7:0];
                byte_d_din  =   dm_din[15:8];
                byte_a_we   =   !dm_addr[1];
                byte_b_we   =   !dm_addr[1];
                byte_c_we   =   dm_addr[1];
                byte_d_we   =   dm_addr[1];
            end
            `BYTE: begin
                byte_a_din  =   dm_din[7:0];
                byte_b_din  =   dm_din[7:0];
                byte_c_din  =   dm_din[7:0];
                byte_d_din  =   dm_din[7:0];
                byte_a_we   =   dm_addr[1:0]==2'b00;
                byte_b_we   =   dm_addr[1:0]==2'b01;
                byte_c_we   =   dm_addr[1:0]==2'b10;
                byte_d_we   =   dm_addr[1:0]==2'b11;
            end
            default: begin //word
                byte_a_din = dm_din[7:0];
                byte_b_din = dm_din[15:8];
                byte_c_din = dm_din[23:16];
                byte_d_din = dm_din[31:24];
                byte_a_we  = 1'b1;
                byte_b_we  = 1'b1;
                byte_c_we  = 1'b1;
                byte_d_we  = 1'b1;
            end
        endcase
    end

    // read funtion select
    always @(*) begin
       byte_a_dout = byte_a_reg[dm_addr[9:2]];
       byte_b_dout = byte_b_reg[dm_addr[9:2]];
       byte_c_dout = byte_c_reg[dm_addr[9:2]];
       byte_d_dout = byte_d_reg[dm_addr[9:2]];

       case (dm_func)
        `WORD: begin
            dm_dout = {byte_d_dout,byte_c_dout,byte_b_dout,byte_a_dout};
        end
        `HALF: begin
            dm_dout = dm_addr[1]? ({{16{byte_d_dout[7]}},byte_d_dout,byte_c_dout}):({{16{byte_b_dout[7]}},byte_b_dout,byte_a_dout});
        end
        `BYTE: begin
            case (dm_addr[1:0])
                2'b00: begin
                    dm_dout = {{24{byte_a_dout[7]}},byte_a_dout};
                end
                2'b01: begin
                    dm_dout = {{24{byte_b_dout[7]}},byte_b_dout};
                end
                2'b10: begin
                    dm_dout = {{24{byte_c_dout[7]}},byte_c_dout};
                end
                2'b11: begin
                    dm_dout = {{24{byte_d_dout[7]}},byte_d_dout};
                end
            endcase
        end
        `HALFU: begin
            dm_dout = dm_addr[1]? ({16'b0,byte_d_dout,byte_c_dout}):({16'b0,byte_b_dout,byte_a_dout});
        end
        `BYTEU: begin
            case (dm_addr[1:0])
                2'b00: begin
                    dm_dout = {24'b0,byte_a_dout};
                end
                2'b01: begin
                    dm_dout = {24'b0,byte_b_dout};
                end
                2'b10: begin
                    dm_dout = {24'b0,byte_c_dout};
                end
                2'b11: begin
                    dm_dout = {24'b0,byte_d_dout};
                end
            endcase
        end
        default: begin // word
            dm_dout = {byte_d_dout,byte_c_dout,byte_b_dout,byte_a_dout};
        end
       endcase
    end
    
    always @(posedge clk) begin
        byte_a_reg[dm_addr[9:2]] <= (dm_we && byte_a_we)? (byte_a_din):(byte_a_reg[dm_addr[9:2]]);
        byte_b_reg[dm_addr[9:2]] <= (dm_we && byte_b_we)? (byte_b_din):(byte_b_reg[dm_addr[9:2]]);
        byte_c_reg[dm_addr[9:2]] <= (dm_we && byte_c_we)? (byte_c_din):(byte_c_reg[dm_addr[9:2]]);
        byte_d_reg[dm_addr[9:2]] <= (dm_we && byte_d_we)? (byte_d_din):(byte_d_reg[dm_addr[9:2]]);
    end

    integer i;

    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            byte_a_reg[i] = 8'h00;
            byte_b_reg[i] = 8'h00;
            byte_c_reg[i] = 8'h00;
            byte_d_reg[i] = 8'h00;
        end
    end

endmodule