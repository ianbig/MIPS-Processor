module control(op, rwe, aluinb, dmwe, rwd, rtrd);
	input [4:0] op;
	output rwe, aluinb, dmwe, rwd, rtrd;
	
	assign rwe = op[4] | op[3] | ~op[2] | ~op[1] | ~op[0];
	assign aluinb = op[4] | op[3] | op[2] | op[1] | op[0];
	assign dmwe = ~op[4] & ~op[3] & op[2] & op[1] & op[0];
	assign rwd = ~op[4] & op[3] & ~op[2] & ~op[1] & ~op[0];
	assign rtrd = ~op[4] & ~op[3] & op[2] & op[1] & op[0];
endmodule