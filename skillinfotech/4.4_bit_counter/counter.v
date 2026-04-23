module count_4bit(clk,rst,q);
input clk,rst;
output reg [3:0]q;
always@(posedge clk)begin
     if(rst)    
         q <= 4'b0000;
     else
         q <= q+1; 
end
endmodule

module tb;
reg clk,rst;
wire [3:0]q;
count_4bit dut (.*);
always #5 clk=~clk;
initial begin
clk=0;
rst=1;
#10 rst=0;
$monitor("time=%0t,rst=%b,q=%d",$time,rst,q);
#300;
$finish;
end
endmodule                        

