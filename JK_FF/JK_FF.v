// Code your design here
module jk_ff(
  input clk,rst,j,k,
  output reg q_out);
  //reg out;
  always@(posedge clk) begin
    if(rst) 
      q_out <= 0;
    else begin
      if(j==0 && k==1)
        q_out <=0;
        
      else if(j==1 && k==0)
        q_out <=1;
        
      else if(j==1 && k==1)
        q_out <=~q_out;
    end
  end
  //assign q_out = out;
endmodule  
