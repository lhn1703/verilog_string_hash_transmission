//DJB2 Hashing algorithm for 8 bytes output int
//It will not start until reset = 0; initally reset = 1;
module Hash(output reg [63:0] Z, output hashDone, input [2:0] Wfound, input Reset, Clock);
	reg [2:0] WfoundStorage;
	wire [3:0] wlen1, wlen2, wlen3; //lengths of the respective words - 1
	assign wlen1 = 4'd5; 
	assign wlen2 = 4'd6;
	assign wlen3 = 4'd6;
	
	reg [3:0] N;
	wire [3:0] i;
	wire hashComplete;
	assign hashDone = hashComplete;
	wire up;
	assign up = ~Reset;
	wire [7:0] charA, charB, charC; 
	
	word1 w1(charA, i);
	word2 w2(charB, i);
	word3 w3(charC, i);
	
	Counter hashCounter(hashComplete, i, N, up, Reset, Clock);
	
	//for (int i = 0; i < str.length(); i++)
	//	hash = (hash << 5) + hash + static_cast<long int>str[i];
	reg [63:0] Zshift;
	always @ (negedge Clock)
		Zshift = Z << 5;
	
	always @ (posedge Clock or posedge Reset) begin
		if (Reset) begin
			Z <= 64'd5381;
			N <= 4'b0001; //assume N > 1 (checking for single letters is not useful)
			WfoundStorage <= Wfound;
		end
		else begin
			case (WfoundStorage)
				3'b100: begin
							N <= wlen1;
							if (~hashComplete)
								Z <= (Zshift + Z + charA);  
						end
				3'b010: begin
							N <= wlen2;
							if (~hashComplete)
								Z <= (Zshift + Z + charB);  
						end
				3'b001: begin
							N <= wlen3;
							if (~hashComplete)
								Z <= (Zshift + Z + charC);  
						end
				default: N <= 4'b0001; 	
			endcase
		end
	end
endmodule
