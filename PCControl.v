`timescale 1ns / 1ps

module PCControl(
output reg [63:0] nextPC, 
input [63:0] curPc, signExt, 
input B, UB, Zero);
always @(*) begin
	if((B&Zero)|UB) 
		nextPC = curPc + signExt;
	else
		nextPC = curPc + 4;
end
endmodule