`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gopi Chand Ananthu
// 
// Create Date: 12.02.2025 15:25:47
// Design Name: 
// Module Name: counter
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


module counter(
    // Inputs
    input clk,
    input rst_n,
    input load,
    input up_down,
    input [3:0] din,
    //output
    output reg [3:0] count
);

always@(posedge clk or negedge rst_n) begin
    if (rst_n) begin
       count <= 4'b0000;
    end
    else if (load) begin
       count <= din;
    end
    else begin
       if (up_down == 0) begin
           if (count > 15) begin
             count <= 4'b0000;
           end
           else begin
             count <= count + 1'b1;
           end
       end
       else begin
            if (count < 1) begin
             count <= 4'b1111;
           end
           else begin
             count <= count - 1'b1;
           end
       end
    end   
end

endmodule
