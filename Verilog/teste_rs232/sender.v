module sender(iClock, iReset, iData, iSamplingFinished, oAddress, oTxSend);

	parameter IDLE = 3'b000,
		SENDING = 3'b001,
		SEND_PACKET = 3'b010, // Só serve para fazer o pulso de envio.
		SENDING_PACKET = 3'b011,
		INCREMENTING_ADDR = 3'b100;
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
				fsm_function = INCREMENTING_ADDR;
			end else begin
				fsm_function = SENDING_PACKET;
			end
		INCREMENTING_ADDR:
			fsm_function = SENDING;
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

always@ (posedge iClock) begin
	case (state)
	IDLE: begin
		oAddress <= 16'h0;
		oTxSend <= 0;
	end
	SENDING: begin
		oTxSend <= 0;
	end
	SEND_PACKET: begin
		oTxSend <= 1;
	end
	SENDING_PACKET: begin
		oTxSend <= 0;
	end
	INCREMENTING_ADDR: begin
		oAddress <= oAddress + 1;
		oTxSend <= 0;
	end
	default: begin
		oTxSend <= 0;
	end
	endcase
end
	
endmodule