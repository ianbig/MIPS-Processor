module register_12bit(out, in, clk, clr);
	input [11:0] in;
	input clk, clr;
	output reg [11:0] out;
	
	always @(posedge clk or posedge clr) begin
       if (clr) begin
           out <= 12'b0;
       end else begin
           out <= in;
       end
   end
	
endmodule
	