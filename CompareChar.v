//ASCII char comparator (combinational logic)
module CompareChar(output Equals, input reg [7:0] charA, charB);
	assign Equals = (charA == charB);
endmodule