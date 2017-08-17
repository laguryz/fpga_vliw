module register (
    input wire clk,    // Clock
    input wire en, // Clock Enable
    input wire rst_n,  // Asynchronous reset active low
    input wire [15:0]in_data,//インプット
    output wire [15:0]out_data//アウトプット
);
reg [15:0]reg_ent;

assign out_data = reg_ent;
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        // reset
        reg_ent = 16'hFF;
    end
    else if (en) begin
        reg_ent = in_data;
    end
end


endmodule