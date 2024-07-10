`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2024 09:15:37
// Design Name: 
// Module Name: synapses
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


module synapses #(parameter n = 1, m = 11)(input s_clk, [(n*m)-1:0]n_out, output reg [(n*m)-1:0]n_in);


reg signed [4:0] weights [(n*m)-1:0][(n*m)-1:0];

initial begin
    weights[0][0] = 0;   weights[0][1] = 0;   weights[0][2] = 0;   weights[0][3] = 0;   weights[0][4] = 0;   weights[0][5] = 0;   weights[0][6] = 0;   weights[0][7] = 0;   weights[0][8] = 0;   weights[0][9] = 0;   weights[0][10] = 0;
    weights[1][0] = 0;   weights[1][1] = 0;   weights[1][2] = 0;   weights[1][3] = 0;   weights[1][4] = 0;   weights[1][5] = 0;   weights[1][6] = 0;   weights[1][7] = 0;   weights[1][8] = 0;   weights[1][9] = 0;  weights[1][10] = 0;
    weights[2][0] = 0;   weights[2][1] = 0;   weights[2][2] = 0;   weights[2][3] = 0;   weights[2][4] = 0;   weights[2][5] = 0;   weights[2][6] = 0;   weights[2][7] = 0;   weights[2][8] = 0;   weights[2][9] = 0;   weights[2][10] = 0;
    weights[3][0] = 0;   weights[3][1] = 0;   weights[3][2] = 0;   weights[3][3] = 0;   weights[3][4] = 0;   weights[3][5] = 0;   weights[3][6] = 0;   weights[3][7] = 0;   weights[3][8] = 0;   weights[3][9] = 0;   weights[3][10] = 0;
    weights[4][0] = 0;   weights[4][1] = 0;   weights[4][2] = 0;   weights[4][3] = 0;   weights[4][4] = 0;   weights[4][5] = 0;   weights[4][6] = 0;   weights[4][7] = 0;   weights[4][8] = 0;   weights[4][9] = 0;   weights[4][10] = 0;
    weights[5][0] = 0;   weights[5][1] = 0;   weights[5][2] = 0;   weights[5][3] = 0;   weights[5][4] = 0;   weights[5][5] = 0;   weights[5][6] = 0;   weights[5][7] = 0;   weights[5][8] = 0;   weights[5][9] = 0;   weights[5][10] = 0;
    weights[6][0] = 0;   weights[6][1] = 0;   weights[6][2] = 0;   weights[6][3] = 0;   weights[6][4] = 0;   weights[6][5] = 0;   weights[6][6] = 0;   weights[6][7] = 0;   weights[6][8] = 0;   weights[6][9] = 0;  weights[6][10] = 0;
    weights[7][0] = 0;   weights[7][1] = 0;   weights[7][2] = 0;   weights[7][3] = 0;   weights[7][4] = 0;   weights[7][5] = 0;   weights[7][6] = 0;   weights[7][7] = 0;   weights[7][8] = 0;   weights[7][9] = 0;  weights[7][10] = 0;
    weights[8][0] = 0;   weights[8][1] = 0;   weights[8][2] = 0;   weights[8][3] = 0;   weights[8][4] = 0;   weights[8][5] = 0;   weights[8][6] = 0;   weights[8][7] = 0;   weights[8][8] = 0;   weights[8][9] = 0;   weights[8][10] = 0;
    weights[9][0] = 0;  weights[9][1] = -2;  weights[9][2] = 2;   weights[9][3] = 2;   weights[9][4] = 0;   weights[9][5] = 2;   weights[9][6] = -2;   weights[9][7] = -2;  weights[9][8] = 0;   weights[9][9] = 0;   weights[9][10] = 2;
    weights[10][0] = 0; weights[10][1] = -2; weights[10][2] = 2;  weights[10][3] = 2;  weights[10][4] = 0;  weights[10][5] = 2;  weights[10][6] = -2;  weights[10][7] = -2; weights[10][8] = 0;  weights[10][9] = 2;  weights[10][10] = 0;
end


reg signed [6:0] sum ;
integer i, j;

always @(posedge s_clk) begin

for (i = 0; i < (n*m); i = i + 1) begin
    sum = 0;
    for (j = 0; j < (n*m); j = j + 1) begin
        if (n_out[j] == 1)
            sum = sum + weights[i][j];
        else if (n_out[j] == 0)
            sum = sum - weights[i][j];
    
    if (sum > 0)
        n_in[i] <= 1;
    else
        n_in[i] <= 0;

    end
    end
end

endmodule
