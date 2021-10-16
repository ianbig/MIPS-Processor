module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* register */
	wire [31:0] regOut [0:31];
	wire [31:0] selW, selA, selB,selEn;
	
	/* write port */
	decoder_5to32_32bit decode_write(ctrl_writeReg, selW);
	genvar i;
	generate 
	for(i=0;i<=5'd31;i=i+1) begin: select_and
		and(selEn[i], selW[i], ctrl_writeEnable);
	end
	endgenerate
	
	
	register_32bit reg_0(regOut[0],32'b0, clock, selEn[0], ctrl_reset);
	register_32bit reg_1(regOut[1], data_writeReg, clock, selEn[1], ctrl_reset);
	register_32bit reg_2(regOut[2], data_writeReg, clock, selEn[2], ctrl_reset);
	register_32bit reg_3(regOut[3], data_writeReg, clock, selEn[3], ctrl_reset);
	register_32bit reg_4(regOut[4], data_writeReg, clock, selEn[4], ctrl_reset);
	register_32bit reg_5(regOut[5], data_writeReg, clock, selEn[5], ctrl_reset);
	register_32bit reg_6(regOut[6], data_writeReg, clock, selEn[6], ctrl_reset);
	register_32bit reg_7(regOut[7], data_writeReg, clock, selEn[7], ctrl_reset);
	register_32bit reg_8(regOut[8], data_writeReg, clock, selEn[8], ctrl_reset);
	register_32bit reg_9(regOut[9], data_writeReg, clock, selEn[9], ctrl_reset);
	register_32bit reg_10(regOut[10], data_writeReg, clock, selEn[10], ctrl_reset);
	register_32bit reg_11(regOut[11], data_writeReg, clock, selEn[11], ctrl_reset);
	register_32bit reg_12(regOut[12], data_writeReg, clock, selEn[12], ctrl_reset);
	register_32bit reg_13(regOut[13], data_writeReg, clock, selEn[13], ctrl_reset);
	register_32bit reg_14(regOut[14], data_writeReg, clock, selEn[14], ctrl_reset);
	register_32bit reg_15(regOut[15], data_writeReg, clock, selEn[15], ctrl_reset);
	register_32bit reg_16(regOut[16], data_writeReg, clock, selEn[16], ctrl_reset);
	register_32bit reg_17(regOut[17], data_writeReg, clock, selEn[17], ctrl_reset);
	register_32bit reg_18(regOut[18], data_writeReg, clock, selEn[18], ctrl_reset);
	register_32bit reg_19(regOut[19], data_writeReg, clock, selEn[19], ctrl_reset);
	register_32bit reg_20(regOut[20], data_writeReg, clock, selEn[20], ctrl_reset);
	register_32bit reg_21(regOut[21], data_writeReg, clock, selEn[21], ctrl_reset);
	register_32bit reg_22(regOut[22], data_writeReg, clock, selEn[22], ctrl_reset);
	register_32bit reg_23(regOut[23], data_writeReg, clock, selEn[23], ctrl_reset);
	register_32bit reg_24(regOut[24], data_writeReg, clock, selEn[24], ctrl_reset);
	register_32bit reg_25(regOut[25], data_writeReg, clock, selEn[25], ctrl_reset);
	register_32bit reg_26(regOut[26], data_writeReg, clock, selEn[26], ctrl_reset);
	register_32bit reg_27(regOut[27], data_writeReg, clock, selEn[27], ctrl_reset);
	register_32bit reg_28(regOut[28], data_writeReg, clock, selEn[28], ctrl_reset);
	register_32bit reg_29(regOut[29], data_writeReg, clock, selEn[29], ctrl_reset);
	register_32bit reg_30(regOut[30], data_writeReg, clock, selEn[30], ctrl_reset);
	register_32bit reg_31(regOut[31], data_writeReg, clock, selEn[31], ctrl_reset);
	
	// Read A port
	decoder_5to32_32bit decodeA(ctrl_readRegA, selA);
	
	tri_32bit tri_0(data_readRegA, regOut[0], selA[0]);
	tri_32bit tri_1(data_readRegA, regOut[1], selA[1]);
	tri_32bit tri_2(data_readRegA, regOut[2], selA[2]);
	tri_32bit tri_3(data_readRegA, regOut[3], selA[3]);
	tri_32bit tri_4(data_readRegA, regOut[4], selA[4]);
	tri_32bit tri_5(data_readRegA, regOut[5], selA[5]);
	tri_32bit tri_6(data_readRegA, regOut[6], selA[6]);
	tri_32bit tri_7(data_readRegA, regOut[7], selA[7]);
	tri_32bit tri_8(data_readRegA, regOut[8], selA[8]);
	tri_32bit tri_9(data_readRegA, regOut[9], selA[9]);
	tri_32bit tri_10(data_readRegA, regOut[10], selA[10]);
	tri_32bit tri_11(data_readRegA, regOut[11], selA[11]);
	tri_32bit tri_12(data_readRegA, regOut[12], selA[12]);
	tri_32bit tri_13(data_readRegA, regOut[13], selA[13]);
	tri_32bit tri_14(data_readRegA, regOut[14], selA[14]);
	tri_32bit tri_15(data_readRegA, regOut[15], selA[15]);
	tri_32bit tri_16(data_readRegA, regOut[16], selA[16]);
	tri_32bit tri_17(data_readRegA, regOut[17], selA[17]);
	tri_32bit tri_18(data_readRegA, regOut[18], selA[18]);
	tri_32bit tri_19(data_readRegA, regOut[19], selA[19]);
	tri_32bit tri_20(data_readRegA, regOut[20], selA[20]);
	tri_32bit tri_21(data_readRegA, regOut[21], selA[21]);
	tri_32bit tri_22(data_readRegA, regOut[22], selA[22]);
	tri_32bit tri_23(data_readRegA, regOut[23], selA[23]);
	tri_32bit tri_24(data_readRegA, regOut[24], selA[24]);
	tri_32bit tri_25(data_readRegA, regOut[25], selA[25]);
	tri_32bit tri_26(data_readRegA, regOut[26], selA[26]);
	tri_32bit tri_27(data_readRegA, regOut[27], selA[27]);
	tri_32bit tri_28(data_readRegA, regOut[28], selA[28]);
	tri_32bit tri_29(data_readRegA, regOut[29], selA[29]);
	tri_32bit tri_30(data_readRegA, regOut[30], selA[30]);
	tri_32bit tri_31(data_readRegA, regOut[31], selA[31]);
	
	// read port B
	decoder_5to32_32bit decodeB(ctrl_readRegB, selB);
	
	tri_32bit trib_0(data_readRegB, regOut[0], selB[0]);
	tri_32bit trib_1(data_readRegB, regOut[1], selB[1]);
	tri_32bit trib_2(data_readRegB, regOut[2], selB[2]);
	tri_32bit trib_3(data_readRegB, regOut[3], selB[3]);
	tri_32bit trib_4(data_readRegB, regOut[4], selB[4]);
	tri_32bit trib_5(data_readRegB, regOut[5], selB[5]);
	tri_32bit trib_6(data_readRegB, regOut[6], selB[6]);
	tri_32bit trib_7(data_readRegB, regOut[7], selB[7]);
	tri_32bit trib_8(data_readRegB, regOut[8], selB[8]);
	tri_32bit trib_9(data_readRegB, regOut[9], selB[9]);
	tri_32bit trib_10(data_readRegB, regOut[10], selB[10]);
	tri_32bit trib_11(data_readRegB, regOut[11], selB[11]);
	tri_32bit trib_12(data_readRegB, regOut[12], selB[12]);
	tri_32bit trib_13(data_readRegB, regOut[13], selB[13]);
	tri_32bit trib_14(data_readRegB, regOut[14], selB[14]);
	tri_32bit trib_15(data_readRegB, regOut[15], selB[15]);
	tri_32bit trib_16(data_readRegB, regOut[16], selB[16]);
	tri_32bit trib_17(data_readRegB, regOut[17], selB[17]);
	tri_32bit trib_18(data_readRegB, regOut[18], selB[18]);
	tri_32bit trib_19(data_readRegB, regOut[19], selB[19]);
	tri_32bit trib_20(data_readRegB, regOut[20], selB[20]);
	tri_32bit trib_21(data_readRegB, regOut[21], selB[21]);
	tri_32bit trib_22(data_readRegB, regOut[22], selB[22]);
	tri_32bit trib_23(data_readRegB, regOut[23], selB[23]);
	tri_32bit trib_24(data_readRegB, regOut[24], selB[24]);
	tri_32bit trib_25(data_readRegB, regOut[25], selB[25]);
	tri_32bit trib_26(data_readRegB, regOut[26], selB[26]);
	tri_32bit trib_27(data_readRegB, regOut[27], selB[27]);
	tri_32bit trib_28(data_readRegB, regOut[28], selB[28]);
	tri_32bit trib_29(data_readRegB, regOut[29], selB[29]);
	tri_32bit trib_30(data_readRegB, regOut[30], selB[30]);
	tri_32bit trib_31(data_readRegB, regOut[31], selB[31]);


endmodule
