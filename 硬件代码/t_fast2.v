`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/07 20:52:13
// Design Name: 
// Module Name: t_fast2
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


module t_fast2();
reg [7:0] mem [0:1399];
integer i=0;
reg [7:0]data1,data2,data3,data4,data5,data6,data7;
reg reset,clk,load;
wire [15:0] out;
wire En;
top_arch M0(out,En,data1,data2,data3,data4,data5,data6,data7,reset,clk,load);
/*wire [7:0]I,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16;
wire out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15;
shift_reg1 M1(P16,P1,P2,data1,reset,clk,load);
shift_reg2 M2(P15,P3,data2,reset,clk,load);
shift_reg3 M3(P14,P4,data3,reset,clk,load);
shift_reg4 M4(I,P13,P5,En,data4,reset,clk,load);
shift_reg3 M5(P12,P6,data5,reset,clk,load);
shift_reg2 M6(P11,P7,data6,reset,clk,load);
shift_reg1 M7(P10,P9,P8,data7,reset,clk,load);
com C1(out0,I,P1,reset,clk);
com C2(out1,I,P2,reset,clk);
com C3(out2,I,P3,reset,clk);
com C4(out3,I,P4,reset,clk);
com C5(out4,I,P5,reset,clk);
com C6(out5,I,P6,reset,clk);
com C7(out6,I,P7,reset,clk);
com C8(out7,I,P8,reset,clk);
com C9(out8,I,P9,reset,clk);
com C10(out9,I,P10,reset,clk);
com C11(out10,I,P11,reset,clk);
com C12(out11,I,P12,reset,clk);
com C13(out12,I,P13,reset,clk);
com C14(out13,I,P14,reset,clk);
com C15(out14,I,P15,reset,clk);
com C16(out15,I,P16,reset,clk);
count S1(out,out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,reset,clk);*/
initial begin
 $readmemh("D:/VIVADO/data.txt",mem);
 reset=1;
 #3
 reset=0;
 load=1;
 i=0;
clk=1;end
always
fork
begin
#5 clk=~clk;
#5 clk=~clk;
end
data1=mem[i];
data2=mem[200+i];
data3=mem[400+i];
data4=mem[600+i];
data5=mem[800+i];
data6=mem[1000+i];
data7=mem[1200+i];
#10 i=i+1;
join
endmodule
