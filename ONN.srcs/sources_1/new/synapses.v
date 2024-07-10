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


module synapses(input s_clk, [14:0]n_out, output reg [14:0]n_in);


reg signed [3:0] weights [14:0][14:0];
initial begin
    weights[0][0] = 0;
    weights[0][1] = 3;
    weights[0][2] = 1;
    weights[0][3] = 1;
    weights[0][4] = -1;
    weights[0][5] = 1;
    weights[0][6] = 3;
    weights[0][7] = 1;
    weights[0][8] = 1;
    weights[0][9] = 3;
    weights[0][10] = -1;
    weights[0][11] = -1;
    weights[0][12] = 3;
    weights[0][13] = 3;
    weights[0][14] = 1;

    weights[1][0] = 3;
    weights[1][1] = 0;
    weights[1][2] = 1;
    weights[1][3] = 1;
    weights[1][4] = -1;
    weights[1][5] = 1;
    weights[1][6] = 3;
    weights[1][7] = 1;
    weights[1][8] = 1;
    weights[1][9] = 3;
    weights[1][10] = -1;
    weights[1][11] = -1;
    weights[1][12] = 3;
    weights[1][13] = 3;
    weights[1][14] = 1;

    weights[2][0] = 1;
    weights[2][1] = 1;
    weights[2][2] = 0;
    weights[2][3] = -1;
    weights[2][4] = -3;
    weights[2][5] = 3;
    weights[2][6] = 1;
    weights[2][7] = -1;
    weights[2][8] = 3;
    weights[2][9] = 1;
    weights[2][10] = -3;
    weights[2][11] = 1;
    weights[2][12] = 1;
    weights[2][13] = 1;
    weights[2][14] = 3;

    weights[3][0] = 1;
    weights[3][1] = 1;
    weights[3][2] = -1;
    weights[3][3] = 0;
    weights[3][4] = 1;
    weights[3][5] = -1;
    weights[3][6] = 1;
    weights[3][7] = -1;
    weights[3][8] = -1;
    weights[3][9] = 1;
    weights[3][10] = 1;
    weights[3][11] = 1;
    weights[3][12] = 1;
    weights[3][13] = 1;
    weights[3][14] = -1;

    weights[4][0] = -1;
    weights[4][1] = -1;
    weights[4][2] = -3;
    weights[4][3] = 1;
    weights[4][4] = 0;
    weights[4][5] = -3;
    weights[4][6] = -1;
    weights[4][7] = 1;
    weights[4][8] = -3;
    weights[4][9] = -1;
    weights[4][10] = 3;
    weights[4][11] = -1;
    weights[4][12] = -1;
    weights[4][13] = -1;
    weights[4][14] = -3;

    weights[5][0] = 1;
    weights[5][1] = 1;
    weights[5][2] = 3;
    weights[5][3] = -1;
    weights[5][4] = -3;
    weights[5][5] = 0;
    weights[5][6] = 1;
    weights[5][7] = -1;
    weights[5][8] = 3;
    weights[5][9] = 1;
    weights[5][10] = -3;
    weights[5][11] = 1;
    weights[5][12] = 1;
    weights[5][13] = 1;
    weights[5][14] = 3;

    weights[6][0] = 3;
    weights[6][1] = 3;
    weights[6][2] = 1;
    weights[6][3] = 1;
    weights[6][4] = -1;
    weights[6][5] = 1;
    weights[6][6] = 0;
    weights[6][7] = 1;
    weights[6][8] = 1;
    weights[6][9] = 3;
    weights[6][10] = -1;
    weights[6][11] = -1;
    weights[6][12] = 3;
    weights[6][13] = 3;
    weights[6][14] = 1;

    weights[7][0] = 1;
    weights[7][1] = 1;
    weights[7][2] = -1;
    weights[7][3] = -1;
    weights[7][4] = 1;
    weights[7][5] = -1;
    weights[7][6] = 1;
    weights[7][7] = 0;
    weights[7][8] = -1;
    weights[7][9] = 1;
    weights[7][10] = 1;
    weights[7][11] = -3;
    weights[7][12] = 1;
    weights[7][13] = 1;
    weights[7][14] = -1;

    weights[8][0] = 1;
    weights[8][1] = 1;
    weights[8][2] = 3;
    weights[8][3] = -1;
    weights[8][4] = -3;
    weights[8][5] = 3;
    weights[8][6] = 1;
    weights[8][7] = -1;
    weights[8][8] = 0;
    weights[8][9] = 1;
    weights[8][10] = -3;
    weights[8][11] = 1;
    weights[8][12] = 1;
    weights[8][13] = 1;
    weights[8][14] = 3;

    weights[9][0] = 3;
    weights[9][1] = 3;
    weights[9][2] = 1;
    weights[9][3] = 1;
    weights[9][4] = -1;
    weights[9][5] = 1;
    weights[9][6] = 3;
    weights[9][7] = 1;
    weights[9][8] = 1;
    weights[9][9] = 0;
    weights[9][10] = -1;
    weights[9][11] = -1;
    weights[9][12] = 3;
    weights[9][13] = 3;
    weights[9][14] = 1;

    weights[10][0] = -1;
    weights[10][1] = -1;
    weights[10][2] = -3;
    weights[10][3] = 1;
    weights[10][4] = 3;
    weights[10][5] = -3;
    weights[10][6] = -1;
    weights[10][7] = 1;
    weights[10][8] = -3;
    weights[10][9] = -1;
    weights[10][10] = 0;
    weights[10][11] = -1;
    weights[10][12] = -1;
    weights[10][13] = -1;
    weights[10][14] = -3;

    weights[11][0] = -1;
    weights[11][1] = -1;
    weights[11][2] = 1;
    weights[11][3] = 1;
    weights[11][4] = -1;
    weights[11][5] = 1;
    weights[11][6] = -1;
    weights[11][7] = -3;
    weights[11][8] = 1;
    weights[11][9] = -1;
    weights[11][10] = -1;
    weights[11][11] = 0;
    weights[11][12] = -1;
    weights[11][13] = -1;
    weights[11][14] = 1;

    weights[12][0] = 3;
    weights[12][1] = 3;
    weights[12][2] = 1;
    weights[12][3] = 1;
    weights[12][4] = -1;
    weights[12][5] = 1;
    weights[12][6] = 3;
    weights[12][7] = 1;
    weights[12][8] = 1;
    weights[12][9] = 3;
    weights[12][10] = -1;
    weights[12][11] = -1;
    weights[12][12] = 0;
    weights[12][13] = 3;
    weights[12][14] = 1;

    weights[13][0] = 3;
    weights[13][1] = 3;
    weights[13][2] = 1;
    weights[13][3] = 1;
    weights[13][4] = -1;
    weights[13][5] = 1;
    weights[13][6] = 3;
    weights[13][7] = 1;
    weights[13][8] = 1;
    weights[13][9] = 3;
    weights[13][10] = -1;
    weights[13][11] = -1;
    weights[13][12] = 3;
    weights[13][13] = 0;
    weights[13][14] = 1;

    weights[14][0] = 1;
    weights[14][1] = 1;
    weights[14][2] = 3;
    weights[14][3] = -1;
    weights[14][4] = -3;
    weights[14][5] = 3;
    weights[14][6] = 1;
    weights[14][7] = -1;
    weights[14][8] = 3;
    weights[14][9] = 1;
    weights[14][10] = -3;
    weights[14][11] = 1;
    weights[14][12] = 1;
    weights[14][13] = 1;
    weights[14][14] = 0;
    
end


reg signed [6:0] sum ;
integer i, j;

always @(posedge s_clk) begin

for (i = 0; i < 15; i = i + 1) begin
    sum = 0;
    for (j = 0; j < 15; j = j + 1) begin
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
