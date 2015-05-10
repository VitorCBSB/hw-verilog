module genetico(conf_les, conf_outs, in, out);

	input [13:0] conf_les[24:0];
	input [4:0] conf_outs[3:0];
	input [2:0] in;
	output [3:0] out;
	
	wire [24:0] le_out;
	wire [27:0] all_inputs;
	
	assign all_inputs = {le_out, in};
	
	assign out = {all_inputs[conf_outs[3]], all_inputs[conf_outs[2]], all_inputs[conf_outs[1]], all_inputs[conf_outs[0]]};
	
logic_e le00(
	.conf_func(conf_les[0][13:10]),
	.conf_ins(conf_les[0][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[0])
);

logic_e le10(
	.conf_func(conf_les[1][13:10]),
	.conf_ins(conf_les[1][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[1])
);

logic_e le20(
	.conf_func(conf_les[2][13:10]),
	.conf_ins(conf_les[2][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[2])
);

logic_e le30(
	.conf_func(conf_les[3][13:10]),
	.conf_ins(conf_les[3][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[3])
);

logic_e le40(
	.conf_func(conf_les[4][13:10]),
	.conf_ins(conf_les[4][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[4])
);

logic_e le01(
	.conf_func(conf_les[5][13:10]),
	.conf_ins(conf_les[5][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[5])
);

logic_e le11(
	.conf_func(conf_les[6][13:10]),
	.conf_ins(conf_les[6][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[6])
);

logic_e le21(
	.conf_func(conf_les[7][13:10]),
	.conf_ins(conf_les[7][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[7])
);

logic_e le31(
	.conf_func(conf_les[8][13:10]),
	.conf_ins(conf_les[8][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[8])
);

logic_e le41(
	.conf_func(conf_les[9][13:10]),
	.conf_ins(conf_les[9][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[9])
);

logic_e le02(
	.conf_func(conf_les[10][13:10]),
	.conf_ins(conf_les[10][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[10])
);

logic_e le12(
	.conf_func(conf_les[11][13:10]),
	.conf_ins(conf_les[11][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[11])
);

logic_e le22(
	.conf_func(conf_les[12][13:10]),
	.conf_ins(conf_les[12][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[12])
);

logic_e le32(
	.conf_func(conf_les[13][13:10]),
	.conf_ins(conf_les[13][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[13])
);

logic_e le42(
	.conf_func(conf_les[14][13:10]),
	.conf_ins(conf_les[14][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[14])
);

logic_e le03(
	.conf_func(conf_les[15][13:10]),
	.conf_ins(conf_les[15][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[15])
);

logic_e le13(
	.conf_func(conf_les[16][13:10]),
	.conf_ins(conf_les[16][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[16])
);

logic_e le23(
	.conf_func(conf_les[17][13:10]),
	.conf_ins(conf_les[17][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[17])
);

logic_e le33(
	.conf_func(conf_les[18][13:10]),
	.conf_ins(conf_les[18][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[18])
);

logic_e le43(
	.conf_func(conf_les[19][13:10]),
	.conf_ins(conf_les[19][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[19])
);

logic_e le04(
	.conf_func(conf_les[20][13:10]),
	.conf_ins(conf_les[20][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[20])
);

logic_e le14(
	.conf_func(conf_les[21][13:10]),
	.conf_ins(conf_les[21][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[21])
);

logic_e le24(
	.conf_func(conf_les[22][13:10]),
	.conf_ins(conf_les[22][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[22])
);

logic_e le34(
	.conf_func(conf_les[23][13:10]),
	.conf_ins(conf_les[23][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[23])
);

logic_e le44(
	.conf_func(conf_les[24][13:10]),
	.conf_ins(conf_les[24][9:0]),
	.all_inputs(all_inputs),
	.out(le_out[24])
);



endmodule