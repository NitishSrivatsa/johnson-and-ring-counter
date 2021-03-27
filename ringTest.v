`timescale 1ns/1ps
module tb();
    reg clk_tb,clr_tb;
    wire [3:0]q_tb;
    ring_count dut1(q_tb,clk_tb,clr_tb);
    initial begin $dumpfile("ringTest.vcd"); $dumpvars(0,tb); end
    initial 
        begin
        $display(“time,\t clk_tb,\t clr_tb,\t q_tb”);
        $monitor(“%g,\t %b,\t %b,\t %b”,$time,clk_tb,clr_tb,q_tb);
        clr_tb=1′b0;
        #50 clr_tb=1′b1;
        #100 clr_tb=1′b0;
        end
        always 
            begin
            #50 clk_tb=1′b1;
            #50 clk_tb=1′b0;
            end
endmodule
