// You need to generate this component correctly
module imem(address, clock, q);

	input [11:0] address;
	input clock;
	output reg [31:0] q;

	reg[31:0] registers[4095:0];
	
	always @(posedge clock)
	begin
		q = registers[address];
	end
	
	initial
	begin
		registers[0] = 32'd0;
		registers[1024] = 32'd1024;
		registers[4095] = 32'd359;
	end
	
endmodule
