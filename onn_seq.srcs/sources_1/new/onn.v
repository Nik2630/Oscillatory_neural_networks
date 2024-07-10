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



module onn #(parameter n = 784)(input clk,reset,full_tick,out_tick,[3:0]phi_input,output s_clk,reg [3:0]phi_output);
wire [n-1:0]n_in;
wire [n-1:0]n_out;
wire [(n*4)-1:0]phi_output_con;
clk_divider clk_divider_inst (.clk(clk),.s_clk(s_clk));

neurons #(n) neurons_inst (.clk(clk),.s_clk(s_clk),.reset(reset),.full_tick(full_tick),.n_in(n_in),.phi_input(phi_input),.n_out(n_out),.phi_output(phi_output_con));

synapses #(n) synapses_inst (.s_clk(s_clk),.n_out(n_out),.n_in(n_in));

integer ct;
reg [(n*4)-1:0]phi_prv;
always @(posedge out_tick) begin
ct = 0;
end
integer j;
always @(posedge s_clk) begin
    if (out_tick) begin
        ct = ct+1;
        phi_prv = phi_output_con;
        if (ct == 20) begin
            if (phi_prv == phi_output_con) begin
                for (j = 783; j >= 0; j = j + 1) begin
                    phi_output = phi_output_con[(4*(j+1))-1:(4*j)];
                    #1;
                end
            end
        end
    end
end

endmodule