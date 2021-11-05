//input is a 8-bit ASCII stream, if device detects a pre-programmed word pattern
//z2 will turn on to alert the reciever that it has detected a word
//once z2 turns on, the device will not detect any new patterns
//when hashing done, z1 will alert the receiver to start recieving the hashed word
//the hash will be transmitted in 8-bit chunks, little endian format (LSB first)
//there will be 8 bytes total of data transfered regardless of hash value
//once the device transmitts the hash, it will reset and begin pattern detection
module StringChecker(output [7:0] hashData, output z1, z2, input [7:0] currentChar, input Reset, Clock);
	wire EndCheck, HashDone, Sent;
	wire [2:0] WordFound;
	wire [63:0] HashCode;

	wire Q1, Q2, Q1_n, Q2_n;
	wire D1, D2;
	assign D1 = (EndCheck & Q2) | (~Sent & Q1);
	assign z1 = Q1;
	assign D2 = Q1_n | (~HashDone & Q2);
	assign z2 = Q1 & Q2_n;
	DFF D_1(Q1, Q1_n, D1, Reset, Clock);
	DFF D_2(Q2, Q2_n, D2, Reset, Clock);
	
	wire startDetection, startHash, startTransmitting;
	assign startDetection = Q1 | Reset; 
	assign startHash = ~(Q1 & Q2) | Reset; 
	assign startTransmitting = ~(Q1 & Q2_n) | Reset;
	
	WordDetector WD(EndCheck, WordFound, currentChar, Clock, startDetection);
	Hash H(HashCode, HashDone, WordFound, startHash, Clock); 
	Transmitter T(hashData, Sent, HashCode, startTransmitting, Clock);
endmodule
