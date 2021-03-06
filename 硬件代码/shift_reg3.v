`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/07 16:32:14
// Design Name: 
// Module Name: shift_reg3
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


module shift_reg3(
output reg [7:0] P1,P2,
input [7:0] data,
input reset,clk,load
);
reg [7:0] memory1,memory2,memory3,memory4,memory5,memory6,memory7;
always @(posedge clk,posedge reset)
begin 
    if(reset)   begin
    memory1<=0;
    memory2<=0;
    memory3<=0;
    memory4<=0;
    memory5<=0;
    memory6<=0;
    memory7<=0;end
    else if(load)
    P1<=memory7;
    P2<=memory1;
    memory1<=data;
    memory2<=memory1;
    memory3<=memory2;
    memory4<=memory3;
    memory5<=memory4;
    memory6<=memory5;
    memory7<=memory6;end
endmodule
