module Transmitter (output reg [7:0] Byte, output Done, input [63:0] Hash, input Reset, Clock);
	reg [63:0] M;
	wire [3:0] N, i;
	assign N = 4'b111;
	
	wire up;
	assign up = ~Reset;
	
	Counter CT(Done, i, N, up, Reset, Clock);
//	always @ (negedge Reset)
//		M <= Hash;
	always @ (posedge Clock) begin
		if (Reset) begin
			Byte <= 8'h0;
			M <= Hash;
		end
		else if (~Done) begin
			Byte <= M & 8'hFF; // LSB bitwise masking
			M <= M >> 8;
		end
	end
endmodule
