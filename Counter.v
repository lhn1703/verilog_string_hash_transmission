//variable counter up to 15 
module Counter (output reg Done, output reg [3:0] Count, input [3:0] N, input Up, Clear, Clock);
	always @ (posedge Clock or posedge Clear) begin
		if (Up)
			Count <= Count + 1;
		else if (Clear)
			Count <= 4'b0000;
			
		if (Count == N) 
			assign Done = 1'b1;
		else
			assign Done = 1'b0;
	end
endmodule
