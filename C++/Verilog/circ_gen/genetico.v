module genetico(conf_les, conf_outs, in, out);

	input [10:0] conf_les[8:0];
	input [3:0] conf_outs[1:0];
	input [2:0] in;
	output [1:0] out;
	
	wire [8:0] le_out;
	wire [11:0] all_inputs;
	
	assign all_inputs = {le_out, in};
	
	assign out = {all_inputs[conf_outs[1]], all_inputs[conf_outs[0]]};
	
logic_e le00(
	.conf_func(conf_les[0][10:8]),
	.conf_ins(conf_les[0][7:0]),
	.all_inputs(all_inputs),
	.out(le_out[0])
);

logic_e le10(
	.conf_func(conf_les[1][10:8]),
	.conf_ins(conf_les[1][7:0]),
	.all_inputs(all_inputs),
	.out(le_out[1])
);

logic_e le20(
	.conf_func(conf_les[2][10:8]),
	.conf_ins(conf_les[2][7:0]),
	.all_inputs(all_inputs),
	.out(le_out[2])
);

logic_e le01(
	.conf_func(conf_les[3][10:8]),
	.conf_ins(conf_les[3][7:0]),
	.all_inputs(all_inputs),
	.out(le_out[3])
);

logic_e le11(
	.conf_func(conf_les[4][10:8]),
	.conf_ins(conf_les[4][7:0]),
	.all_inputs(all_inputs),
	.out(le_out[4])
);

logic_e le21(
	.conf_func(conf_les[5][10:8]),
	.conf_ins(conf_les[5][7:0]),
	.all_inputs(all_inputs),
	.out(le_out[5])
);

logic_e le02(
	.conf_func(conf_les[6][10:8]),
	.conf_ins(conf_les[6][7:0]),
	.all_inputs(all_inputs),
	.out(le_out[6])
);

logic_e le12(
	.conf_func(conf_les[7][10:8]),
	.conf_ins(conf_les[7][7:0]),
	.all_inputs(all_inputs),
	.out(le_out[7])
);

logic_e le22(
	.conf_func(conf_les[8][10:8]),
	.conf_ins(conf_les[8][7:0]),
	.all_inputs(all_inputs),
	.out(le_out[8])
);



endmodule