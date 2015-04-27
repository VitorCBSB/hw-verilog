module genetico9(in, out);

	input [2:0] in;
	output [1:0] out;
	wire le_out[8:0];

	assign out = {in[0], le_out[1]};

logic_e le00 (
	.func(4'b0010),
	.in({in[0], in[0]}),
	.out(le_out[0])
);

logic_e le10 (
	.func(4'b1110),
	.in({in[0], in[1]}),
	.out(le_out[1])
);

logic_e le20 (
	.func(4'b1010),
	.in({in[1], in[1]}),
	.out(le_out[2])
);

logic_e le01 (
	.func(4'b1110),
	.in({in[2], in[0]}),
	.out(le_out[3])
);

logic_e le11 (
	.func(4'b0100),
	.in({in[0], in[0]}),
	.out(le_out[4])
);

logic_e le21 (
	.func(4'b0100),
	.in({in[0], in[1]}),
	.out(le_out[5])
);

logic_e le02 (
	.func(4'b1011),
	.in({in[1], le_out[5]}),
	.out(le_out[6])
);

logic_e le12 (
	.func(4'b0010),
	.in({le_out[0], le_out[5]}),
	.out(le_out[7])
);

logic_e le22 (
	.func(4'b0000),
	.in({le_out[2], le_out[0]}),
	.out(le_out[8])
);

endmodule
