module tb;
  reg in,rst,clk;
  wire out;
  
  mealy_seq dut(in,clk,rst,out);
  
  always #2 clk=~clk;
  
  initial begin
    clk=0;
    $monitor("%0t  in=%0d rst=%0d out=%0d",$time,in,rst,out);
    
    #4 in=0; rst=1;
    #4 in=1; rst=1;
    #4 in=0; rst=1;
    #4 in=0; rst=0;
    #4 in=1; rst=0;
    #4 in=1; rst=0;
    #4 in=0; rst=0;
    #4 in=0; rst=0;
    #4 in=1; rst=0;
    #4 in=1; rst=0;
    #4 in=0; rst=0;
    #4 in=0; rst=0;
    #4 in=1; rst=0;
    #4 in=0; rst=0;
    #4 in=0; rst=0;
  end
endmodule
