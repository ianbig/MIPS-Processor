module sx_32bit(a, out);
	input [16:0] a;
	output [31:0] out;
	
	assign out = { {15{a[16]}}, a[16:0] };
endmodule