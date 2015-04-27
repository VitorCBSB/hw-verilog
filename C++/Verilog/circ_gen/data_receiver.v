module data_receiver(iClock, iReset, iRxDone, iReceivedData, oResultData, oDoneReceiving);

	parameter IDLE = 3'b000,
		FETCH_FIRST_VALUE = 3'b001,
		IDLE_FOR_SECOND_VAL = 3'b010,
		FETCH_SECOND_VALUE = 3'b011,
		EMIT_DONE_RECEIVING = 3'b100;

	input iClock;
	input iReset;
	input iRxDone;
	input [7:0] iReceivedData;
	output reg [15:0] oResultData;
	output oDoneReceiving;

	reg [2:0] state = IDLE;
	wire [2:0] next_state;
	
	assign next_state = next_state_fun(state, iRxDone);
	
	function [2:0] next_state_fun(input [2:0] current_state, input rx_done);
		case(current_state)
		IDLE:
			if (rx_done) begin
				next_state_fun = FETCH_FIRST_VALUE;
			end else begin
				next_state_fun = IDLE;
			end
		FETCH_FIRST_VALUE:
			next_state_fun = IDLE_FOR_SECOND_VAL;
		IDLE_FOR_SECOND_VAL:
			if (rx_done) begin
				next_state_fun = FETCH_SECOND_VALUE;
			end else begin
				next_state_fun = IDLE_FOR_SECOND_VAL;
			end
		FETCH_SECOND_VALUE:
			next_state_fun = EMIT_DONE_RECEIVING;
		EMIT_DONE_RECEIVING:
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
	oDoneReceiving <= 0;
	if (iReset) begin
	end else begin
		case(state)
		IDLE: begin
		end
		FETCH_FIRST_VALUE: begin
			oResultData[15:8] <= iReceivedData;
		end
		IDLE_FOR_SECOND_VAL: begin
		end
		FETCH_SECOND_VALUE: begin
			oResultData[7:0] <= iReceivedData;
		end
		EMIT_DONE_RECEIVING: begin
			oDoneReceiving <= 1;
		end
		endcase
	end
end

endmodule