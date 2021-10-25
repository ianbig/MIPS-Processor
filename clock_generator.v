module clock_generator(clock, reset, imem_clock, dmem_clock, processor_clock, regfile_clock);
	input clock, reset;
	output imem_clock, dmem_clock, processor_clock, regfile_clock;
	
	//clk_div_6 clk_processor(clock, reset, processor_clock);
	sqwaveGen clk_processor(clock, reset, 4'd3, 4'd3, processor_clock);
	sqwaveGen clk_imem(~clock, reset, 4'd3, 4'd3, imem_clock);
	sqwaveGen clk_regfile(~clock, reset, 4'd4, 4'd2, regfile_clock);
endmodule
	