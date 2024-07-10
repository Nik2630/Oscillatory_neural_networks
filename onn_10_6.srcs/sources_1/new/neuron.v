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

module neurons #(parameter n = 150)(input clk,s_clk,reset,full_tick,[n-1:0]n_in,[(n*4)-1:0]phi_input, output [n-1:0]n_out,[(n*4)-1:0]phi_output);

wire [3:0]phi_in[n-1:0];
wire [3:0]phi_out[n-1:0];
assign {phi_in[0], phi_in[1], phi_in[2], phi_in[3], phi_in[4], phi_in[5], phi_in[6], phi_in[7], phi_in[8], phi_in[9], phi_in[10], phi_in[11], phi_in[12], phi_in[13], phi_in[14], phi_in[15], phi_in[16], phi_in[17], phi_in[18], phi_in[19], phi_in[20], phi_in[21], phi_in[22], phi_in[23], phi_in[24], phi_in[25], phi_in[26], phi_in[27], phi_in[28], phi_in[29], phi_in[30], phi_in[31], phi_in[32], phi_in[33], phi_in[34], phi_in[35], phi_in[36], phi_in[37], phi_in[38], phi_in[39], phi_in[40], phi_in[41], phi_in[42], phi_in[43], phi_in[44], phi_in[45], phi_in[46], phi_in[47], phi_in[48], phi_in[49], phi_in[50], phi_in[51], phi_in[52], phi_in[53], phi_in[54], phi_in[55], phi_in[56], phi_in[57], phi_in[58], phi_in[59], phi_in[60], phi_in[61], phi_in[62], phi_in[63], phi_in[64], phi_in[65], phi_in[66], phi_in[67], phi_in[68], phi_in[69], phi_in[70], phi_in[71], phi_in[72], phi_in[73], phi_in[74], phi_in[75], phi_in[76], phi_in[77], phi_in[78], phi_in[79], phi_in[80], phi_in[81], phi_in[82], phi_in[83], phi_in[84], phi_in[85], phi_in[86], phi_in[87], phi_in[88], phi_in[89], phi_in[90], phi_in[91], phi_in[92], phi_in[93], phi_in[94], phi_in[95], phi_in[96], phi_in[97], phi_in[98], phi_in[99], phi_in[100], phi_in[101], phi_in[102], phi_in[103], phi_in[104], phi_in[105], phi_in[106], phi_in[107], phi_in[108], phi_in[109], phi_in[110], phi_in[111], phi_in[112], phi_in[113], phi_in[114], phi_in[115], phi_in[116], phi_in[117], phi_in[118], phi_in[119], phi_in[120], phi_in[121], phi_in[122], phi_in[123], phi_in[124], phi_in[125], phi_in[126], phi_in[127], phi_in[128], phi_in[129], phi_in[130], phi_in[131], phi_in[132], phi_in[133], phi_in[134], phi_in[135], phi_in[136], phi_in[137], phi_in[138], phi_in[139], phi_in[140], phi_in[141], phi_in[142], phi_in[143], phi_in[144], phi_in[145], phi_in[146], phi_in[147], phi_in[148], phi_in[149]} = phi_input;
assign phi_output = {phi_in[0], phi_in[1], phi_in[2], phi_in[3], phi_in[4], phi_in[5], phi_in[6], phi_in[7], phi_in[8], phi_in[9], phi_in[10], phi_in[11], phi_in[12], phi_in[13], phi_in[14], phi_in[15], phi_in[16], phi_in[17], phi_in[18], phi_in[19], phi_in[20], phi_in[21], phi_in[22], phi_in[23], phi_in[24], phi_in[25], phi_in[26], phi_in[27], phi_in[28], phi_in[29], phi_in[30], phi_in[31], phi_in[32], phi_in[33], phi_in[34], phi_in[35], phi_in[36], phi_in[37], phi_in[38], phi_in[39], phi_in[40], phi_in[41], phi_in[42], phi_in[43], phi_in[44], phi_in[45], phi_in[46], phi_in[47], phi_in[48], phi_in[49], phi_in[50], phi_in[51], phi_in[52], phi_in[53], phi_in[54], phi_in[55], phi_in[56], phi_in[57], phi_in[58], phi_in[59], phi_in[60], phi_in[61], phi_in[62], phi_in[63], phi_in[64], phi_in[65], phi_in[66], phi_in[67], phi_in[68], phi_in[69], phi_in[70], phi_in[71], phi_in[72], phi_in[73], phi_in[74], phi_in[75], phi_in[76], phi_in[77], phi_in[78], phi_in[79], phi_in[80], phi_in[81], phi_in[82], phi_in[83], phi_in[84], phi_in[85], phi_in[86], phi_in[87], phi_in[88], phi_in[89], phi_in[90], phi_in[91], phi_in[92], phi_in[93], phi_in[94], phi_in[95], phi_in[96], phi_in[97], phi_in[98], phi_in[99], phi_in[100], phi_in[101], phi_in[102], phi_in[103], phi_in[104], phi_in[105], phi_in[106], phi_in[107], phi_in[108], phi_in[109], phi_in[110], phi_in[111], phi_in[112], phi_in[113], phi_in[114], phi_in[115], phi_in[116], phi_in[117], phi_in[118], phi_in[119], phi_in[120], phi_in[121], phi_in[122], phi_in[123], phi_in[124], phi_in[125], phi_in[126], phi_in[127], phi_in[128], phi_in[129], phi_in[130], phi_in[131], phi_in[132], phi_in[133], phi_in[134], phi_in[135], phi_in[136], phi_in[137], phi_in[138], phi_in[139], phi_in[140], phi_in[141], phi_in[142], phi_in[143], phi_in[144], phi_in[145], phi_in[146], phi_in[147], phi_in[148], phi_in[149]};
//reg [(n*4)-1:0] phi_display;
//always @(clk) begin
//    phi_display = {phi_out[0], phi_out[1], phi_out[2], phi_out[3], phi_out[4], phi_out[5], phi_out[6], phi_out[7], phi_out[8], phi_out[9], phi_out[10], phi_out[11], phi_out[12], phi_out[13], phi_out[14], phi_out[15], phi_out[16], phi_out[17], phi_out[18], phi_out[19], phi_out[20], phi_out[21], phi_out[22], phi_out[23], phi_out[24], phi_out[25], phi_out[26], phi_out[27], phi_out[28], phi_out[29], phi_out[30], phi_out[31], phi_out[32], phi_out[33], phi_out[34], phi_out[35], phi_out[36], phi_out[37], phi_out[38], phi_out[39], phi_out[40], phi_out[41], phi_out[42], phi_out[43], phi_out[44], phi_out[45], phi_out[46], phi_out[47], phi_out[48], phi_out[49], phi_out[50], phi_out[51], phi_out[52], phi_out[53], phi_out[54], phi_out[55], phi_out[56], phi_out[57], phi_out[58], phi_out[59], phi_out[60], phi_out[61], phi_out[62], phi_out[63], phi_out[64], phi_out[65], phi_out[66], phi_out[67], phi_out[68], phi_out[69], phi_out[70], phi_out[71], phi_out[72], phi_out[73], phi_out[74], phi_out[75], phi_out[76], phi_out[77], phi_out[78], phi_out[79], phi_out[80], phi_out[81], phi_out[82], phi_out[83], phi_out[84], phi_out[85], phi_out[86], phi_out[87], phi_out[88], phi_out[89], phi_out[90], phi_out[91], phi_out[92], phi_out[93], phi_out[94], phi_out[95], phi_out[96], phi_out[97], phi_out[98], phi_out[99], phi_out[100], phi_out[101], phi_out[102], phi_out[103], phi_out[104], phi_out[105], phi_out[106], phi_out[107], phi_out[108], phi_out[109], phi_out[110], phi_out[111], phi_out[112], phi_out[113], phi_out[114], phi_out[115], phi_out[116], phi_out[117], phi_out[118], phi_out[119], phi_out[120], phi_out[121], phi_out[122], phi_out[123], phi_out[124], phi_out[125], phi_out[126], phi_out[127], phi_out[128], phi_out[129], phi_out[130], phi_out[131], phi_out[132], phi_out[133], phi_out[134], phi_out[135], phi_out[136], phi_out[137], phi_out[138], phi_out[139], phi_out[140], phi_out[141], phi_out[142], phi_out[143], phi_out[144], phi_out[145], phi_out[146], phi_out[147], phi_out[148], phi_out[149], phi_out[150], phi_out[151], phi_out[152], phi_out[153], phi_out[154], phi_out[155], phi_out[156], phi_out[157], phi_out[158], phi_out[159], phi_out[160], phi_out[161], phi_out[162], phi_out[163], phi_out[164], phi_out[165], phi_out[166], phi_out[167], phi_out[168], phi_out[169], phi_out[170], phi_out[171], phi_out[172], phi_out[173], phi_out[174], phi_out[175], phi_out[176], phi_out[177], phi_out[178], phi_out[179], phi_out[180], phi_out[181], phi_out[182], phi_out[183], phi_out[184], phi_out[185], phi_out[186], phi_out[187], phi_out[188], phi_out[189], phi_out[190], phi_out[191], phi_out[192], phi_out[193], phi_out[194], phi_out[195], phi_out[196], phi_out[197], phi_out[198], phi_out[199], phi_out[200], phi_out[201], phi_out[202], phi_out[203], phi_out[204], phi_out[205], phi_out[206], phi_out[207], phi_out[208], phi_out[209], phi_out[210], phi_out[211], phi_out[212], phi_out[213], phi_out[214], phi_out[215], phi_out[216], phi_out[217], phi_out[218], phi_out[219], phi_out[220], phi_out[221], phi_out[222], phi_out[223], phi_out[224], phi_out[225], phi_out[226], phi_out[227], phi_out[228], phi_out[229], phi_out[230], phi_out[231], phi_out[232], phi_out[233], phi_out[234], phi_out[235], phi_out[236], phi_out[237], phi_out[238], phi_out[239], phi_out[240], phi_out[241], phi_out[242], phi_out[243], phi_out[244], phi_out[245], phi_out[246], phi_out[247], phi_out[248], phi_out[249], phi_out[250], phi_out[251], phi_out[252], phi_out[253], phi_out[254], phi_out[255], phi_out[256], phi_out[257], phi_out[258], phi_out[259], phi_out[260], phi_out[261], phi_out[262], phi_out[263], phi_out[264], phi_out[265], phi_out[266], phi_out[267], phi_out[268], phi_out[269], phi_out[270], phi_out[271], phi_out[272], phi_out[273], phi_out[274], phi_out[275], phi_out[276], phi_out[277], phi_out[278], phi_out[279], phi_out[280], phi_out[281], phi_out[282], phi_out[283], phi_out[284], phi_out[285], phi_out[286], phi_out[287], phi_out[288], phi_out[289], phi_out[290], phi_out[291], phi_out[292], phi_out[293], phi_out[294], phi_out[295], phi_out[296], phi_out[297], phi_out[298], phi_out[299], phi_out[300], phi_out[301], phi_out[302], phi_out[303], phi_out[304], phi_out[305], phi_out[306], phi_out[307], phi_out[308], phi_out[309], phi_out[310], phi_out[311], phi_out[312], phi_out[313], phi_out[314], phi_out[315], phi_out[316], phi_out[317], phi_out[318], phi_out[319], phi_out[320], phi_out[321], phi_out[322], phi_out[323], phi_out[324], phi_out[325], phi_out[326], phi_out[327], phi_out[328], phi_out[329], phi_out[330], phi_out[331], phi_out[332], phi_out[333], phi_out[334], phi_out[335], phi_out[336], phi_out[337], phi_out[338], phi_out[339], phi_out[340], phi_out[341], phi_out[342], phi_out[343], phi_out[344], phi_out[345], phi_out[346], phi_out[347], phi_out[348], phi_out[349], phi_out[350], phi_out[351], phi_out[352], phi_out[353], phi_out[354], phi_out[355], phi_out[356], phi_out[357], phi_out[358], phi_out[359], phi_out[360], phi_out[361], phi_out[362], phi_out[363], phi_out[364], phi_out[365], phi_out[366], phi_out[367], phi_out[368], phi_out[369], phi_out[370], phi_out[371], phi_out[372], phi_out[373], phi_out[374], phi_out[375], phi_out[376], phi_out[377], phi_out[378], phi_out[379], phi_out[380], phi_out[381], phi_out[382], phi_out[383], phi_out[384], phi_out[385], phi_out[386], phi_out[387], phi_out[388], phi_out[389], phi_out[390], phi_out[391], phi_out[392], phi_out[393], phi_out[394], phi_out[395], phi_out[396], phi_out[397], phi_out[398], phi_out[399], phi_out[400], phi_out[401], phi_out[402], phi_out[403], phi_out[404], phi_out[405], phi_out[406], phi_out[407], phi_out[408], phi_out[409], phi_out[410], phi_out[411], phi_out[412], phi_out[413], phi_out[414], phi_out[415], phi_out[416], phi_out[417], phi_out[418], phi_out[419], phi_out[420], phi_out[421], phi_out[422], phi_out[423], phi_out[424], phi_out[425], phi_out[426], phi_out[427], phi_out[428], phi_out[429], phi_out[430], phi_out[431], phi_out[432], phi_out[433], phi_out[434], phi_out[435], phi_out[436], phi_out[437], phi_out[438], phi_out[439], phi_out[440], phi_out[441], phi_out[442], phi_out[443], phi_out[444], phi_out[445], phi_out[446], phi_out[447], phi_out[448], phi_out[449], phi_out[450], phi_out[451], phi_out[452], phi_out[453], phi_out[454], phi_out[455], phi_out[456], phi_out[457], phi_out[458], phi_out[459], phi_out[460], phi_out[461], phi_out[462], phi_out[463], phi_out[464], phi_out[465], phi_out[466], phi_out[467], phi_out[468], phi_out[469], phi_out[470], phi_out[471], phi_out[472], phi_out[473], phi_out[474], phi_out[475], phi_out[476], phi_out[477], phi_out[478], phi_out[479], phi_out[480], phi_out[481], phi_out[482], phi_out[483], phi_out[484], phi_out[485], phi_out[486], phi_out[487], phi_out[488], phi_out[489], phi_out[490], phi_out[491], phi_out[492], phi_out[493], phi_out[494], phi_out[495], phi_out[496], phi_out[497], phi_out[498], phi_out[499], phi_out[500], phi_out[501], phi_out[502], phi_out[503], phi_out[504], phi_out[505], phi_out[506], phi_out[507], phi_out[508], phi_out[509], phi_out[510], phi_out[511], phi_out[512], phi_out[513], phi_out[514], phi_out[515], phi_out[516], phi_out[517], phi_out[518], phi_out[519], phi_out[520], phi_out[521], phi_out[522], phi_out[523], phi_out[524], phi_out[525], phi_out[526], phi_out[527], phi_out[528], phi_out[529], phi_out[530], phi_out[531], phi_out[532], phi_out[533], phi_out[534], phi_out[535], phi_out[536], phi_out[537], phi_out[538], phi_out[539], phi_out[540], phi_out[541], phi_out[542], phi_out[543], phi_out[544], phi_out[545], phi_out[546], phi_out[547], phi_out[548], phi_out[549], phi_out[550], phi_out[551], phi_out[552], phi_out[553], phi_out[554], phi_out[555], phi_out[556], phi_out[557], phi_out[558], phi_out[559], phi_out[560], phi_out[561], phi_out[562], phi_out[563], phi_out[564], phi_out[565], phi_out[566], phi_out[567], phi_out[568], phi_out[569], phi_out[570], phi_out[571], phi_out[572], phi_out[573], phi_out[574], phi_out[575], phi_out[576], phi_out[577], phi_out[578], phi_out[579], phi_out[580], phi_out[581], phi_out[582], phi_out[583], phi_out[584], phi_out[585], phi_out[586], phi_out[587], phi_out[588], phi_out[589], phi_out[590], phi_out[591], phi_out[592], phi_out[593], phi_out[594], phi_out[595], phi_out[596], phi_out[597], phi_out[598], phi_out[599], phi_out[600], phi_out[601], phi_out[602], phi_out[603], phi_out[604], phi_out[605], phi_out[606], phi_out[607], phi_out[608], phi_out[609], phi_out[610], phi_out[611], phi_out[612], phi_out[613], phi_out[614], phi_out[615], phi_out[616], phi_out[617], phi_out[618], phi_out[619], phi_out[620], phi_out[621], phi_out[622], phi_out[623], phi_out[624], phi_out[625], phi_out[626], phi_out[627], phi_out[628], phi_out[629], phi_out[630], phi_out[631], phi_out[632], phi_out[633], phi_out[634], phi_out[635], phi_out[636], phi_out[637], phi_out[638], phi_out[639], phi_out[640], phi_out[641], phi_out[642], phi_out[643], phi_out[644], phi_out[645], phi_out[646], phi_out[647], phi_out[648], phi_out[649], phi_out[650], phi_out[651], phi_out[652], phi_out[653], phi_out[654], phi_out[655], phi_out[656], phi_out[657], phi_out[658], phi_out[659], phi_out[660], phi_out[661], phi_out[662], phi_out[663], phi_out[664], phi_out[665], phi_out[666], phi_out[667], phi_out[668], phi_out[669], phi_out[670], phi_out[671], phi_out[672], phi_out[673], phi_out[674], phi_out[675], phi_out[676], phi_out[677], phi_out[678], phi_out[679], phi_out[680], phi_out[681], phi_out[682], phi_out[683], phi_out[684], phi_out[685], phi_out[686], phi_out[687], phi_out[688], phi_out[689], phi_out[690], phi_out[691], phi_out[692], phi_out[693], phi_out[694], phi_out[695], phi_out[696], phi_out[697], phi_out[698], phi_out[699], phi_out[700], phi_out[701], phi_out[702], phi_out[703], phi_out[704], phi_out[705], phi_out[706], phi_out[707], phi_out[708], phi_out[709], phi_out[710], phi_out[711], phi_out[712], phi_out[713], phi_out[714], phi_out[715], phi_out[716], phi_out[717], phi_out[718], phi_out[719], phi_out[720], phi_out[721], phi_out[722], phi_out[723], phi_out[724], phi_out[725], phi_out[726], phi_out[727], phi_out[728], phi_out[729], phi_out[730], phi_out[731], phi_out[732], phi_out[733], phi_out[734], phi_out[735], phi_out[736], phi_out[737], phi_out[738], phi_out[739], phi_out[740], phi_out[741], phi_out[742], phi_out[743], phi_out[744], phi_out[745], phi_out[746], phi_out[747], phi_out[748], phi_out[749], phi_out[750], phi_out[751], phi_out[752], phi_out[753], phi_out[754], phi_out[755], phi_out[756], phi_out[757], phi_out[758], phi_out[759], phi_out[760], phi_out[761], phi_out[762], phi_out[763], phi_out[764], phi_out[765], phi_out[766], phi_out[767], phi_out[768], phi_out[769], phi_out[770], phi_out[771], phi_out[772], phi_out[773], phi_out[774], phi_out[775], phi_out[776], phi_out[777], phi_out[778], phi_out[779], phi_out[780], phi_out[781], phi_out[782], phi_out[783]};
//    $display ("phi display=%0h",phi_display);
    
