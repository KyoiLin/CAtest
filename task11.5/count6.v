module count_6(
    input wire rst,
    input wire clk,
    // input wire en,
    output reg [3:0] count,
    output co
);
    always@(posedge clk) begin
    if(rst) begin
        count <= 4'd0;
    end
    else if(count == 4'd5) begin
        count <= 4'd0;
    end
    else begin
        count <= count + 1'd1;
    end
    end
    assign co = (count == 4'd5);
endmodule