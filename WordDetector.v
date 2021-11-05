module WordDetector(output EndC, output [2:0] Wfound, input [7:0] X, input Clock, Reset);
	wire [3:0] wlen1, wlen2, wlen3; //lengths of the respective words
	assign wlen1 = 4'd6; 
	assign wlen2 = 4'd7;
	assign wlen3 = 4'd7;
	
	wire [3:0] i1, i2, i3; //iterators i for str[i]
	wire[7:0] CharA, CharB, CharC; //wire to store str[i]
	
	wire wfound1, wfound2, wfound3; //signal if word is found
	assign Wfound = {wfound1, wfound2, wfound3};
	assign EndC = (Wfound > 0);
		
	wire up1, up2, up3; //if the current word matches str[i], count++
	reg reset1, reset2, reset3; //else count = 0;

	word1 w11 (CharA, i1);
	CompareChar c1 (up1, X, CharA);
	Counter check1 (wfound1, i1, wlen1, up1, reset1, Clock);
	
	word2 w22 (CharB, i2);
	CompareChar c2 (up2, X, CharB);
	Counter check2 (wfound2, i2, wlen2, up2, reset2, Clock);
	
	word3 w33 (CharC, i3);
	CompareChar c3 (up3, X, CharC);
	Counter check3 (wfound3, i3, wlen3, up3, reset3, Clock);
	
	always @ (posedge Clock or posedge Reset) begin
		if (Reset) begin
			reset1 <= 1'b1;
			reset2 <= 1'b1;
			reset3 <= 1'b1;
		end
		else
			{reset1, reset2, reset3} <= {~up1, ~up2, ~up3};
	end
	
endmodule
