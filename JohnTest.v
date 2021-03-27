`timescale 1ns / 1ps
    module tb();
    	// Inputs
    	reg clock;
    	reg reset;
    	// Outputs
      wire[3:0] q;
	initial begin $dumpfile("JohnTest.vcd"); $dumpvars(0,tb); end
    	// Instantiate the Unit Under Test (UUT)
    	
	johnson_ctr r2 (
		.clk(clock), 
          .reset(reset), 
          .out(q)
    	);
      always #10 clock = ~clock;
     
    	initial begin
    		// Initialize Inputs
        clock = 0;  
    	reset = 0;
     
    	#5 reset = 1;
    	#20 reset = 0; 
    	#500 $finish;
        end  
     
    		initial begin
              $monitor($time, " clock=%1b,reset=%1b,q=%4b",clock,reset,q);
    		 end
     
    endmodule
