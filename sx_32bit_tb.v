`timescale 1 ns / 100 ps

module sx_32bit_tb();
	reg [16:0] a;
	reg clock;
	wire [31:0] out;
	
	sx_32bit extend_test(a, out);
	integer errors;
	
	initial
		begin
		a=0;
		 errors = 0;
		 clock = 0;
		 @(negedge clock);
		 a = 17'd20;
		 @(negedge clock);
		 if (out != 32'd20) begin
			errors = errors + 1;
		 end
		  @(negedge clock);
		 a = 17'b10101010101010101;
		 @(negedge clock);
		 if (out != 32'b11111111111111110101010101010101) begin
			errors = errors + 1;
		 end
		 
		 if (errors == 0) begin
            $display("The simulation completed without errors");
        end
        else begin
            $display("The simulation failed with %d errors", errors);
        end
		 
		end
		
		always #3.5 clock = ~clock;
	
endmodule