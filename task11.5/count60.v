module count60(
	input rstn,
	input clk,
	wire [3:0] cnt6, cnt10,
	output [7:0] cnt,
	wire cout6, cout10, cout
);
count10 c10(
	.clk(clk),
	.rstn(rstn),
	.cnt(cnt10),
	.cout(cout10)
);
count6 c6(
	.clk(clk),
	.en(cout10),
	.rstn(rstn),
	.cnt(cnt6),
	.cout(cout6)
);
assign cnt = {cnt6, cnt10};
assign cout = (cnt == 8'b01011001);
endmodule

module count6(
	input rstn,
	input clk,
	input en,
	output cout,
	output [3:0] cnt
);
reg [3:0] cnt_temp;
always@(posedge clk or negedge rstn)begin
	if(!rstn)
		cnt_temp <= 4'd0;
	else if(en) begin
		if(cnt_temp == 4'd5)
			cnt_temp <= 4'd0;
		else 
			cnt_temp <= cnt_temp + 1'd1;
	end
	else cnt_temp <= cnt_temp;
end
assign cout = (cnt_temp == 4'd5);
assign cnt = cnt_temp;
endmodule

module count10(
	input rstn,
	input clk,
	output cout,
	output [3:0] cnt,
	input jin
);
reg [3:0] cnt_temp;
always@(posedge clk or negedge rstn)begin
	if(!rstn)
		cnt_temp <= 4'b0;
	else if(cnt_temp == 4'b1001) cnt_temp <= 4'b0;
	else cnt_temp = cnt_temp + 1'b1;
end
assign cout = (cnt_temp == 4'd9);
assign cnt = cnt_temp;
endmodule
