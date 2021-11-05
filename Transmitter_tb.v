module Transmitter_tb;
	reg [63:0] hashValue = 64'h652a55328ca;
	wire [7:0] Byte;
	reg Clock = 1;
	reg Reset = 1;
	wire Z;
	Transmitter t1(Byte, Z, hashValue, Reset, Clock);
	
	initial begin
		#80 Reset = 1'b0;
		#1000 Reset = 1'b1;
		hashValue = 64'hd0ab89039614;
		
		#100 Reset = 1'b0;
		#1000 Reset = 1'b1;
		hashValue = 64'hd0a7798b0879;
		
		#100 Reset = 1'b0;
	end

	always
		#50 Clock = ~Clock;
endmodule
