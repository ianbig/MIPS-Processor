`timescale 1 ns / 100 ps
module control_tb();


    reg clock;
	 reg[4:0] op;
	 wire rwe, rdst, aluinb, dmwe, rwd;
	 
	 integer errors;
	 control clu(op, rwe, rdst, aluinb, dmwe, rwd);
	 
    // setting the initial values of all the reg
    initial
    begin
        $display($time, " << Starting the Simulation >>");
        clock = 1'b0;    // at time 0
        errors = 0;
			
			op = 5'b00000;
        @(negedge clock);    // wait until next negative edge of clock
			op = 5'b00101;
        @(negedge clock);    // wait until next negative edge of clock
			op = 5'b00111;
			@(negedge clock);    // wait until next negative edge of clock
			op = 5'b01000;
			@(negedge clock);    // wait until next negative edge of clock
      
		

        if (errors == 0) begin
            $display("The simulation completed without errors");
        end
        else begin
            $display("The simulation failed with %d errors", errors);
        end

    end



    // Clock generator
    always
         #10     clock = ~clock;    // toggle

endmodule