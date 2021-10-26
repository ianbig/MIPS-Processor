`timescale 1 ns / 100 ps
module clock_generator_tb();

	reg clock, reset;
	wire imem_clock, dmem_clock, processor_clock, regfile_clock;

	//clk_processor clock_generator(clock, reset, processor_clock);
	clock_generator clk_generator(clock, reset, imem_clock, dmem_clock, processor_clock, regfile_clock);
	
	initial begin
		$display($time, " << Starting the Simulation >>");
       clock = 1'b0;    // at time 0
		 reset = 1'b1;    // assert reset
		  @(negedge clock);    // wait until next negative edge of clock
        @(negedge clock);    // wait until next negative edge of clock
			//#480

        reset = 1'b0;    // de-assert reset
	end
	
	always begin
         #20     clock = ~clock;    // toggle
	 end

endmodule
