`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2019 05:47:17 PM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory0(ReadData, Address, WriteData,
MemoryRead, MemoryWrite, Clock);

input [63:0] Address, WriteData;
input MemoryRead, MemoryWrite, Clock;
output reg [63:0] ReadData;

reg [63:0] memory [63:0];

always @ (negedge Clock) begin
    if (MemoryWrite&~MemoryRead)
        memory[Address] <= #20 WriteData;
end

always @ (posedge Clock) begin
    if (MemoryRead&~MemoryWrite)
        ReadData <= #20 memory[Address];
end




endmodule
