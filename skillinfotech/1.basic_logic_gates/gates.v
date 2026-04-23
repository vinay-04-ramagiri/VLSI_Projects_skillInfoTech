module gates(a,b,and_out,or_out,not_out,xor_out);
input a,b;
output and_out,or_out,not_out,xor_out;
assign and_out=a&b;//AND gate logic
assign or_out=a|b;//OR gate logic
assign not_out=~a;//NOT gate logic
assign xor_out=a^b;//XOR gate logic
endmodule


module tb();
reg a,b;
wire and_out,or_out,not_out,xor_out;

gates dut(.*);

initial begin
repeat(10)begin
//a=1;b=0;
{a,b}=$random;
#5;
$display("a=%b,b=%b,AND=%b,OR=%b,NOT=%b,XOR=%b",a,b,and_out,or_out,not_out,xor_out);
end
end
endmodule
