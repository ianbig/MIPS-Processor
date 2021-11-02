module control(op, rwe, aluinb, dmwe, rwd, rtrd, j, bne, jal, jr, bex, blt, setx, sub);
	input [4:0] op;
	output rwe, aluinb, dmwe, rwd, rtrd, j, bne, jal, jr, bex, blt, setx, sub;
		
	assign dmwe = ~op[4] & ~op[3] & op[2] & op[1] & op[0];
	assign rwd = ~op[4] & op[3] & ~op[2] & ~op[1] & ~op[0];
	assign rtrd = op[4] | op[3] | op[2] | op[1] | op[0];
	assign j = ~op[4] & ~op[3] & ~op[2] & op[0];
	assign bne = ~op[4] & ~op[3] & ~op[2] & op[1] & ~op[0];
	assign jal = ~op[4] & ~op[3] & ~op[2] & op[1] & op[0];
	assign jr = ~op[4] & ~op[3] & op[2] & ~op[1] & ~op[0];
	assign bex = op[4] & ~op[3] & op[2] & op[1] & ~op[0];
	assign blt  = ~op[4] & ~op[3] & op[2] & op[1] & ~op[0];
	assign setx = op[4] & ~op[3] & op[2] & ~op[1] & op[0];
	assign aluinb = (~op[4] & ~op[3] & op[2] & ~op[1] & op[0]) | dmwe | rwd;
	assign sub = ~aluinb;
	assign rwe = setx | jal | rwd | (~op[4] & ~op[3] & ~op[1] & ((~op[2] & ~op[0]) | (op[2] & op[0])));
	
endmodule