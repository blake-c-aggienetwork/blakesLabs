`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2019 11:41:31 PM
// Design Name: 
// Module Name: RegisterFile
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

module RegisterFile(BusA, BusB, BusW, RW, RA, RB, RegWr, Clk);
    output [63:0] BusA;
    output [63:0] BusB;
    input [63:0] BusW;
    input [4:0] RA, RB, RW;
    input RegWr;
    input Clk;
    reg [63:0] registers [31:0];
    
    
    
    assign BusA = (RA==5'b11111)? 64'b0 : registers[RA];
    assign BusB = (RB==5'b11111)? 64'b0 : registers[RB];    
    
     
    always @ (negedge Clk) begin
        if(RegWr)
            registers[RW] <= BusW;
    end
    
    always@(*) begin
        registers[31] <= 0;
    end


endmodule
