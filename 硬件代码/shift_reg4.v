`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/07 16:34:34
// Design Name: 
// Module Name: shift_reg4
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


module shift_reg4(
output reg [7:0] I,P1,P2,
output reg En,
input [7:0] data,
input reset,clk,load
);
reg [7:0] memory1,memory2,memory3,memory4,memory5,memory6,memory7;
integer count;
always @(posedge clk,posedge reset)
begin
    if(reset)   begin
    memory1<=0;
    memory2<=0;
    memory3<=0;
    memory4<=0;
    memory5<=0;
    memory6<=0;
    memory7<=0;
    count<=0;
    En<=0;
    end
    else if(load)   begin count<=count+1;
    if(count>=7)    En=1;
    else En=0;
    I<=memory4;
    P1<=memory7;
    P2<=memory1;
    memory1<=data;
    memory2<=memory1;
    memory3<=memory2;
    memory4<=memory3;
    memory5<=memory4;
    memory6<=memory5;
    memory7<=memory6;end
    end
endmodule
