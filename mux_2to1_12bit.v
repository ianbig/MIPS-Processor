module mux_2to1_12bit(a, b, s, out);
	input [11:0] a, b;
	input s;
	output [11:0] out;
	
	assign out = s ? b : a;
	
endmodule