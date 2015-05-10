module logic_e(conf_func, conf_ins, all_inputs, out);

	input [3:0] conf_func;
	input [9:0] conf_ins;
	input [27:0] all_inputs;
	output out;
	
	assign out = conf_func[{all_inputs[conf_ins[9:5]], all_inputs[conf_ins[4:0]]}];

endmodule