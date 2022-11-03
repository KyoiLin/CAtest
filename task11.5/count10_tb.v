module count10_tb(

);
    reg rstn;
    reg clk;
    wire [3:0] count;
    wire co;
    initial begin
        rstn = 0;
        clk = 0;
        #50
        rstn = 1;
        #10
        rstn = 0;
    end
    always #10 clk = ~clk;
    count10 c(rstn, clk, count, co);
endmodule