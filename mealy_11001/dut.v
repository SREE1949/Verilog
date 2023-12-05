module mealy_seq(
  input in,clk,rst,
  output out);
  
  parameter s1=1;
  parameter s2=2;
  parameter s3=3;
  parameter s4=4;
  parameter s5=5;
  
  reg [2:0] p_state,n_state;
  
  always@(posedge clk) begin
    if(rst) begin
      p_state <=s1;
    end
    
    else begin
      p_state <= n_state;
    end
  end
  
  always@(p_state or in) begin
    case(p_state) 
      s1: begin
        if(in)
          n_state <= s2;
        else
          n_state <= s1;
      end
      
      s2: begin
        if(in)
          n_state <= s3;
        else
          n_state <= s1;
      end
      
      s3: begin
        if(in)
          n_state <= s3;
        else
          n_state <= s4;
      end
      
      s4: begin
        if(in)
          n_state <= s2;
        else
          n_state <= s5;
      end
      
      s5: begin
        if(in)
          n_state <= s2;
        else
          n_state <= s1;
      end
      default:n_state <=s1;
      endcase
    end
      
  assign out = (p_state==s5) && (in==1)? 1 : 0;
      
    
      endmodule  
    
