module aludecoder (
    input wire clk,    // Clock
    /*--------------------------------------------------*/
    input wire [7:0]alu_code,//
    //input clk_en, // Clock Enable
    //input rst_n,  // Asynchronous reset active low
    /*--------------------------------------------------*/
    output wire [3:0]code,
    output wire [7:0]regsel
);
//やってる事:レジスタ選択用の配線出力とALUへ投げる線の分轄

function [7:0]select;//上位と下位4bitがセレクタ,[DCBA:DCBA]
    input [3:0]regcode;

    case(regcode)
        /*-----------------------DCBADCBA-------------------*/
        4'b0000    : select = 8'b00010001;//SELECT = A, A
        4'b0001    : select = 8'b00010010;//SELECT = A, B
        4'b0010    : select = 8'b00010100;//SELECT = A, C
        4'b0011    : select = 8'b00011000;//SELECT = A, D
        /*-----------------------DCBADCBA-------------------*/
        4'b0100    : select = 8'b00100001;//SELECT = B, A
        4'b0101    : select = 8'b00100001;//SELECT = B, B
        4'b0110    : select = 8'b00100001;//SELECT = B, C
        4'b0111    : select = 8'b00100001;//SELECT = B, D
        /*-----------------------DCBADCBA-------------------*/
        4'b1000    : select = 8'b01000001;//SELECT = C, A
        4'b1001    : select = 8'b01000001;//SELECT = C, B
        4'b1010    : select = 8'b01000001;//SELECT = C, C
        4'b1011    : select = 8'b01000001;//SELECT = C, D
        /*-----------------------DCBADCBA-------------------*/
        4'b1100    : select = 8'b10000001;//SELECT = D, A
        4'b1101    : select = 8'b10000001;//SELECT = D, B
        4'b1110    : select = 8'b10000001;//SELECT = D, C
        4'b1111    : select = 8'b10000001;//SELECT = D, D
        /*--------------------------------------------------*/
    endcase
endfunction


assign regsel = select(alu_code[7:4]);//



endmodule