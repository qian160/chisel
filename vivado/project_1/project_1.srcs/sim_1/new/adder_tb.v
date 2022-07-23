`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2022 04:01:07 PM
// Design Name: 
// Module Name: adder_tb
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


module adder_tb(

    );
    reg [7:0] x;
    reg [7:0] y;
    wire [7:0] z;
    wire ov;
    adder a0(
        .x(x),
        .y(y),
        .z(z),
        .ov(ov)
    );
    
    always #10 begin
        x = ($random)  % 100;
        y = ($random)  % 100;
    end
endmodule
