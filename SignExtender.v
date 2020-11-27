`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2019 06:37:41 PM
// Design Name: 
// Module Name: SignExtender
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
module SignExtender1(BusImm, Instruction);
    output reg [63:0] BusImm;
    input [31:0] Instruction;
    always@(Instruction)begin
           BusImm[31:0]=Instruction[31:0];
           if(Instruction[31])
               BusImm[63:32] <= 32'b11111111111111111111111111111111;
           else
               BusImm[63:32] <= 32'b00000000000000000000000000000000;
        end
endmodule

module SignExtender(
	output reg [63:0] BusImm,
	input [31:0] Instruction
	
	);
	
	always@(*) begin
		casex(Instruction[31:21])
			11'b111110000x0: // D - LDUR STUR
				BusImm = {{55{Instruction[20]}},Instruction[20:12]};
			11'b10110100xxx: // CB - CBZ
				BusImm = {{43{Instruction[23]}},Instruction[23:5],2'b0};
			11'b000101xxxxx: // B - B
				BusImm = {{36{Instruction[25]}},Instruction[25:0],2'b0};
			11'b1101001101x: // R - LSL LSR (shamt)
				BusImm = {58'b0, Instruction[15:10]};
			11'b1xx100xx00x: // R - ADDI ANDI ORRI SUBI (immediate)
				BusImm = {52'b0, Instruction[21:10]};
			default: // R - ADD SUB AND ORR (ALUSrc is not accepting SignExtender's output)
				BusImm = 0;
		endcase
	end
endmodule

