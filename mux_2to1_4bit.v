module mux_2to1_4bit(a, b, s, out);
	input [3:0] a, b;
	input s;
	output [3:0] out;
	
	assign out = s ? b : a;
	
endmodule
