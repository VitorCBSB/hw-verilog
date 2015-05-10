module data_receiver(iClock, iReset, iRxDone, iReceivedData, oResultData, oDoneReceiving);

	parameter IDLE = 3'b000,
		FETCH_FIRST_VALUE = 3'b001,
		CHECK_VALUE = 3'b010,
		RECEIVE_DATA = 3'b011,
		EMIT_DONE_RECEIVING = 3'b100,
		RECEIVING_DATA = 3'b101,
		FETCH_VALUE_INC_COUNTER = 3'b110,
		INPUT_MESSAGE = 2'b00,
		CIRCUIT_MESSAGE = 2'b01;

	input iClock;
	input iReset;
	input iRxDone;
	input [7:0] iReceivedData;
	output reg [7:0] oResultData[199:0];
	output oDoneReceiving;

	reg [2:0] state = IDLE;
	reg [7:0] receive_counter = 8'b0;
	reg [7:0] incoming_message_size = 8'b0;
	wire [2:0] next_state;
	
	assign next_state = next_state_fun(state, iRxDone, 
		receive_counter, incoming_message_size);
	
	function [2:0] next_state_fun(input [2:0] current_state, input rx_done, 
		input [7:0] counter, input [7:0] message_size);
		case(current_state)
		IDLE:
			if (rx_done) begin
				next_state_fun = FETCH_FIRST_VALUE;
			end else begin
				next_state_fun = IDLE;
			end
		FETCH_FIRST_VALUE:
			next_state_fun = CHECK_VALUE;
		CHECK_VALUE:
			next_state_fun = RECEIVE_DATA;
		RECEIVE_DATA:
			if (counter < message_size) begin
				next_state_fun = RECEIVING_DATA;
			end else begin
				next_state_fun = EMIT_DONE_RECEIVING;
			end
		RECEIVING_DATA:
			if (rx_done) begin
				next_state_fun = FETCH_VALUE_INC_COUNTER;
			end else begin
				next_state_fun = RECEIVING_DATA;
			end
		FETCH_VALUE_INC_COUNTER:
			next_state_fun = RECEIVE_DATA;
		EMIT_DONE_RECEIVING:
			next_state_fun = IDLE;
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
	oDoneReceiving <= 0;
	if (iReset) begin
	end else begin
		case(state)
		IDLE: begin
			receive_counter <= 0;
		end
		FETCH_FIRST_VALUE: begin
			oResultData[receive_counter] <= iReceivedData;
			receive_counter <= receive_counter + 8'b1;
		end
		CHECK_VALUE: begin
			if (oResultData[0] == INPUT_MESSAGE) begin
				incoming_message_size = 8'b1 + 8'b1;
			end else begin
				incoming_message_size = 8'd79 + 8'b1;
			end
		end
		FETCH_VALUE_INC_COUNTER: begin
			oResultData[receive_counter] <= iReceivedData;
			receive_counter <= receive_counter + 8'b1;
		end
		EMIT_DONE_RECEIVING: begin
			oDoneReceiving <= 1;
		end
		default: begin
		end
		endcase
	end
end

endmodule