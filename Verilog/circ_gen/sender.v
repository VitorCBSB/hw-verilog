module sender(iClock, iReset, iData, iTxDone, iStartSignal, oAddress, oFinished, oTxSend);

	parameter IDLE = 3'b000,
		SENDING = 3'b001,
		SEND_PACKET = 3'b010, // Só serve para fazer o pulso de envio.
		SENDING_PACKET = 3'b011,
		INCREMENTING_ADDR = 3'b100,
		FINISHED_SENDING = 3'b101;
	reg [2:0] state;
	input [7:0] iData;
	input iClock;
	input iReset;
	input iTxDone;
	input iStartSignal;
	output oTxSend;
	output oFinished;
	output [15:0] oAddress;
	
	wire [1:0] next_state;
	
	assign next_state = fsm_function(state, oAddress, iTxDone, iStartSignal);
	
	function [2:0] fsm_function(input [2:0] state, input [15:0] current_address,
		input tx_done, input sampling_finished);
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
				fsm_function = FINISHED_SENDING; // Acabou de enviar os dados.
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
		FINISHED_SENDING:
			fsm_function = IDLE;
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
	oTxSend <= 0;
	oFinished <= 0;
	case (state)
	IDLE: begin
		oAddress <= 16'h0;
	end
	SENDING: begin
	end
	SEND_PACKET: begin
		oTxSend <= 1;
	end
	SENDING_PACKET: begin
	end
	INCREMENTING_ADDR: begin
		oAddress <= oAddress + 1;
	end
	FINISHED_SENDING: begin
		oFinished <= 1;
	end
	default: begin
	end
	endcase
end
	
endmodule