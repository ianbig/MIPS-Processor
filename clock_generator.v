module clock_generator(clock, reset, imem_clock, dmem_clock, processor_clock, regfile_clock);
	input clock, reset;
	output imem_clock, dmem_clock, processor_clock, regfile_clock;
	
	clk_processor clock_processor(clock, reset, processor_clock);
	clk_imem clock_imem(~clock, reset, imem_clock);
	clk_regfile clock_regfile(~clock, reset, regfile_clock);
	clk_dmem clock_dmem(clock, reset, dmem_clock);
	
endmodule
	