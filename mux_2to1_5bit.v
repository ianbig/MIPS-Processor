module mux_2to1_5bit(a, b, s, out);
	input [4:0] a, b;
	input s;
	output [4:0] out;
	
	assign out = s ? b : a;
	
endmodule
