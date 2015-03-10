module main_fsm(iClock, iReset, iRxDone, iSamplingDone, iSendingDone, oMemWrite, oMemAddr);

	parameter IDLE = 2'b00,
		SAMPLING = 2'b01,
		SENDING = 2'b10;

	input iClock;
	input iReset;
	input iRxDone;
	input iSamplingDone;
	input iSendingDone;
	
	output oMemWrite;
	output oMemAddr;
	
	reg [1:0] current_state;
	
	assign next_state = next_state_fun(current_state, iRxDone, iSamplingDone, iSendingDone);
	assign current_state = IDLE;
	
	function [1:0] next_state_fun;
		input [1:0] current_state;
		input iRxDone;
		input iSamplingDone;
		input iSendingDone;
		
		case(current_state)
		IDLE:
			if (iRxDone) begin
				next_state_fun = SAMPLING;
			end else begin
				next_state_fun = IDLE;
			end
		SAMPLING:
			if (iSamplingDone) begin
				next_state_fun = SENDING;
			end else begin
				next_state_fun = SAMPLING;
			end
		SENDING:
			if (iSendingDone) begin
				next_state_fun = IDLE;
			end else begin
				next_state_fun = SENDING;
			end
		default:
			next_state_fun = IDLE;
		endcase
		
	endfunction
	
always@ (posedge iClock) begin
	if (iReset) begin
		current_state <= IDLE;
	end else begin
		current_state <= next_state;
	end
end

always@ (posedge iClock) begin
	if (iReset) begin
		oMemAddr <= 0;
		oMemWrite <= 0;
	end else begin
		case (current_state)
		IDLE: begin
			oMemAddr <= 0;
			oMemWrite <= 0;
		end
		SAMPLING: begin
			oMemAddr <= 0;
			oMemWrite <= 1;
		end
		SENDING: begin
			oMemAddr <= 1;
			oMemWrite <= 0;
		end
		endcase
	end
end

endmodule