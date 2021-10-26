`timescale 1 ns / 100 ps
module dmem_tb();

	reg	[11:0]  address;
	reg	  clock;
	reg	[31:0]  data;
	reg	  wren;
	wire	[31:0]  q;

	// Tracking the number of errors
   integer errors;
   integer index;    // for testing...
	
dmem my_dmem(
        .address    (address),       // address of data
        .clock      (clock),                  // may need to invert the clock
        .data	    (data),    // data you want to write
        .wren	    (wren),      // write enable
        .q          (q)    // data from dmem
    );
	 
	  // setting the initial values of all the reg
    initial
    begin
        $display($time, " << Starting the Simulation >>");
        clock = 1'b0;    // at time 0
        errors = 0;

        @(negedge clock);    // wait until next negative edge of clock

        // Begin testing... (loop over registers)
        for(index = 0; index <= 4000; index = index + 2) begin
            writeMem(index, index*28937);
            checkMem(index, index*28937);
        end

		  
//		  @(negedge clock);
//		  ctrl_reset = 1'b1;
//		  @(negedge clock);
//		  ctrl_reset = 1'b0;
//		  @(negedge clock);
//		  
//		  for (index = 0; index <= 31; index = index + 1) begin
//			 checkRegister(index, 32'h00000000);
//		  end

        if (errors == 0) begin
            $display("The simulation completed without errors");
        end
        else begin
            $display("The simulation failed with %d errors", errors);
        end

        $stop;
    end



    // Clock generator
    always
         #15     clock = ~clock;    // toggle

    // Task for writing
    task writeMem;

        input [11:0] writeAddr;
        input [31:0] value;

        begin
            @(negedge clock);    // wait for next negedge of clock
            $display($time, " << Writing Mem %d with %h >>", writeAddr, value);

            wren = 1'b1;
            address = writeAddr;
            data = value;

            @(negedge clock); // wait for next negedge, write should be done
            wren = 1'b0;
        end
    endtask

	 
	 task checkMem;

        input [11:0] writeAddr;
        input [31:0] exp;

        begin
            address = writeAddr;    // test port A

            if(q !== exp) begin
                $display("**Error on q: read %h but expected %h.", q, exp);
                errors = errors + 1;
            end
        end
    endtask
	 
endmodule
	 
	 