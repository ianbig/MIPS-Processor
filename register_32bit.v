module register_32bit(out, in, clk, en, clr);
	input [31:0] in;
	input clk, en, clr;
	output [31:0] out;
	
	dffe_ref dffe_ref0(out[0], in[0], clk, en, clr);
	dffe_ref dffe_ref1(out[1], in[1], clk, en, clr);
	dffe_ref dffe_ref2(out[2], in[2], clk, en, clr);
	dffe_ref dffe_ref3(out[3], in[3], clk, en, clr);
	dffe_ref dffe_ref4(out[4], in[4], clk, en, clr);
	dffe_ref dffe_ref5(out[5], in[5], clk, en, clr);
	dffe_ref dffe_ref6(out[6], in[6], clk, en, clr);
	dffe_ref dffe_ref7(out[7], in[7], clk, en, clr);
	dffe_ref dffe_ref8(out[8], in[8], clk, en, clr);
	dffe_ref dffe_ref9(out[9], in[9], clk, en, clr);
	dffe_ref dffe_ref10(out[10], in[10], clk, en, clr);
	dffe_ref dffe_ref11(out[11], in[11], clk, en, clr);
	dffe_ref dffe_ref12(out[12], in[12], clk, en, clr);
	dffe_ref dffe_ref13(out[13], in[13], clk, en, clr);
	dffe_ref dffe_ref14(out[14], in[14], clk, en, clr);
	dffe_ref dffe_ref15(out[15], in[15], clk, en, clr);
	dffe_ref dffe_ref16(out[16], in[16], clk, en, clr);
	dffe_ref dffe_ref17(out[17], in[17], clk, en, clr);
	dffe_ref dffe_ref18(out[18], in[18], clk, en, clr);
	dffe_ref dffe_ref19(out[19], in[19], clk, en, clr);
	dffe_ref dffe_ref20(out[20], in[20], clk, en, clr);
	dffe_ref dffe_ref21(out[21], in[21], clk, en, clr);
	dffe_ref dffe_ref22(out[22], in[22], clk, en, clr);
	dffe_ref dffe_ref23(out[23], in[23], clk, en, clr);
	dffe_ref dffe_ref24(out[24], in[24], clk, en, clr);
	dffe_ref dffe_ref25(out[25], in[25], clk, en, clr);
	dffe_ref dffe_ref26(out[26], in[26], clk, en, clr);
	dffe_ref dffe_ref27(out[27], in[27], clk, en, clr);
	dffe_ref dffe_ref28(out[28], in[28], clk, en, clr);
	dffe_ref dffe_ref29(out[29], in[29], clk, en, clr);
	dffe_ref dffe_ref30(out[30], in[30], clk, en, clr);
	dffe_ref dffe_ref31(out[31], in[31], clk, en, clr);

	
endmodule