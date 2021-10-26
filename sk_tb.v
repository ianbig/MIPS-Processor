`timescale 1 ns / 100 ps
module sk_tb();

	reg clock, reset;
	wire imem_clock, dmem_clock, processor_clock, regfile_clock;
	
	skeleton my_sk(clock, reset, imem_clock, dmem_clock, processor_clock, regfile_clock); 
	
	initial
    begin
        $display($time, " << Starting the Simulation >>");
        clock = 1'b0;    // at time 0
		  reset = 1'b1;
			
        @(negedge clock);    // wait until next negative edge of clock
        @(negedge clock);    // wait until next negative edge of clock
			@(negedge clock);    // wait until next negative edge of clock
			@(negedge clock);    // wait until next negative edge of clock
			reset = 1'b0;
		

    end



    // Clock generator
    always
         #20     clock = ~clock;    // toggle
	
endmodule