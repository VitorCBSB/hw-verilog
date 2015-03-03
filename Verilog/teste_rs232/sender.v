module sender(iClock, iReset, iData, iSamplingFinished, oAddress, oTxSend);

	// TODO: Repensar essa máquina de estados.

	parameter IDLE = 2'b00,
		SENDING = 2'b01,
		SEND_PACKET = 2'b10, // Só serve para fazer o pulso de envio.
		SENDING_PACKET = 2'b11;
	reg [1:0] state;
	input [7:0] iData;
	input iClock;
	input iReset;
	output [15:0] oAddress;
	
	assign next_state = fsm_function(state, oAddress, tx_done, iSamplingFinished);
	
	function [1:0] fsm_function;
		input [1:0] state;
		input [15:0] current_address;
		input tx_done;
		input sampling_finished;
		
		case (state)
		IDLE:
			if (sampling_finished) begin
				fsm_function = SENDING;
			end else begin
				fsm_function = IDLE;
			end
		SENDING:
			if (current_address < 16'hFFFF) begin
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
		default:
			fsm_function = IDLE;
		endcase
		
	endfunction

always@ (posedge iClock) begin
	if (iReset) begin
		state <= IDLE;
	end else begin
		state <= next_state;
	end
end
	
endmodule