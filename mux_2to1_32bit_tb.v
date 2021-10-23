`timescale 1 ns / 100 ps

module mux_2to1_32bit_tb();
	reg clock;
	reg [31:0] a, b;
	reg s;
	wire [31:0] out;
	
	integer errors;
	
	mux_2to1_32bit muxTest(a, b, s, out);
	
	initial 
	begin
		a = 32'd0;
		b = 32'd123;
		errors = 0;
		s = 1'b0;
		clock = 0;
		@(negedge clock);
		if (out != a) begin
			errors = errors + 1;
		end
		s = 1'b0;
		@(negedge clock);
		if (out != a) begin
			errors = errors + 1;
		end
		s = 1'b1;
		@(negedge clock);
		if (out != b) begin
			errors = errors + 1;
		end
		s = 1'b1;
		@(negedge clock);
		if (out != b) begin
			errors = errors + 1;
		end
		s = 1'b1;
		@(negedge clock);
		if (out != b) begin
			errors = errors + 1;
		end
		s = 1'b0;
		@(negedge clock);
		if (out != a) begin
			errors = errors + 1;
		end
		
		if (errors == 0) begin
            $display("The simulation completed without errors");
        end
        else begin
            $display("The simulation failed with %d errors", errors);
        end
		
	end
	
	always 
		#6 clock = ~clock;
	
endmodule
	