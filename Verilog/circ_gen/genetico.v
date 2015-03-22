module genetico(in, out);

	input [3:0] in;
	output [0:0] out;
	wire le_out[24:0];

	assign out = {le_out[18]};

logic_e le00 (
	.func(16'b0111100100110100),
	.in({le_out[10], in[0], le_out[8], le_out[5]}),
	.out(le_out[0])
);

logic_e le01 (
	.func(16'b0011110101100100),
	.in({le_out[1], le_out[15], in[0], le_out[11]}),
	.out(le_out[1])
);

logic_e le02 (
	.func(16'b1101000111010111),
	.in({le_out[14], le_out[1], le_out[1], le_out[16]}),
	.out(le_out[2])
);

logic_e le03 (
	.func(16'b1000101111110011),
	.in({le_out[5], le_out[17], le_out[10], le_out[13]}),
	.out(le_out[3])
);

logic_e le04 (
	.func(16'b1101001000110110),
	.in({le_out[18], le_out[24], le_out[16], le_out[20]}),
	.out(le_out[4])
);

logic_e le10 (
	.func(16'b0011110110111010),
	.in({le_out[0], le_out[16], le_out[23], in[0]}),
	.out(le_out[5])
);

logic_e le11 (
	.func(16'b1101001000100111),
	.in({le_out[10], le_out[20], in[0], in[2]}),
	.out(le_out[6])
);

logic_e le12 (
	.func(16'b0001111001100011),
	.in({in[1], le_out[18], le_out[9], le_out[18]}),
	.out(le_out[7])
);

logic_e le13 (
	.func(16'b0110010001100101),
	.in({in[1], le_out[4], le_out[2], le_out[16]}),
	.out(le_out[8])
);

logic_e le14 (
	.func(16'b0100000110010101),
	.in({in[0], le_out[5], le_out[6], le_out[11]}),
	.out(le_out[9])
);

logic_e le20 (
	.func(16'b0000111101010001),
	.in({le_out[7], le_out[14], le_out[4], le_out[0]}),
	.out(le_out[10])
);

logic_e le21 (
	.func(16'b0110001010110011),
	.in({le_out[24], le_out[21], le_out[0], in[0]}),
	.out(le_out[11])
);

logic_e le22 (
	.func(16'b1110111100100001),
	.in({le_out[18], le_out[21], le_out[11], in[1]}),
	.out(le_out[12])
);

logic_e le23 (
	.func(16'b1000100001111101),
	.in({in[2], in[2], le_out[9], in[2]}),
	.out(le_out[13])
);

logic_e le24 (
	.func(16'b0110111110111100),
	.in({le_out[4], le_out[9], in[0], in[1]}),
	.out(le_out[14])
);

logic_e le30 (
	.func(16'b0001111000001010),
	.in({le_out[21], le_out[6], le_out[18], le_out[13]}),
	.out(le_out[15])
);

logic_e le31 (
	.func(16'b0100111000110101),
	.in({le_out[2], le_out[7], le_out[23], in[0]}),
	.out(le_out[16])
);

logic_e le32 (
	.func(16'b1111000110101110),
	.in({le_out[3], le_out[17], in[3], in[1]}),
	.out(le_out[17])
);

logic_e le33 (
	.func(16'b0000000100010111),
	.in({le_out[13], in[2], le_out[9], le_out[23]}),
	.out(le_out[18])
);

logic_e le34 (
	.func(16'b0001110000100111),
	.in({le_out[23], in[2], le_out[3], le_out[11]}),
	.out(le_out[19])
);

logic_e le40 (
	.func(16'b0110101010010001),
	.in({le_out[0], le_out[1], le_out[7], le_out[18]}),
	.out(le_out[20])
);

logic_e le41 (
	.func(16'b1101010111010000),
	.in({in[2], le_out[16], le_out[10], le_out[7]}),
	.out(le_out[21])
);

logic_e le42 (
	.func(16'b0001000010111101),
	.in({le_out[11], le_out[12], le_out[0], in[3]}),
	.out(le_out[22])
);

logic_e le43 (
	.func(16'b1100011101011111),
	.in({le_out[22], in[0], le_out[14], le_out[12]}),
	.out(le_out[23])
);

logic_e le44 (
	.func(16'b0001111110011001),
	.in({le_out[3], le_out[6], le_out[22], le_out[19]}),
	.out(le_out[24])
);

endmodule
