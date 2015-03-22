module main_fsm(iClock, iReset, iRxDone, iSamplingDone, iSendingDone, 
	oMemWrite, oMemAddr, oStartSampling, oStartSending, oFetchValue, state);

	parameter IDLE = 3'b000,
		SAMPLING = 3'b001,
		SENDING = 3'b010,
		START_SAMPLING = 3'b011,
		START_SENDING = 3'b100,
		FETCH_VALUE = 3'b101;

	input iClock;
	input iReset;
	input iRxDone;
	input iSamplingDone;
	input iSendingDone;
	
	output oMemWrite;
	output oMemAddr;
	output oStartSampling;
	output oStartSending;
	output oFetchValue;
	
	output reg [2:0] state = IDLE;
	wire [2:0] next_state;
	
	assign next_state = next_state_fun(state, iRxDone, iSamplingDone, iSendingDone);
	
	function [2:0] next_state_fun(input [2:0] current_state, input iRxDone,
		input iSamplingDone, input iSendingDone);
		case(current_state)
		IDLE:
			if (iRxDone) begin
				next_state_fun = FETCH_VALUE;
			end else begin
				next_state_fun = IDLE;
			end
		FETCH_VALUE:
			next_state_fun = START_SAMPLING;
		SAMPLING:
			if (iSamplingDone) begin
				next_state_fun = START_SENDING;
			end else begin
				next_state_fun = SAMPLING;
			end
		SENDING:
			if (iSendingDone) begin
				next_state_fun = IDLE;
			end else begin
				next_state_fun = SENDING;
			end
		START_SAMPLING:
			next_state_fun = SAMPLING;
		START_SENDING:
			next_state_fun = SENDING;
		default:
			next_state_fun = IDLE;
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
	oMemAddr <= 0;
	oMemWrite <= 0;
	oStartSampling <= 0;
	oStartSending <= 0;
	oFetchValue <= 0;
	if (iReset) begin
	end else begin
		case (state)
		IDLE: begin
		end
		FETCH_VALUE: begin
			oFetchValue <= 1;
		end
		SAMPLING: begin
			oMemWrite <= 1;
		end
		SENDING: begin
			oMemAddr <= 1;
		end
		START_SAMPLING: begin
			oStartSampling <= 1;
		end
		START_SENDING: begin
			oStartSending <= 1;
		end
		endcase
	end
end

endmodule