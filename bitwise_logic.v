module bitwise_logic(a, b, opcode, result);
		input [31:0] a, b;
		input opcode;
		output [31:0] result;
		
		wire [31:0] result_and, result_or;
		
		genvar i;
		generate
			for(i=0;i<32;i=i+1) begin: AND
				and(result_and[i], a[i], b[i]);
			end
		endgenerate
		
		generate
			for(i=0;i<32;i=i+1) begin: OR
				or(result_or[i], a[i], b[i]);
			end
		endgenerate
		
		assign result = opcode ? result_or : result_and;
		
endmodule
