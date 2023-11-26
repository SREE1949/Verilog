
module seq_det(
  input clk,rst,in,
  output reg out);
  
  parameter s1=2'b00,
            s2=2'b01,
            s3=2'b10,
            s4=2'b11; 
  reg [1:0] c_state,n_state,p_state;
  
  always@(posedge clk) begin
    if(rst) begin
      n_state<=s1;
      c_state<=s1;
      out<=0;
    end
    else begin
      p_state<=c_state;
      c_state<=n_state;
    end 
  end
  
  always@(in or c_state) begin
      
    case(c_state) 
      s1: begin
        if(in==1)
          n_state=s2;
        else if(in==0)
          n_state=s1;
      end
      s2: begin
        if(in==1)
          n_state=s2;
        else if(in==0)
          n_state=s3;
      end
      s3: begin
        if(in==1)
          n_state=s4;
        else if(in==0)
          n_state=s1;
      end
      s4: begin
        if(in==1) 
          n_state=s1;  //n_state=s2 for overlapping sequence 
                 
        else if(in==0)
          n_state=s3;
      end      
    endcase  
    
    
    if(p_state == s4 && c_state==s1)    // if(p_state == s4 && c_state==s2) for overlapping sequence
      out <= in==1? 1 : 0;
    else
      out <= 0;
  end
  
endmodule
