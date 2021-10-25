`timescale 1 ns / 100 ps
module sk_tb();
	 reg clock, reset;
	 //reg imem_clock, dmem_clock, processor_clock, regfile_clock;
    /* 
        Create four clocks for each module from the original input "clock".
        These four outputs will be used to run the clocked elements of your processor on the grading side. 
        You should output the clocks you have decided to use for the imem, dmem, regfile, and processor 
        (these may be inverted, divided, or unchanged from the original clock input). Your grade will be 
        based on proper functioning with this clock.
    */
    wire imem_clock, dmem_clock, processor_clock, regfile_clock; /
	 wire [31:0] q, ALU_reg_imm, ALU_reg_test;
	 
	 integer errors;
	 
	 skeleton ske(clock, reset, imem_clock, dmem_clock, processor_clock, regfile_clock, q, ALU_reg_imm, ALU_reg_test);
	 
    // setting the initial values of all the reg
    initial
    begin
        $display($time, " << Starting the Simulation >>");
        clock = 1'b0;    // at time 0
		  processor_clock = 1'b1; //TODO: delete
        errors = 0;
		  dmem_clock = 1'b0; //TODO: delete
		  regfile_clock = 1'b0; //TODO: delete
        reset = 1'b1;    // assert reset
		  
		  imem_clock = 1'b0;
        @(negedge processor_clock);    // wait until next negative edge of clock
        @(negedge processor_clock);    // wait until next negative edge of clock

        reset = 1'b0;    // de-assert reset
   
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
		  
		  check(32'b00101101000000001000000000000000, 32'd0, 32'd32768); //addi $20, $0, 32768	# r20 = 32768
		  check(32'b00000101001010000000011110010000, 32'd32768, 32'd0); //sll $20, $20, 15  #r20 = 1,073,741,824
		  check(32'b00101101001010000000000000000000, 32'd1073741824, 32'd0); //addi $20, $20, 0 #check r20 = 1,073,741,824
		  check(32'b00000101011010010100000000000000, 32'd1073741824, 32'd1073741824); //add $21, $20, $20	# add overflow
		  check(32'b00101111101111000000000000000000, 32'd1, 32'd0); //addi $30, $30, 0  #check r30 = 1
		  check(32'b00101101011010100000000000000000, 32'd0, 32'd0); //addi $21, $21, 0 #check r21 = 0
		  
		  check(32'b00101101100000001111111111111111, 32'd0, 32'd65535); //addi $22, $0, 65535 #r22 = 65535
		  check(32'b00000101101011000000011110010000, 32'd65535, 32'd0); // sll $22, $22, 15 #r22 = 2,147,450,880
		  check(32'b00101101101011000111111111111111, 32'd2147450880, 32'd32767); //addi $22, $22, 32767 #r22 = 2,147,483,647
		  check(32'b00101101101011000000000000000000, 32'd2147483647, 32'd0); //addi $22, $22, 0 #check r22 = 2,147,483,647
		  check(32'b00101101111011000000000000000001, 32'd2147483647, 32'd1); //addi $23, $22, 1 #addi overflow
		  check(32'b00101111101111000000000000000000, 32'd2, 32'd0); //addi $30, $30, 0  #check r30 = 2
		  check(32'b00101101111011100000000000000000, 32'd0, 32'd0); //addi $23, $23, 0 #check r23 = 0
		  
		  check(32'b00101101110000010000000000000000, 32'd0, 32'd4294901760); //addi $23, $0, 65536 #r23 = 65,536
		  check(32'b00000101111011100000011110010000, 32'd4294901760, 32'd0); //sll $23, $23, 15 #r23 = 2,147,483,648
		  check(32'b00101101111011100000000000000000, 32'd2147483648, 32'd0); //addi $23, $23, 0 #check r23 =  2,147,483,648
		  check(32'b00101110000000000000000000000001, 32'd0, 32'd1); //addi $24, $0, 1 #r24 = 1
		  check(32'b00000110011011111000000000000100, 32'd2147483648, 32'd1); //sub $25, $23, $24 # sub overflow
		  check(32'b00101111101111000000000000000000, 32'd3, 32'd0); //addi $30, $30, 0 #check r30 = 3
		  check(32'b00101110011100100000000000000000, 32'd0, 32'd0); //addi $25, $25, 0 #check r25 = 0
		

        if (errors == 0) begin
            $display("The simulation completed without errors");
        end
        else begin
            $display("The simulation failed with %d errors", errors);
        end

        //$stop;
    end



    // Clock generator
    always begin
         #10     clock = ~clock;    // toggle
	 end
	 
	 always begin
		 #60 processor_clock= ~processor_clock;
	 end
	 
	 always begin
		 #10 imem_clock= ~imem_clock;
		 #110 imem_clock = ~imem_clock;
	 end
	 
	 always begin
//		#30 regfile_clock = ~regfile_clock;
//		#40 regfile_clock = ~regfile_clock;
//		#40 regfile_clock = ~regfile_clock;
		#110 regfile_clock = ~regfile_clock;
		#10 regfile_clock = ~regfile_clock;
	 end

	 task check;
			
		  input [31:0] check_q;
        input [31:0] check_ALU_reg_test;
        input [31:0] check_ALU_reg_imm;

        begin
            @(negedge processor_clock);    // wait for next negedge of clock

            if(q !== check_q) begin
                $display("**Error on opcode: read %h but expected %h.", q, check_q);
                errors = errors + 1;
            end
				if(ALU_reg_test !== check_ALU_reg_test) begin
                $display("**Error on ALU_reg_test: read %h but expected %h. q: %h", ALU_reg_test, check_ALU_reg_test, q);
                errors = errors + 1;
            end
				if(ALU_reg_imm !== check_ALU_reg_imm) begin
                $display("**Error on ALU_reg_imm: read %h but expected %h. q: %h", ALU_reg_imm, check_ALU_reg_imm, q);
                errors = errors + 1;
            end
        end
    endtask
			
			
endmodule