//ram
//バス幅2048bit
module ram (
    input clk_h,    // Clock
    input clk_l,    // Clock(負論理)
    input w_e, // Write Enable
    //input rst_n,  // Asynchronous reset active low
    input  wire [15:0]read_adr,   //アドレスバス
    input  wire [15:0]write_adr,   //アドレスバス
    output reg  [1023:0]read_data, //メモリからのデータ出力
    input  wire [1023:0]write_data //メモリへ書き込むデータ入力
);

reg [7:0]ram[16383:0];

integer i=0;
always @(posedge clk_h or negedge clk_l) begin
    repeat(128) begin
    read_data <= (read_adr+i<4096 ? ram[read_adr+i] : 0);
    if(write_adr+i<4096)
        ram[write_adr+i] <= write_data;
    i=i+1;
    end
end

endmodule