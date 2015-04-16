module logic_e(func, in, out);

	input [15:0] func;
	input [3:0] in;
	output out;

	assign out = func[in];

endmodule

