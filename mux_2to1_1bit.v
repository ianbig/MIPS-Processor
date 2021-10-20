module mux_2to1_1bit(a, b, s, out);
	input a, b;
	input s;
	output out;
	
	assign out = s ? b : a;
	
endmodule
