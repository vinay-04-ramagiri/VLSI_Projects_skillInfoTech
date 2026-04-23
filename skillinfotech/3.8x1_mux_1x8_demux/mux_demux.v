//8x1 MUX code

module mux_8x1(i_m,s,y_m);
input [7:0]i_m;
input [2:0]s;
output reg y_m;

always @(*)begin
    case(s)
       3'b000:y_m=i_m[0];
       3'b001:y_m=i_m[1];
       3'b010:y_m=i_m[2];
       3'b011:y_m=i_m[3];
       3'b100:y_m=i_m[4];
       3'b101:y_m=i_m[5];
       3'b110:y_m=i_m[6];
       3'b111:y_m=i_m[7];
	   default:y_m=0;
    endcase
end
endmodule


//1x8 DEMUX code
module demux_1x8(i_d,s,y_d);
input i_d;
input [2:0]s;
output reg [7:0]y_d;

always @(*)begin
   y_d=8'b0000_0000;
   case(s)
   3'b000:y_d[0]=i_d;
   3'b001:y_d[1]=i_d;
   3'b010:y_d[2]=i_d;
   3'b011:y_d[3]=i_d;
   3'b100:y_d[4]=i_d;
   3'b101:y_d[5]=i_d;
   3'b110:y_d[6]=i_d;
   3'b111:y_d[7]=i_d;
   endcase
end

endmodule

//testbench code for mux and demux
module tb;
reg [7:0]i_m;
reg [2:0]s;
reg i_d;
wire y_m;
wire [7:0]y_d;
mux_8x1 dut(.*);
demux_1x8 dut1(.*);
initial begin 
$monitor("time=%0t,s=%b,i_m=%b,y_m=%b,i_d=%b,y_d=%b",$time,s,i_m,y_m,i_d,y_d);
i_m=8'b1010_1010;
i_d=1;
s=3'b000;#10;
s=3'b001;#10;
s=3'b010;#10;
s=3'b011;#10;
s=3'b100;#10;
s=3'b101;#10;
s=3'b110;#10;
s=3'b111;#10;
$finish;
end
endmodule
