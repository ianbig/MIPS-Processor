`timescale 1 ns / 100 ps
module clock_generator_tb();

	reg clock, reset, dmem_clock;
	wire imem_clock, processor_clock, regfile_clock;

	clock_generator clk_generator(clock, reset, imem_clock, dmem_clock, processor_clock, regfile_clock);
	
	initial begin
		$display($time, " << Starting the Simulation >>");
       clock = 1'b0;    // at time 0
		 reset = 1'b1;    // assert reset
		  @(negedge processor_clock);    // wait until next negative edge of clock
        @(negedge processor_clock);    // wait until next negative edge of clock

        reset = 1'b0;    // de-assert reset
	end
	
	always begin
         #10     clock = ~clock;    // toggle
	 end
	
endmodule
