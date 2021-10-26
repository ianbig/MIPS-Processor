module clk_dmem(clk, reset, clk_out);
input clk;
input reset;
output clk_out;
reg [3:0] count;
reg  pos_or_neg;

parameter rise = 5;
parameter fall = 1;
 
always @(posedge clk, posedge reset) begin
    if(reset) begin
 
		  count<= 0;
        pos_or_neg <=0;
 
		end 
	else  if ( (pos_or_neg ==1) )
	begin
	if ((count == rise-1) )
		begin 
		count <=0;
		pos_or_neg <=0;  	  
		end
	else 
	count <= count+1;
	end
	else  if ( (pos_or_neg ==0) )
	begin
	if ((count == fall-1) )
		begin 
		count <=0;
		pos_or_neg <=1;  	  
		end
	else 
	count <= count+1;
	end
end	
 
assign clk_out = pos_or_neg;
 
endmodule