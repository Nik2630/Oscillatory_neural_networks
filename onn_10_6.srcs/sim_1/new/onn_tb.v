`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2024 12:50:43
// Design Name: 
// Module Name: onn_tb
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

module onn_tb();
reg clk,reset,full_tick;
reg [(150*4)-1:0]phi_input;
wire s_clk;
wire [(150*4)-1:0]phi_output;

onn #(150) uut (.clk(clk),.reset(reset),.full_tick(full_tick),.phi_input(phi_input),.s_clk(s_clk),.phi_output(phi_output));

initial begin
clk = 0;
forever #0.01 clk = ~clk;
end

initial begin
reset = 1;
full_tick = 0;
phi_input = 600'h088880080080880088880088800008800008880088880088080080088880088880080080880088880088800008800008880088880088080080088880000088888008080808080000088888;
#0.02 
reset = 0;
full_tick = 1;
#0.1
full_tick = 0;
#20;
$finish;
end

endmodule