module word2(output reg [7:0] Char, input [3:0] Position);
	always @ (*) begin
		case (Position)
			4'd0: Char <= "O";
			4'd1: Char <= "R";
			4'd2: Char <= "A";
			4'd3: Char <= "N";
			4'd4: Char <= "G";
			4'd5: Char <= "E";
			4'd6: Char <= "S";
			default : Char <= 8'h00; //null character
		endcase
	end
endmodule
