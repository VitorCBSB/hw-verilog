module sender(iData, iUart_Rxd, iSamplingFinished, oUart_Txd, oAddress);

	parameter IDLE = 3'b000,
		SENDING = 3'b001,
		SEND_PACKET = 3'b010, // Só serve para fazer o pulso de envio.
		SENDING_PACKET = 3'b011,
		START_SAMPLING = 3'b100;
	reg [2:0] state;
	input [7:0] iData;
	output [15:0] oAddress;
	
	assign next_state = fsm_function(state, oAddress, rx_done, tx_done, iSamplingFinished);
	
	function [2:0] fsm_function;
		input [2:0] state;
		input [15:0] oAddress;
		input rx_done;
		input tx_done;
		input iSamplingFinished;
		
		case (state)
		IDLE:
			if (rx_done) begin
				fsm_function = START_SAMPLING;
			end else if (iSamplingFinished) begin
				fsm_function = SENDING;
			end else begin
				fsm_function = IDLE;
			end
		SENDING:
			if (oAddress < 16'hFFFF) begin
				fsm_function = SEND_PACKET;
			end else begin
				fsm_function = IDLE; // Acabou de enviar os dados.
			end
		SEND_PACKET:
			fsm_function = SENDING_PACKET;
		SENDING_PACKET:
			if (tx_done) begin
				fsm_function = SENDING_PACKET;
			end else begin
				fsm_function = SENDING;
			end
		START_SAMPLING:
			fsm_function = IDLE;
		endcase
		
	endfunction

endmodule