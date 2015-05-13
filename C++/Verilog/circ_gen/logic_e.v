module logic_e(conf_func, conf_ins, all_inputs, out);

	input [2:0] conf_func;
	input [7:0] conf_ins;
	input [11:0] all_inputs;
	output out;
	
	wire all_funcs[6:0];
	
	and func0(all_funcs[0], all_inputs[conf_ins[7:4]], all_inputs[conf_ins[3:0]]);
	or func1(all_funcs[1], all_inputs[conf_ins[7:4]], all_inputs[conf_ins[3:0]]);
	xor func2(all_funcs[2], all_inputs[conf_ins[7:4]], all_inputs[conf_ins[3:0]]);
	not func3(all_funcs[3], all_inputs[conf_ins[7:4]]);
	nand func4(all_funcs[4], all_inputs[conf_ins[7:4]], all_inputs[conf_ins[3:0]]);
	xnor func5(all_funcs[5], all_inputs[conf_ins[7:4]], all_inputs[conf_ins[3:0]]);
	nor func6(all_funcs[6], all_inputs[conf_ins[7:4]], all_inputs[conf_ins[3:0]]);

	
	assign out = all_funcs[conf_func];

endmodule