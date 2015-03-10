module main(CLOCK_50, KEY, LEDR, SW, UART_RXD, UART_TXD);

	input CLOCK_50;
	input KEY[3:0];
	output [17:0] LEDR;
	input [17:0] SW;
	input UART_RXD;
	output UART_TXD;
	
	wire [31:0] data_to_send;
	reg [31:0] received_data;
	reg rx_data_is_ready = 0;
	reg send_data_now = 0;
	
	assign LEDR[7:0] = received_data[7:0];
	assign data_to_send = {24'b0, SW[7:0]};

always@ (posedge CLOCK_50) begin
	if (rx_data_is_ready)
		send_data_now <= 1;
	else
		send_data_now <= 0;
end

uart rs232(
	.sys_clk(CLOCK_50),
	.sys_rst(~KEY[1]),
	
	.csr_a(14'b0),
	.csr_we(send_data_now),
	.csr_di(data_to_send),
	.csr_do(received_data),
	
	.rx_irq(rx_data_is_ready),
	.tx_irq(),
	
	.uart_rx(UART_RXD),
	.uart_tx(UART_TXD)
);

endmodule