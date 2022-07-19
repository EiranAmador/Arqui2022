/*******************************
Universidad de Costa Rica
CI-0114: Fundamentos de Arquitectura

Simple memoria lectura asincrónica y escritura sincrónica
basada en Flip Flops
1 Puerto de lectura
1 Puerto de escritura

Ancho de palabra (Datos) 32 bits
Ancho de direcciones 16 bits (64Ki Words)

Contiene las primeras words precargadas
Con algunos valores de prueba

*********************************/

module Registro(data_out1, data_out2, data_in, address1, address2, write, clk);
  parameter BITS_DATA = 32;
  parameter BITS_ADDR = 16;

  output [BITS_DATA-1:0] data_out1;
  output [BITS_DATA-1:0] data_out2;
  input  [BITS_DATA-1:0] data_in;
  input  [BITS_ADDR-1:0] address1;
  input  [BITS_ADDR-1:0] address2;
  input                  write;
  input                  clk;
  
  reg [7:0] data;
  
  assign data_out1 = data[address1];
  assign data_out2 = data[address2];
  
  always @(negedge clk) begin
    if (write) begin
      data[address1] <= data_in;
    end
  end
  
  initial begin    
    data[0] = 'h00000000; //OPD_NOP 
    data[1] = 'h82000000; //OPD_NOT
    data[2] = 'h8A000000; //OPD_AND
    data[3] = 'h92000000; //OPD_OR
    data[4] = 'hA2000000; //OPD_NEG
    data[5] = 'hAA000000; //OPD_ADD
    data[6] = 'hB2000000; //OPD_SUB
    data[7] = 'hF8000000; //OPD_HLT
  end
  
  // Workaround para lograr visualizar la memoria en gtkwave
  // Agregamos solo los primeros 64 entries para no hacer la simulación
  // innecesariamente lenta
  generate
    genvar idx;
    for(idx = 0; idx < 64; idx = idx + 1) begin: register
      wire [31:0] tmp;
      assign tmp = data[idx];
    end
  endgenerate

endmodule
