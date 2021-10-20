module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	
	wire [31:0] Bx, result_CSA, result_logic, result_SLL, result_SRA;
	wire cout; //for extendible
	
	genvar i;

	generate
		for (i=0;i<32;i=i+1) begin: notgate
			xor(Bx[i], data_operandB[i], ctrl_ALUopcode[0]);
		end
	endgenerate
	
	CSA_32bit csa(data_operandA, Bx, ctrl_ALUopcode[0], result_CSA, cout, overflow, isLessThan, isNotEqual);
	bitwise_logic bitlog(data_operandA, data_operandB, ctrl_ALUopcode[0], result_logic);
	SLL_32bit sll(data_operandA, ctrl_shiftamt, result_SLL);
	SRA_32bit sra(data_operandA, ctrl_shiftamt, result_SRA);
	
	assign data_result = ctrl_ALUopcode[2] ? (ctrl_ALUopcode[0] ? result_SRA : result_SLL) : (ctrl_ALUopcode[1] ? result_logic : result_CSA);
	

endmodule
