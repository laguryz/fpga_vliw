`default_nettype none
module alu (
    input wire [3:0]code,  //alu code 16種類
    input wire [15:0]src,  //ソース
    input wire [15:0]dst,  //デスティネーション
    output wire [15:0]out, //出力
    output wire [7:0]flg   //フラグ出力
);

wire [7:0]splitter;

function [15:0]operated;
    input [3:0]code;
    input [15:0]src;
    input [15:0]dst;
    begin
        case(code)
            4'b0000    : operated = src+dst;//And
            4'b0001    : operated = src-dst;//Sub
            4'b0010    : operated = src&dst;//AND
            4'b0011    : operated = src|dst;//OR
            4'b0100    : operated = src^dst;//XOR
            4'b0101    : operated = src<<dst;//ShiftL
            4'b0110    : operated = src>>dst;//ShiftR
            default    : operated = src;
        endcase
    end
endfunction
function [7:0]flag;
    input [15:0]operated;
    input [15:0]src;
    input [15:0]dst;
    begin
        flag[7] = src==dst;
        flag[6] = ~&operated;
        flag[5] = |(16'b1000000000000000&operated);
        flag[4:0] = 5'b00000;
    end
endfunction

//演算
assign splitter = operated(code,src,dst);
assign out = splitter;
assign flg = flag(splitter,src,dst);

endmodule