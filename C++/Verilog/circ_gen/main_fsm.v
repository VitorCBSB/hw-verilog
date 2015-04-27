module main_fsm(iClock, iReset, iDoneReceiving, iReceivedData, iSamplingDone, iSendingDone, 
	oMemWrite, oMemAddr, oStartSampling, oStartSending, oFetchValue, oSetCurrentCircuit,
	oInsertValue, oResetSerial);

	parameter IDLE = 3'b000,
		SAMPLING = 3'b001,
		SENDING = 3'b010,
		START_SAMPLING = 3'b011,
		START_SENDING = 3'b100,
		FETCH_VALUE = 3'b101,
		SET_CURRENT_CIRCUIT = 3'b110;

	input iClock;
	input iReset;
	input iDoneReceiving;
	input iSamplingDone;
	input iSendingDone;
	input [15:0] iReceivedData;
	
	output oMemWrite;
	output oMemAddr;
	output oStartSampling;
	output oStartSending;
	output oFetchValue;
	output oResetSerial;
	output oInsertValue;
	output oSetCurrentCircuit;
	
	reg [2:0] state = IDLE;
	wire [2:0] next_state;
	
	assign next_state = next_state_fun(state, iReceivedData, iDoneReceiving, 
		iSamplingDone, iSendingDone);
	
	function [2:0] next_state_fun(input [2:0] current_state, input [15:0] received_data, 
		input iDoneReceiving, input iSamplingDone, input iSendingDone);
		case(current_state)
		IDLE:
			if (iDoneReceiving) begin
				if (iReceivedData[15:8] == 8'b0) begin
					next_state_fun = FETCH_VALUE;
				end else begin
					next_state_fun = SET_CURRENT_CIRCUIT;
				end
			end else begin
				next_state_fun = IDLE;
			end
		SET_CURRENT_CIRCUIT:
			next_state_fun = IDLE;
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
	oInsertValue <= 0;
	oResetSerial <= 0;
	oSetCurrentCircuit <= 0;
	if (iReset) begin
	end else begin
		case (state)
		IDLE: begin
		end
		SET_CURRENT_CIRCUIT: begin
			oSetCurrentCircuit <= 1;
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
			oResetSerial <= 1;
			oInsertValue <= 1;
		end
		START_SENDING: begin
			oStartSending <= 1;
		end
		endcase
	end
end

endmodule