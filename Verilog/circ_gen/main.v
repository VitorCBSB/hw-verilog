module main(CLOCK_50, KEY, LEDR, SW, UART_RXD, UART_TXD);

	input CLOCK_50;
	input KEY[3:0];
	output [17:0] LEDR;
	input [17:0] SW;
	input UART_RXD;
	output UART_TXD;
	
	// Regs
	reg [31:0] received_data;
	reg [7:0] current_value;
	
	// Wires
	wire [31:0] data_to_send;
	wire rx_done;
	wire tx_done;
	wire tx_send;
	wire start_sampling;
	wire start_sending;
	wire mem_write;
	wire [15:0] sampler_mem_addr, sender_mem_addr, mem_out;
	wire finished_sampling, finished_sending, mem_addr;
	
	assign LEDR[7:0] = received_data[7:0];
	assign data_to_send = {24'b0, current_value};

always@ (posedge CLOCK_50) begin
	if (rx_done)
		 current_value <= received_data[7:0];
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
	.iData(mem_out),
	.iTxDone(tx_done),
	.iStartSignal(start_sending),
	.oAddress(sender_mem_addr),
	.oFinished(finished_sending),
	.oTxSend(tx_send)
);

main_fsm fsm(
	.iClock(CLOCK_50),
	.iReset(~KEY[1]),
	.iRxDone(rx_done),
	.iSamplingDone(finished_sampling),
	.iSendingDone(finished_sending),
	.oMemWrite(mem_write),
	.oMemAddr(mem_addr),
	.oStartSampling(start_sampling),
	.oStartSending(start_sending)
);

memoria memoria(
	.address(mem_addr ? sender_mem_addr : sampler_mem_addr),
	.clock(CLOCK_50),
	.data(current_value),
	.wren(mem_write),
	.q(mem_out)
);

uart rs232(
	.sys_clk(CLOCK_50),
	.sys_rst(~KEY[1]),
	
	.csr_a(14'b0),
	.csr_we(tx_send),
	.csr_di(data_to_send),
	.csr_do(received_data),
	
	.rx_irq(rx_done),
	.tx_irq(tx_done),
	
	.uart_rx(UART_RXD),
	.uart_tx(UART_TXD)
);

endmodule