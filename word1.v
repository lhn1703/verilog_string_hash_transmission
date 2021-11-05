//lookup table to return character at str[i] 
module word1(output reg [7:0] Char, input [3:0] Position);
	always @ (*) begin
		case (Position)
			4'd0: Char <= "A"; 
			4'd1: Char <= "P";
			4'd2: Char <= "P";
			4'd3: Char <= "L";
			4'd4: Char <= "E";
			4'd5: Char <= "S";
			default : Char <= 8'h00; //null character
		endcase
	end
endmodule
