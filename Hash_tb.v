module Hash_tb;
	wire [63:0] hashValue;
	reg Clock = 1;
	reg Reset = 1;
	wire Z;
	reg [2:0] word = 3'b100;
	Hash h1(hashValue, Z, word, Reset, Clock);
	
	initial begin
		#80 Reset = 1'b0;
		#800 Reset = 1'b1;
		word = 3'b010;
		
		#100 Reset = 1'b0;
		#800 Reset = 1'b1;
		word = 3'b001;
		
		#100 Reset = 1'b0;

	end

	always
		#50 Clock = ~Clock;
endmodule
