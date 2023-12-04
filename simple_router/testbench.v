
module tb;
  reg in,clk,rst,rx_ready;
  wire [3:0] dst [3:0];
  wire [3:0] tx_ready;
  
  rtr dut(in,clk,rst,rx_ready,dst,tx_ready);
  
  always #2 clk=~clk;
  
  initial begin
    $monitor("%0t in=%0d rst=%0d rx_ready=%0d  tx_ready=%0b dst[3]=%0d dst[2]=%0d dst[1]=%0d dst[0]=%0d",$time,in,rst,rx_ready,tx_ready,dst[3],dst[2],dst[1],dst[0]);
    clk=0;
    
    #4 rst=1;
    #4 rst=0; rx_ready=0; in=1;
    #4 rst=0; rx_ready=0; in=1;
    
    #4 rst=0; rx_ready=1; in=1;
    #4 rst=0; rx_ready=1; in=0;
    #4 rst=0; rx_ready=1; in=0;
    #4 rst=0; rx_ready=1; in=1;
    #4 rst=0; rx_ready=0; in=1;
    
    #4 rst=0; rx_ready=1; in=1;
    #4 rst=0; rx_ready=1; in=0;
    #4 rst=0; rx_ready=1; in=1;
    #4 rst=0; rx_ready=1; in=1;
    #4 rst=0; rx_ready=1; in=0;
    #4 rst=0; rx_ready=1; in=0;
    
    #4 rst=0; rx_ready=0; in=0;
    #4 rst=0; rx_ready=0; in=1;
    #4 rst=0; rx_ready=0; in=0;
    #4 rst=0; rx_ready=0; in=1;
    #10 $finish;
  end
endmodule
