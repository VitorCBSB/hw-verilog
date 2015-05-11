module logic_e(conf_func, conf_ins, all_inputs, out);

	input [3:0] conf_func;
	input [7:0] conf_ins;
	input [11:0] all_inputs;
	output out;
	
	assign out = conf_func[{all_inputs[conf_ins[7:4]], all_inputs[conf_ins[3:0]]}];

endmodule