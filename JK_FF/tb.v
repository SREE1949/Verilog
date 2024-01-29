// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst,j,k;
  wire q_out;
  
  jk_ff dut(clk,rst,j,k,q_out);
  always #1 clk=~clk;
  
  initial begin
    clk=0;
    $monitor("%0t time clk=%b rts=%b j=%b k=%b out=%b",$time,clk,rst,j,k,q_out);
    #2 rst=1 ;
    #2 rst=0; j=0; k=1;
    #2 rst=0; j=1; k=0;
    #2 rst=0; j=1; k=0;
    #2 rst=0; j=0; k=0;
    #2 rst=0; j=1; k=1;
    #2 rst=0; j=0; k=0;
    #2 $finish;
    end
  initial begin 
    $dumpfile("graph.vcd");
    $dumpvars;
  end
endmodule
    
