//async active hi reset DFF
module DFF (output reg Q, output Qn, input D, Clear, Clock); 
	always @ (posedge Clock) begin
		if (Clear)
			Q <= 1'b0;
		else
			Q <= D;
	end
	assign Qn = ~Q;
endmodule
