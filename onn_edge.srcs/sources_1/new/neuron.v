`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2024 13:47:34
// Design Name: 
// Module Name: neuron
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

module neurons #(parameter n = 1, m = 11, r = 4)(input clk,s_clk,reset,full_tick,[(n*m)-1:0]n_in,[(n*m*r)-1:0]phi_input, output [(n*m)-1:0]n_out,[(n*m*r)-1:0]phi_output);

wire [r-1:0]phi_in[(n*m)-1:0];
wire [r-1:0]phi_out[(n*m)-1:0];
assign {phi_in[0], phi_in[1], phi_in[2], phi_in[3], phi_in[4], phi_in[5], phi_in[6], phi_in[7], phi_in[8], phi_in[9], phi_in[10]} = phi_input;
assign phi_output = {phi_out[0], phi_out[1], phi_out[2], phi_out[3], phi_out[4], phi_out[5], phi_out[6], phi_out[7], phi_out[8], phi_out[9], phi_out[10]};

genvar i;
generate
    for (i = 0; i < (n*m); i = i + 1) begin : neuron
        neuron #(r) neuron_inst (
            .clk(clk),
            .s_clk(s_clk),
            .reset(reset),
            .full_tick(full_tick),
            .n_in(n_in[i]),
            .phi_in(phi_in[i]),
            .n_out(n_out[i]),
            .phi_reg(phi_out[i])
        );
    end
endgenerate

endmodule

module neuron #(parameter r = 4)(input clk,s_clk,reset,full_tick,n_in,[r-1:0]phi_in, output reg [r-1:0]phi_reg, output n_out);
wire [r-1:0]phi_out;
always @(posedge reset or posedge full_tick) begin
    if (reset)
        phi_reg <= 0;
    else if (full_tick)
        phi_reg <= phi_in;   
end

always @(phi_out) begin
    phi_reg = phi_out;
end

phase_calculator #(r) ph_cal_inst (s_clk,reset,n_in,n_out,phi_reg,phi_out);
phase_controlled_osci #(r) ph_osci_inst ( reset,s_clk,phi_reg, n_out );

endmodule

module phase_controlled_osci #(parameter r = 4)(input reset,clk,[r-1:0]phi_out,output reg n_out );

reg [15:0]cir_shift_reg;
always @(posedge clk or posedge reset)
begin
    if (reset)
        cir_shift_reg <= 16'b1111111100000000;
    else
        cir_shift_reg <= {cir_shift_reg[0], cir_shift_reg[15:1]}; // Circular shift
    
end

always @(phi_out,cir_shift_reg) begin
    case (phi_out)
        4'b0000: n_out = cir_shift_reg[0];
        4'b0001: n_out = cir_shift_reg[1];
        4'b0010: n_out = cir_shift_reg[2];
        4'b0011: n_out = cir_shift_reg[3];
        4'b0100: n_out = cir_shift_reg[4];
        4'b0101: n_out = cir_shift_reg[5];
        4'b0110: n_out = cir_shift_reg[6];
        4'b0111: n_out = cir_shift_reg[7];
        4'b1000: n_out = cir_shift_reg[8];
        4'b1001: n_out = cir_shift_reg[9];
        4'b1010: n_out = cir_shift_reg[10];
        4'b1011: n_out = cir_shift_reg[11];
        4'b1100: n_out = cir_shift_reg[12];
        4'b1101: n_out = cir_shift_reg[13];
        4'b1110: n_out = cir_shift_reg[14];
        4'b1111: n_out = cir_shift_reg[15];
    endcase
end

endmodule

module phase_calculator #(parameter r = 4)(
    input clk,
    input reset,
    input nin,
    input nout,
    input [r-1:0] phi_in,
    output reg [r-1:0] phi_out
);

// Edge detectors
reg nin_prev, nout_prev;
wire nin_rising_edge, nout_rising_edge;

assign nin_rising_edge = ~nin_prev & nin;
assign nout_rising_edge = ~nout_prev & nout;

always @(posedge clk) begin
    nin_prev <= nin;
    nout_prev <= nout;
end

// Finite State Machine (FSM)
localparam IDLE = 2'b00,
            WAIT_NOUT = 2'b01,
            WAIT_NIN = 2'b10;

reg [1:0] state;
reg [r-1:0] counter;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        counter <= 0;
        phi_out <= 0;
    end else begin
        case (state)
            IDLE: begin
                if (nin_rising_edge) begin
                    state <= WAIT_NOUT;
                    counter <= 0;
                end
                if (nout_rising_edge) begin
                    state <= WAIT_NIN;
                    counter <= 0;
                end
            end
            WAIT_NOUT: begin
                if (nout_rising_edge) begin
                    state <= IDLE;
//                    phi_out <= phi_in + counter;
                    if (phi_in+ counter> 8) begin 
                        phi_out <= 16 - phi_in - counter;
                    end 
                    else begin phi_out <= phi_in +counter; end
                end else begin
                    counter <= counter + 4'd1;
                end
            end
            WAIT_NIN: begin
                if (nin_rising_edge) begin
                    state <= IDLE;
//                    phi_out <= phi_in - counter;
                    if (phi_in- counter> 8) begin 
                        phi_out <= 16 - phi_in + counter;
                    end 
                    else begin phi_out <= phi_in - counter; end
                end else begin
                    counter <= counter + 4'd1;
                end
            end
        endcase
    end
end

endmodule