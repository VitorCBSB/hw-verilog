module logic_e(func, in, out);

	input [3:0] func;
	input [1:0] in;
	output out;

	assign out = func[in];

endmodule