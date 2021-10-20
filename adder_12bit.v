module adder_12bit(data_operandA, data_operandB,data_result);

	input [11:0] data_operandA, data_operandB;
	output reg [11:0] data_result;
	
	always @(data_operandA or data_operandB) begin
		data_result = data_operandA + data_operandB;  // ADD
	end
	
endmodule
