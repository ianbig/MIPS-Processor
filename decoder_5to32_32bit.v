module decoder_5to32_32bit(in, out);
	input [4:0] in;
	output [31:0] out;
	
	wire [4:0] not_in;
	
	genvar i;
	generate
	for(i=0;i<5'd5;i=i+1) begin:not_gate
		not(not_in[i], in[i]);
	end
	endgenerate
	
	and my_and0(out[0], not_in[4], not_in[3], not_in[2], not_in[1], not_in[0]);
	and my_and1(out[1], not_in[4], not_in[3], not_in[2], not_in[1], in[0]);
	and my_and2(out[2], not_in[4], not_in[3], not_in[2], in[1], not_in[0]);
	and my_and3(out[3], not_in[4], not_in[3], not_in[2], in[1], in[0]);
	and my_and4(out[4], not_in[4], not_in[3], in[2], not_in[1], not_in[0]);
	and my_and5(out[5], not_in[4], not_in[3], in[2], not_in[1], in[0]);
	and my_and6(out[6], not_in[4], not_in[3], in[2], in[1], not_in[0]);
	and my_and7(out[7], not_in[4], not_in[3], in[2], in[1], in[0]);
	and my_and8(out[8], not_in[4], in[3], not_in[2], not_in[1], not_in[0]);
	and my_and9(out[9], not_in[4], in[3], not_in[2], not_in[1], in[0]);
	and my_and10(out[10], not_in[4], in[3], not_in[2], in[1], not_in[0]);
	and my_and11(out[11], not_in[4], in[3], not_in[2], in[1], in[0]);
	and my_and12(out[12], not_in[4], in[3], in[2], not_in[1], not_in[0]);
	and my_and13(out[13], not_in[4], in[3], in[2], not_in[1], in[0]);
	and my_and14(out[14], not_in[4], in[3], in[2], in[1], not_in[0]);
	and my_and15(out[15], not_in[4], in[3], in[2], in[1], in[0]);
	and my_and16(out[16], in[4], not_in[3], not_in[2], not_in[1], not_in[0]);
	and my_and17(out[17], in[4], not_in[3], not_in[2], not_in[1], in[0]);
	and my_and18(out[18], in[4], not_in[3], not_in[2], in[1], not_in[0]);
	and my_and19(out[19], in[4], not_in[3], not_in[2], in[1], in[0]);
	and my_and20(out[20], in[4], not_in[3], in[2], not_in[1], not_in[0]);
	and my_and21(out[21], in[4], not_in[3], in[2], not_in[1], in[0]);
	and my_and22(out[22], in[4], not_in[3], in[2], in[1], not_in[0]);
	and my_and23(out[23], in[4], not_in[3], in[2], in[1], in[0]);
	and my_and24(out[24], in[4], in[3], not_in[2], not_in[1], not_in[0]);
	and my_and25(out[25], in[4], in[3], not_in[2], not_in[1], in[0]);
	and my_and26(out[26], in[4], in[3], not_in[2], in[1], not_in[0]);
	and my_and27(out[27], in[4], in[3], not_in[2], in[1], in[0]);
	and my_and28(out[28], in[4], in[3], in[2], not_in[1], not_in[0]);
	and my_and29(out[29], in[4], in[3], in[2], not_in[1], in[0]);
	and my_and30(out[30], in[4], in[3], in[2], in[1], not_in[0]);
	and my_and31(out[31], in[4], in[3], in[2], in[1], in[0]);
	
endmodule
