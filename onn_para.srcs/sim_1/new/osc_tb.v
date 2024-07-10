`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2024 12:31:59
// Design Name: 
// Module Name: osc_tb
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


module osc_tb();
reg clk, reset;
reg [3:0]phi_out;
wire n_out;

phase_controlled_osci uut (reset,clk,phi_out,n_out);

initial begin
clk = 0;
forever #1 clk = ~clk;
end 

initial begin
reset = 1;
phi_out = 0;
#2
reset = 0;
#100
phi_out = 8;
#100
phi_out = 6;
#100
phi_out = 4;
#100;
$finish;
end
endmodule
