/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
	 ALU_reg_imm, //test
	 ALU_reg_test, //test
	 
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
    // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */

	 wire [11:0] in_PC;
	 register_12bit PC(address_imem, in_PC, clock, reset);
	 adder_12bit PC_adder(address_imem, 1, in_PC);
	 
	 wire aluinb; //seclect bit for alu mux
	 wire rwd; //select bit for data mem output
	 control control_logic(q_imem[31:27], ctrl_writeEnable, aluinb, wren, rwd);
	 
	 //regfile
	 assign ctrl_readRegA = q_imem[21:17];
	 assign ctrl_readRegB = q_imem[16:12];
	 
	 wire overflow;
	 wire [31:0] add_sub_mux, addi_mux, out_ALU, mux_ALU_Dmem;
	 mux_2to1_5bit ove_rd(q_imem[26:22], 5'b11110, overflow, ctrl_writeReg); //overflow rd
	 mux_2to1_32bit add_sub(32'd1, 32'd3, q_imem[2], add_sub_mux); //q_imem[2] = ALU_op[0]
	 mux_2to1_32bit add_add_mux(add_sub_mux, 32'd2, q_imem[27], addi_mux); //q_imem[27] = opcode[0]
	 mux_2to1_32bit ove_ALU_mux(mux_ALU_Dmem, addi_mux, overflow, data_writeReg);
	 
	 //sign extention
	 wire [31:0] out_sx;
	 sx_32bit sign_extention(q_imem[16:0], out_sx);
	 
	 //ALU
	 //wire [31:0] ALU_reg_imm;
	 output [31:0] ALU_reg_imm; //test
	 output [31:0] ALU_reg_test;  //test
	 assign ALU_reg_test = data_readRegA;  //test
	 mux_2to1_32bit mux_ALU(data_readRegB, out_sx, aluinb, ALU_reg_imm);
	 
	 wire isNotEqual, isLessThan;
	 wire [4:0] ALU_op;
	 assign ALU_op = (q_imem[31:27] == 5'b00000) ? q_imem[6:2] : 5'b00000; 
	 alu my_alu(data_readRegA, ALU_reg_imm, ALU_op, q_imem[11:7], out_ALU, 
					isNotEqual, isLessThan, overflow);
	
	 //datamemory
	 assign address_dmen = out_ALU[11:0];
	 assign data = data_readRegB;
	 //mux for alu and data memory
	 mux_2to1_32bit(q_dmem, out_ALU, rwd, mux_ALU_Dmem);
	 
endmodule
