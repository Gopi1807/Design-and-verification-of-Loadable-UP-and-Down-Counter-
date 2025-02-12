`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2025 15:28:41
// Design Name: 
// Module Name: tb_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module tb_counter();
    reg clk;
    reg rst_n;
    reg load;
    reg up_down;
    reg [3:0] din;
    // Output
    wire [3:0] count;
    
    
    counter dut(
        .clk(clk),
        .rst_n(rst_n),
        .load(load),
        .up_down(up_down),
        .din(din),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 1;
        load = 0;
        up_down = 0;
        din = 4'b0000;

        #10;
        rst_n = 0;
        #10;
        rst_n = 1;

        #10;
        load = 1;
        din = 4'b1011;
        #10;
        load = 0;  
      
        #20;       
        up_down = 1;
        #100;
        
        up_down = 0;
        #100;

        $stop;
    end

    
    initial begin
        $monitor($time, " | clk = %b, rst_n = %b, load = %b, up_down = %b, din = %b, count = %b",
                  clk, rst_n, load, up_down, din, count);
    end
    
endmodule
