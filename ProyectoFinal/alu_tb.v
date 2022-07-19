/*******************************
Universidad de Costa Rica
CI-0114: Fundamentos de Arquitectura

Prueba para la ALU
*********************************/

`timescale 1us/100ns

module ALU_tb;
  wire [31:0] R;
  wire C, S, O, Z;
  reg  [31:0] A;
  reg  [31:0] B;
  reg  [4:0]  op;
 
  initial begin
    $dumpfile("ALU.vcd");
    $dumpvars;
    op = `OP_NOP; A = 0; B = 0;
    #1 op = `OP_LD; A = 32'h0000_0000; B = 32'h0000_000C;
	#1 op = `OP_LD; A = 32'h0000_0001; B = 32'h0000_0001;
	#1 op = `OP_LD; A = 32'h0000_0002; B = 32'h8000_0001;
	#1 op = `OP_LD; A = 32'h0000_0003; B = 32'h8000_0002;
    #1 op = `OP_MUL; A = 32'h0000_0001; B = 32'h8000_0002;
    #1 op = `OP_ADD; A = 32'h8000_0002; B = 32'h8000_0001;
	#1 op = `OP_JZ; A = 32'h8000_0000; B = 32'h8000_0000;
	#1 op = `OP_JMP; A = 32'h8000_0000; B = 32'h8000_0000;
	#1 op = `OP_MUL; A = 32'h0000_0001; B = 32'h8000_0002;
    #1 op = `OP_ADD; A = 32'h8000_0002; B = 32'h8000_0001;
	#1 op = `OP_MUL; A = 32'h0000_0002; B = 32'h8000_0003;
    #1 op = `OP_ADD; A = 32'h8000_0002; B = 32'h8000_0001;
	#1 op = `OP_MUL; A = 32'h0000_0006; B = 32'h0000_0004;
    #1 op = `OP_ADD; A = 32'h8000_0002; B = 32'h8000_0001;
	#1 op = `OP_MUL; A = 32'h0000_0018; B = 32'h0000_0005;
    #1 op = `OP_ADD; A = 32'h8000_0002; B = 32'h8000_0001;
	#1 op = `OP_MUL; A = 32'h0000_0078; B = 32'h0000_0006;
    #1 op = `OP_ADD; A = 32'h8000_0002; B = 32'h8000_0001;
	#1 op = `OP_MUL; A = 32'h0000_02D0; B = 32'h0000_0007;
    #1 op = `OP_ADD; A = 32'h8000_0002; B = 32'h8000_0001;
	#1 op = `OP_MUL; A = 32'h0000_13B0; B = 32'h0000_0008;
    #1 op = `OP_ADD; A = 32'h8000_0002; B = 32'h8000_0001;
	#1 op = `OP_MUL; A = 32'h0000_9D80; B = 32'h0000_0009;
    #1 op = `OP_ADD; A = 32'h8000_0002; B = 32'h8000_0001;
	#1 op = `OP_MUL; A = 32'h0005_8980; B = 32'h0000_000A;
    #1 op = `OP_ADD; A = 32'h8000_0002; B = 32'h8000_0001;
	#1 op = `OP_MUL; A = 32'h0037_5F00; B = 32'h0000_000B;
    #1 op = `OP_ADD; A = 32'h8000_0002; B = 32'h8000_0001;
	#1 op = `OP_STR; A = 32'h8000_0000; B = 32'h8000_0000;
	#1 op = `OP_MUL; A = 32'h0261_1500; B = 32'h0000_000C;
    #1 $finish;
  end
  
  ALU alu(.resultado(R),
          .C(C),
          .S(S),
          .O(O),
          .Z(Z),
          .operando_a(A),
          .operando_b(B),
          .opcode(op));
	

endmodule
