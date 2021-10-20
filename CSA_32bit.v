 module CSA_32bit(a, b, cin, sum, cout, overflow, isLessThan, isNotEqual);
	input [31:0] a, b;
	input cin;
	output [31:0] sum;
	output cout, overflow, isLessThan, isNotEqual;
	wire [14:0] c;
	wire [55:0] s;
	wire [1:0] ovf;
	wire [5:0] com; //output from 2to1 1bit mux
	
	//3:0
	FA_4bit FA1(a[3:0], b[3:0], cin, sum[3:0], c[0]);
	
	//7:4
	FA_4bit FA2(a[7:4], b[7:4], 0, s[3:0], c[1]);
	FA_4bit FA3(a[7:4], b[7:4], 1, s[7:4], c[2]);
	mux_2to1_4bit mux1(s[3:0], s[7:4], c[0], sum[7:4]);
	mux_2to1_1bit mux2(c[1], c[2], c[0], com[0]);
	
	//11:8
	FA_4bit FA4(a[11:8], b[11:8], 0, s[11:8], c[3]);
	FA_4bit FA5(a[11:8], b[11:8], 1, s[15:12], c[4]);
	mux_2to1_4bit mux3(s[11:8], s[15:12], com[0], sum[11:8]);
	mux_2to1_1bit mux4(c[3], c[4], com[0], com[1]);
	
	//15:12
	FA_4bit FA6(a[15:12], b[15:12], 0, s[19:16], c[5]);
	FA_4bit FA7(a[15:12], b[15:12], 1, s[23:20], c[6]);
	mux_2to1_4bit mux5(s[19:16], s[23:20], com[1], sum[15:12]);
	mux_2to1_1bit mux6(c[5], c[6], com[1], com[2]);
	
	//19:16
	FA_4bit FA8(a[19:16], b[19:16], 0, s[27:24], c[7]);
	FA_4bit FA9(a[19:16], b[19:16], 1, s[31:28], c[8]);
	mux_2to1_4bit mux7(s[27:24], s[31:28], com[2], sum[19:16]);
	mux_2to1_1bit mux8(c[7], c[8], com[2], com[3]);
	
	//23:20
	FA_4bit FA10(a[23:20], b[23:20], 0, s[35:32], c[9]);
	FA_4bit FA11(a[23:20], b[23:20], 1, s[39:36], c[10]);
	mux_2to1_4bit mux9(s[35:32], s[39:36], com[3], sum[23:20]);
	mux_2to1_1bit mux10(c[9], c[10], com[3], com[4]);
	
	//27:24
	FA_4bit FA12(a[27:24], b[27:24], 0, s[43:40], c[11]);
	FA_4bit FA13(a[27:24], b[27:24], 1, s[47:44], c[12]);
	mux_2to1_4bit mux11(s[43:40], s[47:44], com[4], sum[27:24]);
	mux_2to1_1bit mux12(c[11], c[12], com[4], com[5]);
	
	//31:28
	FA_4bit FA14(a[31:28], b[31:28], 0, s[51:48], c[13], ovf[0]);
	FA_4bit FA15(a[31:28], b[31:28], 1, s[55:52], c[14], ovf[1]);
	mux_2to1_4bit mux13(s[51:48], s[55:52], com[5], sum[31:28]);
	mux_2to1_1bit mux14(c[13], c[14], com[5], cout);
	mux_2to1_1bit mux15(ovf[0], ovf[1], com[5], overflow);
	
	// isLessThan
	xor(isLessThan, sum[31], overflow);
	// isNotEqual
	wire [29:0] tmp;
	or(isNotEqual, sum[0], sum[1], sum[2], sum[3], sum[4], sum[5], sum[6], sum[7], sum[8], sum[9], 
	sum[10], sum[11], sum[12], sum[13], sum[14], sum[15], sum[16], sum[17], sum[18], sum[19],
	sum[20], sum[21], sum[22], sum[23], sum[24], sum[25], sum[26], sum[27], sum[28], sum[29], sum[30], sum[31]);
 
 endmodule
 