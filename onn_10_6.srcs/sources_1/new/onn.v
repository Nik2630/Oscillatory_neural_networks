`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2024 11:54:13
// Design Name: 
// Module Name: onn
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



module onn #(parameter n = 150)(input clk,reset,full_tick,[(n*4)-1:0]phi_input,output s_clk,[(n*4)-1:0]phi_output);
wire [n-1:0]n_in;
wire [n-1:0]n_out;
clk_divider clk_divider_inst (.clk(clk),.s_clk(s_clk));

neurons #(n) neurons_inst (.clk(clk),.s_clk(s_clk),.reset(reset),.full_tick(full_tick),.n_in(n_in),.phi_input(phi_input),.n_out(n_out),.phi_output(phi_output));

synapses #(n) synapses_inst (.s_clk(s_clk),.n_out(n_out),.n_in(n_in));

endmodule