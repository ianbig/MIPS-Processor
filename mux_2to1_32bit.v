module mux_2to1_32bit(a, b, s, out);
	input [31:0] a, b;
	input s;
	output [31:0] out;
	
	assign out = s ? b : a;
	
endmodule
	