//end
genvar i;
generate
    for (i = 0; i < n; i = i + 1) begin : neuron
        neuron neuron_inst (
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

module neuron(input clk,s_clk,reset,full_tick,n_in,[3:0]phi_in, output reg [3:0]phi_reg, output n_out);
wire [3:0]phi_out;
always @(posedge reset or posedge full_tick) begin
    if (reset)
        phi_reg <= 0;
    else if (full_tick)
        phi_reg <= phi_in; 
//    else  
//        phi_reg = phi_out;
end

always @(phi_out)begin
    phi_reg = phi_out;
end

phase_calculator ph_cal_inst (s_clk,reset,n_in,n_out,phi_reg,phi_out);
phase_controlled_osci ph_osci_inst ( reset,s_clk,phi_reg, n_out );

endmodule

module phase_controlled_osci(input reset,clk,[3:0]phi_out,output reg n_out );

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

module phase_calculator (
    input clk,
    input reset,
    input nin,
    input nout,
    input [3:0] phi_in,
    output reg [3:0] phi_out
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
reg [3:0] counter;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        counter <= 4'd0;
        phi_out <= 4'd0;
    end else begin
        case (state)
            IDLE: begin
                if (nin_rising_edge) begin
                    state <= WAIT_NOUT;
                    counter <= 4'd0;
                end
                if (nout_rising_edge) begin
                    state <= WAIT_NIN;
                    counter <= 4'd0;
                end
            end
            WAIT_NOUT: begin
                if (nout_rising_edge) begin
                    state <= IDLE;
                    phi_out <= phi_in + counter;
                end else begin
                    counter <= counter + 4'd1;
                end
            end
            WAIT_NIN: begin
                if (nin_rising_edge) begin
                    state <= IDLE;
                    phi_out <= phi_in - counter;
                end else begin
                    counter <= counter + 4'd1;
                end
            end
        endcase
    end
end

endmodule