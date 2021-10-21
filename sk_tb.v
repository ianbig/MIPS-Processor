`timescale 1 ns / 100 ps
module sk_tb();
	 reg clock, reset;
    /* 
        Create four clocks for each module from the original input "clock".
        These four outputs will be used to run the clocked elements of your processor on the grading side. 
        You should output the clocks you have decided to use for the imem, dmem, regfile, and processor 
        (these may be inverted, divided, or unchanged from the original clock input). Your grade will be 
        based on proper functioning with this clock.
    */
    wire imem_clock, dmem_clock, processor_clock, regfile_clock, q;

	 
	 integer errors;
	 
	 skeleton ske(clock, reset, imem_clock, dmem_clock, processor_clock, regfile_clock, q);
	 
    // setting the initial values of all the reg
    initial
    begin
        $display($time, " << Starting the Simulation >>");
        clock = 1'b0;    // at time 0
        errors = 0;

        reset = 1'b1;    // assert reset
        @(negedge clock);    // wait until next negative edge of clock
        @(negedge clock);    // wait until next negative edge of clock

        reset = 1'b0;    // de-assert reset
        @(negedge clock);    // wait until next negative edge of clock

      
		

        if (errors == 0) begin
            $display("The simulation completed without errors");
        end
        else begin
            $display("The simulation failed with %d errors", errors);
        end

        //$stop;
    end



    // Clock generator
    always
         #10     clock = ~clock;    // toggle

endmodule