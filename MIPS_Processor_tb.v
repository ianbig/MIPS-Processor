// ---------- SAMPLE TEST BENCH ----------
`timescale 1 ns / 100 ps
module MIPS_Processor_tb();

    reg clock, reset;

    // Imem
    wire [11:0] address_imem;
    reg [31:0] q_imem;

    // Dmem
    wire [11:0] address_dmem;
    wire [31:0] data;
    wire wren;
    reg [31:0] q_dmem;

    // Regfile
    wire ctrl_writeEnable;
    wire [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    wire [31:0] data_writeReg;
    reg [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */
	 //wire [11:0] out_PC;
	 //wire [11:0] in_PC;
	 wire [11:0] out_PC;
	 wire [11:0] in_PC;
	 
	 integer errors;
	 
	 processor MIPS_Processor(
	 
	 out_PC,
	 in_PC,
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
);
	 
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
	