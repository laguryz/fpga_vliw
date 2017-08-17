`include "register.v"
`include "aludecoder.v"
module core (
    input clk,    // Clock
    input rst_n,  // Asynchronous reset active low

    input  wire [1023:0]in,//メモリからのデータ
    output wire [1023:0]out//メモリへのデータ
);
//配線宣言
/*--------------------------------------------------*/
wire [2048:0]decoded; //デコード後のデータ    
/*--------------------------------------------------*/
wire [19:0]alusplit[25:0];  //ALUへの入力
wire [15:0]aluout[25:0];    //ALUからの出力
/*--------------------------------------------------*/

//変数宣言
//レジスタ
reg [1023:0]prog_reg;//デコード用の命令置き場
generate
    genvar i;
    for (i = 0; i < 32; i = i + 1)
    begin
        register greg();
        register freg();
    end
endgenerate


//各レジスタ空間は独立している



///////////////////////
/*
function [127]evallen;
    input[7:0];
endfunction

function [19:0]alusplit;
endfunction
function [2047:0]decode;
    input [7:0] opcode;
    case(opcode)

    endcase
endfunction
*/
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        // reset
    end
    else begin
        


    end
end
/*
always @(negedge clk_n or negedge rst_n) begin
    if (rst) begin
        // reset
        
    end
    else if () begin
        
    end
end
*/
endmodule