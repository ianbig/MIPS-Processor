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
    wire imem_clock, dmem_clock, processor_clock, regfile_clock;
	 wire [31:0] q, ALU_reg_imm, ALU_reg_test;
	 
	 integer errors;
	 
	 skeleton ske(clock, reset, imem_clock, dmem_clock, processor_clock, regfile_clock, q, ALU_reg_imm, ALU_reg_test);
	 
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
		  @(negedge clock);
		  
        check(32'b00101000010000000000000000000101, 0, 32'd5); //addi $1, $0, 5  # r1 = 5
		  check(32'b00101000100000000000000000000011, 0, 32'd3); // addi $2, $0, 3  # r2 = 3
		  check(32'b00000000110000100010000000000000, 32'd5, 32'd3); //add  $3, $1, $2 # r3 = 5 + 3 = 8
		  check(32'b00101000110001100000000000000000, 32'd8, 32'd0); //addi $3, $3, 0  #check r3 = 8
		  check(32'b00000001000000100010000000000100, 32'd5, 32'd3); // sub $4, $1, $2 	# r4 = r1 - r2 = 2
		  check(32'b00101001000010000000000000000000, 32'd2, 32'd0); //addi $4, $4, 0  #check r4 =2
		  check(32'b00000001010000000001000000001000, 0, 32'd5); //and $5, $0, $1 	# r5 = 0
		  check(32'b00101001010010100000000000000000, 0, 32'd0); //addi $5, $5, 0 #check r5
		  check(32'b00000001100000100010000000001000, 32'd5, 32'd3); // and $6, $1, $2  # r6 = 1
		  check(32'b00101001100011000000000000000000, 32'd1, 32'd0); //addi $6, $6, 0 #check r6 = 1
		  check(32'b00000001110000000010000000001100, 0, 32'd3); //or  $7, $0, $2	# r7 = 3
		  check(32'b00101001110011100000000000000000, 32'd3, 32'd0); //addi $7, $7, 0 #check r7 = 3
		  check(32'b00000010000000100000000100010000, 32'd5, 32'd0); //sll $8, $1, 2	# r8 = r1 * 4 = 20
		  check(32'b00101010000100000000000000000000, 32'd20, 32'd0); //addi $8, $8, 0   #check r8 = 20
		  check(32'b00000010010001100000000010010100, 32'd8, 32'd0); // sra $9, $3, 1	# r9 = 4
		  check(32'b00101010010100100000000000000000, 32'd4, 32'd0); //addi $9, $9, 0  #check r9 = 4
		

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

	 task check;
			
		  input [31:0] check_q;
        input [31:0] check_ALU_reg_test;
        input [31:0] check_ALU_reg_imm;

        begin
            @(negedge clock);    // wait for next negedge of clock

            if(q !== check_q) begin
                $display("**Error on opcode: read %h but expected %h.", q, check_q);
                errors = errors + 1;
            end
				if(ALU_reg_test !== check_ALU_reg_test) begin
                $display("**Error on ALU_reg_test: read %h but expected %h.", ALU_reg_test, check_ALU_reg_test);
                errors = errors + 1;
            end
				if(ALU_reg_imm !== check_ALU_reg_imm) begin
                $display("**Error on ALU_reg_imm: read %h but expected %h.", ALU_reg_imm, check_ALU_reg_imm);
                errors = errors + 1;
            end
        end
    endtask
			
			
endmodule