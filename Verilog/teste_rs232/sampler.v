module sampler(iClock, iReset, iStartSignal, oAddress, oFinished);

	parameter IDLE = 2'b00,
		SAMPLING = 2'b01,
		INCREMENTING_ADDR = 2'b10,
		FINISHED_SAMPLING = 2'b11;

	input iClock;
	input iReset;
	input iStartSignal;
	output reg [15:0] oAddress;
	output oFinished;
	
	reg [1:0] state;
	reg started;
	integer counter;

	function [1:0] next_state;
		input [1:0] state;
		input start_signal;
		input [15:0] address;
		
		case(state)
		IDLE:
			if (start_signal) begin
				next_state = SAMPLING;
			end else begin
				next_state = IDLE;
			end
		SAMPLING:
			if (address < 16'hFFFF) begin
				next_state = FINISHED_SAMPLING;
			end else begin
				next_state = INCREMENTING_ADDR;
			end
		INCREMENTING_ADDR: 
			next_state = SAMPLING;
		FINISHED_SAMPLING:
			next_state = IDLE;
		default:
			next_state = IDLE;
		endcase
	
	endfunction
	
always@(posedge iClock) begin
	if (iReset) begin
		state <= IDLE;
	end else begin
		state <= next_state;
	end
end

always@(posedge iClock) begin
	oFinished <= 0;
	case(state)
	IDLE: begin
		oAddress <= 16'b0;
	end
	SAMPLING: begin
	end
	INCREMENTING_ADDR: begin
		oAddress <= oAddress + 1;
	end
	FINISHED_SAMPLING: begin
		oFinished <= 1;
	end
	endcase
end

endmodule