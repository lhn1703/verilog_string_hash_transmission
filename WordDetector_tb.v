module WordDetector_tb;
	reg [7:0] X = 4'h0;
	reg Clock = 1;
	reg Reset;
	wire Z;
	wire [2:0] Zout;
	WordDetector WD(Z, Zout, X, Clock, Reset);
	initial begin
		Reset = 1'b1;
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