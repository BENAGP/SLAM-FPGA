`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/07 17:15:11
// Design Name: 
// Module Name: count
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module count(
output wire[15:0] out,
input out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15
);
/*always @(posedge clk,posedge reset)
if(reset)   out=16'b0;
else begin
out[0]<=out0;
out[1]<=out1;
out[2]<=out2;
out[3]<=out3;
out[4]<=out4;
out[5]<=out5;
out[6]<=out6;
out[7]<=out7;
out[8]<=out8;
out[9]<=out9;
out[10]<=out10;
out[11]<=out11;
out[12]<=out12;
out[13]<=out13;
out[14]<=out14;
out[15]<=out15;
end*/
assign out={out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15};
endmodule
