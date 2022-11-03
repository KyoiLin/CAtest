module count60_tb();
reg rstn;
reg clk;
wire [7:0] cnt;
wire cout;
count60 c60(
	.clk(clk),
	.cout(cout),
	.rstn(rstn),
	.cnt(cnt)
);

initial begin
clk = 0;
rstn = 0;
#51
rstn = 1;
$display("running");
end
always begin
#1 clk = ~clk;
end
endmodule