module sqwaveGen(clk,reset,rise,fall,clk_out);
	input wire clk;
	input wire reset;
	output wire clk_out;
	input wire [3:0] rise; 
	input wire [3:0] fall;
	reg [3:0] count, count_on, count_off;
	reg  pos_or_neg;
 
 
	always @(posedge clk, posedge reset) begin
		if(reset) begin
 
			count<= 0;
			count <= 0;
			pos_or_neg <= 0;
 
		end 
		else  if ( (pos_or_neg ==1) ) begin
			if ((count == count_on-1) ) begin 
					count <=0;
					pos_or_neg <=0;  	  
			end
			else 
				count <= count+1;
		end
		else  if ( (pos_or_neg ==0) )begin
			if ((count == count_off-1) ) begin 
				count <=0;
				pos_or_neg <=1;  	  
			end
			else 
				count <= count+1;
		end
	end	
 
	always @(rise, fall) begin
		count_on <= rise;
		count_off <= fall;	
	end	
 
	assign clk_out = pos_or_neg;
 
endmodule
