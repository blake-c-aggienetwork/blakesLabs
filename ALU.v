`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2019 11:42:34 PM
// Design Name: 
// Module Name: ALU
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


module ALU(BusW, BusA, BusB, ALUCtrl, Zero);
    output reg [63:0] BusW;
    output Zero;
    input [63:0] BusA, BusB;
    input [3:0] ALUCtrl;
    
    always@(*) begin
        case(ALUCtrl)
            4'b0000: BusW = BusA&BusB; //and case
            4'b0001: BusW = BusA|BusB; //or case
            4'b0010: BusW = $signed(BusA)+$signed(BusB); //add case
            4'b0110: BusW = $signed(BusA)-$signed(BusB); //sub case
            4'b0111: BusW = BusB; //pass case
        endcase
    end
    assign Zero = (BusW == 0)?1:0;
    
endmodule
