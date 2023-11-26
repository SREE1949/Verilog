module tb;
  reg clk,rst,in;
  wire out;
  int i,r;
  seq_det dut(.clk(clk),.rst(rst),.in(in),.out(out));
  
  always #2 clk<=~clk;
  
  initial begin
    clk=0;
    $monitor("time=%0t  in=%0d  rst=%0d out=%0d ",$time,in,rst,out);
    repeat(2) @(posedge clk) rst=1;
    @(posedge clk) rst=0;
    @(posedge clk) in=1;
    @(posedge clk) in=0;
    @(posedge clk) in=1;
    @(posedge clk) in=1;
    @(posedge clk) in=0;
    @(posedge clk) in=1;
    @(posedge clk) in=1;
    @(posedge clk) in=0;
    @(posedge clk) in=1;
    @(posedge clk) in=1;
/*
    for(i=1;i<30;i++) begin
      r=$random;
      #5 in=r%2;
    end
    */ 
    #4 $finish;    
  end 
endmodule
