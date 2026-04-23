//RIPPLE_CARRY_ADDER_DESIGN

module fa(a,b,c,sum,cout);
input a,b,c;
output sum,cout;

assign sum= a^b^c;
assign cout=(a&b)|(b&c)|(c&a);

endmodule

module ripple_adder(a,b,c,sum,cout);
input [3:0]a,b;
input c;
output [3:0]sum;
output cout;

wire c1,c2,c3;

fa FA0(a[0],b[0],c,sum[0],c1);
fa FA1(a[1],b[1],c1,sum[1],c2);
fa FA2(a[2],b[2],c2,sum[2],c3);
fa FA3(a[3],b[3],c3,sum[3],cout);
endmodule

//RIPPLE_CARRY_ADDER_TESTBENCH

module tb();
reg [3:0]a,b;
reg c;
wire [3:0]sum;
wire cout;

ripple_adder dut(.*);

initial begin 
repeat(11)begin

{a,b,c}=$random;
#5;
//$display("a=%0d,b=%0d,c=%0d,sum=%0d,cout=%0d",a,b,c,sum,cout);
$monitor("a=%b,b=%b,c=%b,sum=%b,cout=%b",a,b,c,sum,cout);

end
end
endmodule



