module sampler(iClock, iStartSignal, oWriteEnable, oAddress, oFinished);

	input iClock;
	input iStartSignal;
	output reg oWriteEnable;
	output reg [15:0] oAddress;
	output reg oFinished;
	
	reg started;
	integer counter;

initial begin
	oFinished <= 0;
	oWriteEnable <= 0;
	oAddress <= 16'b0;
	counter <= 20'b0;
end
	
always @(iClock) begin
	if (oFinished)
		oFinished <= 0;
	if (iStartSignal) begin
		counter <= 20'b0;
		oWriteEnable <= 1;
		started <= 1;
	end
	if (started) begin
		if (counter >= 20'h0FFFF) begin // Condição de término de amostragem
			started <= 0;
			oWriteEnable <= 0;
			oFinished <= 1;
		end
		counter <= counter + 1;
	end
	oAddress <= counter;
end

endmodule