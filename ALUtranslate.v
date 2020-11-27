`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2019 06:04:47 PM
// Design Name: 
// Module Name: ALUtranslate
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


module ALUtranslate(ALUop, Opcode, ALUCtrl);

input [1:0] ALUop;
input [10:0] Opcode;
output reg [3:0] ALUCtrl;

always @ (ALUop|Opcode) begin
    case(ALUop)
        2'b10:
        case(Opcode)  
            11'b10001011000: ALUCtrl <= 4'b0010; //add
            11'b11001011000: ALUCtrl <= 4'b0110; //sub
            11'b10001010000: ALUCtrl <= 4'b0000; //and
            11'b10101010000: ALUCtrl <= 4'b0001; //or
            default: ALUCtrl <= 4'bxxxx; //and
        endcase
        2'b01: //CBZ
        ALUCtrl <= 4'b0111;
        2'b00: //load and store
        ALUCtrl <= 4'b0010;
    endcase
end 

endmodule
