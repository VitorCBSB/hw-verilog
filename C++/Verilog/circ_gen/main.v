module main(CLOCK_50, KEY, LEDR, LEDG, SW, UART_RXD, UART_TXD);

	input CLOCK_50;
	input KEY[3:0];
	output [17:0] LEDR;
	output [7:0] LEDG;
	input [17:0] SW;
	input UART_RXD;
	output UART_TXD;
	
	// Regs
	reg [7:0] current_value, value_into_genetico, current_circuit;
	
	// Wires
	wire [31:0] data_to_send, rs232_received_data;
	wire [7:0] mem_out, genetico_out[19:0];
	wire rx_done, tx_done, tx_send, start_sampling, start_sending, mem_write,
		finished_sampling, finished_sending, mem_addr, fetch_value, serial_reset, 
		insert_value, done_receiving, set_current_circuit;
	wire [15:0] sampler_mem_addr, sender_mem_addr, received_data;
	
	assign LEDR[7:0] = current_value;
	assign LEDG = current_circuit;
	assign LEDR[17:10] = genetico_out[current_circuit];
	assign data_to_send = {24'b0, mem_out};

always @(posedge CLOCK_50) begin
	if (fetch_value)
		current_value <= received_data[7:0];
	if (insert_value)
		value_into_genetico <= current_value;
	if (set_current_circuit)
		current_circuit <= received_data[7:0];
end	

sampler sampler(
	.iClock(CLOCK_50),
	.iReset(~KEY[1]),
	.iStartSignal(start_sampling),
	.oAddress(sampler_mem_addr),
	.oFinished(finished_sampling)
);

sender sender(
	.iClock(CLOCK_50),
	.iReset(~KEY[1]),
	.iTxDone(tx_done),
	.iStartSignal(start_sending),
	.oAddress(sender_mem_addr),
	.oFinished(finished_sending),
	.oTxSend(tx_send)
);

main_fsm fsm(
	.iClock(CLOCK_50),
	.iReset(~KEY[1]),
	.iDoneReceiving(done_receiving),
	.iReceivedData(received_data),
	.iSamplingDone(finished_sampling),
	.iSendingDone(finished_sending),
	.oMemWrite(mem_write),
	.oMemAddr(mem_addr),
	.oStartSampling(start_sampling),
	.oStartSending(start_sending),
	.oFetchValue(fetch_value),
	.oSetCurrentCircuit(set_current_circuit),
	.oInsertValue(insert_value),
	.oResetSerial(serial_reset)
);

memoria memoria(
	.address(mem_addr ? sender_mem_addr : sampler_mem_addr),
	.clock(CLOCK_50),
	.data(genetico_out[current_circuit]),
	.wren(mem_write),
	.q(mem_out)
);

data_receiver data_receiver(
	.iClock(CLOCK_50),
	.iReset(~KEY[1]),
	.iRxDone(rx_done),
	.iReceivedData(rs232_received_data),
	.oResultData(received_data),
	.oDoneReceiving(done_receiving)
);

uart rs232(
	.sys_clk(CLOCK_50),
	.sys_rst(~KEY[1] | serial_reset),
	
	.csr_a(14'b0),
	.csr_we(tx_send),
	.csr_di(data_to_send),
	.csr_do(rs232_received_data),
	
	.rx_irq(rx_done),
	.tx_irq(tx_done),
	
	.uart_rx(UART_RXD),
	.uart_tx(UART_TXD)
);

genetico0 genetico0(
	.in(value_into_genetico),
	.out(genetico_out[0])
);

genetico1 genetico1(
	.in(value_into_genetico),
	.out(genetico_out[1])
);

genetico2 genetico2(
	.in(value_into_genetico),
	.out(genetico_out[2])
);

genetico3 genetico3(
	.in(value_into_genetico),
	.out(genetico_out[3])
);

genetico4 genetico4(
	.in(value_into_genetico),
	.out(genetico_out[4])
);

genetico5 genetico5(
	.in(value_into_genetico),
	.out(genetico_out[5])
);

genetico6 genetico6(
	.in(value_into_genetico),
	.out(genetico_out[6])
);

genetico7 genetico7(
	.in(value_into_genetico),
	.out(genetico_out[7])
);

genetico8 genetico8(
	.in(value_into_genetico),
	.out(genetico_out[8])
);

genetico9 genetico9(
	.in(value_into_genetico),
	.out(genetico_out[9])
);

genetico10 genetico10(
	.in(value_into_genetico),
	.out(genetico_out[10])
);

genetico11 genetico11(
	.in(value_into_genetico),
	.out(genetico_out[11])
);

genetico12 genetico12(
	.in(value_into_genetico),
	.out(genetico_out[12])
);

genetico13 genetico13(
	.in(value_into_genetico),
	.out(genetico_out[13])
);

genetico14 genetico14(
	.in(value_into_genetico),
	.out(genetico_out[14])
);

genetico15 genetico15(
	.in(value_into_genetico),
	.out(genetico_out[15])
);

genetico16 genetico16(
	.in(value_into_genetico),
	.out(genetico_out[16])
);

genetico17 genetico17(
	.in(value_into_genetico),
	.out(genetico_out[17])
);

genetico18 genetico18(
	.in(value_into_genetico),
	.out(genetico_out[18])
);

genetico19 genetico19(
	.in(value_into_genetico),
	.out(genetico_out[19])
);

endmodule