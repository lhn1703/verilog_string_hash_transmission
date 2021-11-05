module StringChecker_tb;
	reg [7:0] X = 4'h0;
	reg Clock = 1;
	reg Reset = 1;
	wire [7:0] hashOut;
	wire z1, z2;
	
	StringChecker SC(hashOut, z1, z2, X, Reset, Clock);
	initial begin
		#80 Reset = 1'b0;
		
		#100 X = "A"; 
		#100 X = "B"; 
		#100 X = "A"; 
		#100 X = "P";
		#100 X = "P";
		#100 X = "L";
		#100 X = "E";
		#100 X = "S"; 
		#100 X = "P";
		#100 X = "O";
		#100 X = "R";
		#100 X = "A";
		#100 X = "N";
		#100 X = "G";
		#100 X = "E";
		#100 X = "S";
		
		#1000 X = "Z";
		
		#100 X = "T"; 
		#100 X = "W"; 
		#100 X = "B";
		#100 X = "A";
		#100 X = "N";
		#100 X = "A";
		#100 X = "N";
		#100 X = "A";
		#100 X = "S";
		#100 X = "A";
	end
	

	always
		#50 Clock = ~Clock;
endmodule
