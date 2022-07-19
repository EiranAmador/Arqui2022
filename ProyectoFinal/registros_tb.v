/*******************************
Universidad de Costa Rica
CI-0114: Fundamentos de Arquitectura

Prueba para el modulo de memoria
*********************************/

`timescale 1us/100ns

module Registros_tb;
  wire [31:0] data_salida1;
  wire [31:0] data_salida2;
  reg  [31:0] data_entrada;
  reg  [15:0] direccion1;
  reg  [15:0] direccion2;
  reg         escribir;
  reg         clk;
  
  always begin
    #0.5 clk = ~clk;
  end
 
  initial begin
    $dumpfile("Registros.vcd");
    $dumpvars;
    clk = 1; escribir = 0;
    #1 direccion1 = 5; direccion2 = 7;
    #2 data_entrada = 'hACED_CAFE; direccion1 = 4; direccion2 = 1; escribir = 1;
    #1 escribir = 0;
    #1 direccion1 = 3; direccion2 = 0; data_entrada = 'hDEAD_BEEF;
    #6 $finish;
  end
  
  Registro mem(.data_out1(data_salida1),
					.data_out2(data_salida2),
                    .data_in(data_entrada),
                    .address1(direccion1),
                    .address2(direccion2),
                    .write(escribir),
                    .clk(clk));
endmodule
