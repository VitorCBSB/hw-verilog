module main(CLOCK_50, KEY, LEDR, SW, UART_RXD, UART_TXD);

	input CLOCK_50;
	input KEY[3:0];
	output [17:0] LEDR;
	input [17:0] SW;
	input UART_RXD;
	output UART_TXD;
	
	integer i;
	
	// Regs
	reg [7:0] current_value, value_into_genetico;
	reg [11:0] current_circuit_les[8:0];
	reg [3:0] current_circuit_outs[1:0];
	
	// Wires
	wire [31:0] data_to_send, rs232_received_data;
	wire [7:0] mem_out, genetico_out;
	wire rx_done, tx_done, tx_send, start_sampling, start_sending, mem_write,
		finished_sampling, finished_sending, mem_addr, fetch_value, serial_reset, 
		insert_value, done_receiving, set_current_circuit;
	wire [15:0] sampler_mem_addr, sender_mem_addr;
	wire [7:0] received_data[199:0];
	
	assign LEDR[7:0] = current_value;
	assign LEDR[17:10] = genetico_out;
	assign data_to_send = {24'b0, mem_out};

always @(posedge CLOCK_50) begin
	if (fetch_value)
		current_value <= received_data[1];
	if (insert_value)
		value_into_genetico <= current_value;
	if (set_current_circuit) begin
		for (i = 0; i < 9; i = i + 1) begin
			current_circuit_les[i][11:8] <= received_data[(i * 3) + 1][3:0];
			current_circuit_les[i][7:4] <= received_data[(i * 3) + 2][3:0];
			current_circuit_les[i][3:0] <= received_data[(i * 3) + 3][3:0];

		end
		for (i = 0; i < 2; i = i + 1) begin
			current_circuit_outs[i] <= received_data[i + 27 + 1][3:0];
		end
	end
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
	.data(genetico_out),
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

genetico genetico(
	.conf_les(current_circuit_les),
	.conf_outs(current_circuit_outs),
	.in(value_into_genetico),
	.out(genetico_out)
);

endmodule