module count10(
    input wire rstn,
    input wire clk,
    output reg [3:0] count,
    output co
);
always@(posedge clk) begin
    if(rstn) begin
        count <= 4'd0;
    end
    else if(count == 4'd9) begin
        count <= 4'd0;
    end
    else begin
        count <= count + 1'd1;
    end
end
assign co = (count == 4'd9);
endmodule