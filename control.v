module control(op, rwe, rdst, aluinb, dmwe, rwd);
	input [4:0] op;
	output rwe, rdst, aluinb, dmwe, rwd;
	
	assign rwe = op[4] | op[3] | ~op[2] | ~op[1] | ~op[0];
	assign rdst = ~op[4] & ~op[3] & ~op[2] & ~op[1] & ~op[0];
	assign aluinb = op[4] | op[3] | op[2] | op[1] | op[0];
	assign dmwe = ~op[4] & ~op[3] & op[2] & op[1] & op[0];
	assign rwd = ~op[4] & op[3] & ~op[2] & ~op[1] & ~op[0];
endmodule