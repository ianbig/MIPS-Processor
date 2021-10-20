module FA_1bit(a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;
	wire xor_out, and_out1, and_out2;
	
	xor my_xor1(xor_out, a, b);
	xor my_xor2(sum, xor_out, cin);
	and my_and1(and_out1, xor_out, cin);
	and my_and2(and_out2, a, b);
	or my_or(cout, and_out1, and_out2);
	
endmodule

module FA_4bit(a, b, cin, sum, cout, overflow);
	input [3:0] a, b;
	input cin;
	output [3:0] sum;
	output cout, overflow;
	wire [2:0] w;
	
	FA_1bit FA1(a[0], b[0], cin, sum[0], w[0]);
	FA_1bit FA2(a[1], b[1], w[0], sum[1], w[1]);
	FA_1bit FA3(a[2], b[2], w[1], sum[2], w[2]);
	FA_1bit FA4(a[3], b[3], w[2], sum[3], cout);
	
	xor xor1(overflow, cout, w[2]);
	
endmodule
