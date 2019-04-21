`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/18 11:20:13
// Design Name: 
// Module Name: top_arch
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


module top_arch(
output wire [15:0] out,
output wire En,
input  [7:0] data1,data2,data3,data4,data5,data6,data7,
input reset,clk,load
);
wire [7:0]I,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16;
wire out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15;
shift_reg1 M1(P16,P1,P2,data1,reset,clk,load);
shift_reg2 M2(P15,P3,data2,reset,clk,load);
shift_reg3 M3(P14,P4,data3,reset,clk,load);
shift_reg4 M4(I,P13,P5,En,data4,reset,clk,load);
shift_reg3 M5(P12,P6,data5,reset,clk,load);
shift_reg2 M6(P11,P7,data6,reset,clk,load);
shift_reg1 M7(P10,P9,P8,data7,reset,clk,load);
com C1(out0,I,P1);
com C2(out1,I,P2);
com C3(out2,I,P3);
com C4(out3,I,P4);
com C5(out4,I,P5);
com C6(out5,I,P6);
com C7(out6,I,P7);
com C8(out7,I,P8);
com C9(out8,I,P9);
com C10(out9,I,P10);
com C11(out10,I,P11);
com C12(out11,I,P12);
com C13(out12,I,P13);
com C14(out13,I,P14);
com C15(out14,I,P15);
com C16(out15,I,P16);
count S1(out,out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15);
endmodule
