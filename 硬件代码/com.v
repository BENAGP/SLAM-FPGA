`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/07 16:47:41
// Design Name: 
// Module Name: com
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


module com(
output reg out,
input [7:0] I,P
);
wire [8:0]   i;
wire [8:0] I_sub_i;
wire [8:0] I_add_i;
assign i=I>>2;
assign I_sub_i=I-i;
assign I_add_i=I+i;
wire [9:0]P_sub;
wire [9:0]P_add;
assign P_sub=P-I_sub_i;
assign P_add=P-I_add_i;
wire s0,s1;
assign s0=P_sub[9];
assign s1=P_add[9];
always@(*) begin    
    case({s0,s1})
    2'b00:  out=1;
    2'b01:  out=0;
    2'b10:  out=0;
    2'b11:  out=1;
    endcase
end 
/*always @(posedge clk,posedge reset) 
begin
    if(reset)   i<=0;
    else    begin   
        i=I>>2;
        if(P<I-i) out=1;
        else if(P>I+i)  out=1;
        else out=0;
        end
end*/        
endmodule
