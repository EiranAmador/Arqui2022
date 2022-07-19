/*******************************
Eiran Amador Alvarado C00411
Fundamentos de Arquitectura
Tarea 0

Archivo .v con el testbench que instancia la máquina de estados y aplica los estímulos de
prueba requeridos
********************************/

`timescale 1us/100ns

module Ganar_3_de_5_RTL_tb;
  reg Clk, Reset;
  reg J1G, J2G;
  wire [3:0] EST;
  wire [1:0] V_J1G3;
  wire [1:0] V_J2G3;
  wire [1:0] E_G3;
  wire [1:0] ERR_11;
  always begin
    #0.5 Clk = ~Clk;
  end
  
  initial begin
    $dumpfile("maquina.vcd");
    $dumpvars;

    $monitor($time, "us : " , "clk %b, J1G %b, J2G %b, V_J1G3 %b, V_J2G3 %b, E_G3 %b , ERR_11 %b, EST %d", Clk, J1G, J2G, V_J1G3, V_J2G3, E_G3, ERR_11, EST);
    Clk = 1; J1G = 0; J2G = 0; Reset = 0;
    #1 Reset = 1;
    #1 Reset = 0;
    #1 J1G = 1; J2G = 0;
    #1 J1G = 0; J2G = 0;
    #1 J1G = 1; J2G = 0;
    #1 J1G = 0; J2G = 0;
    #1 J1G = 1; J2G = 0;//El jugador 1 gana 3:0
    #1 J1G = 0; J2G = 0;
    #1 Reset = 1;
    #1 Reset = 0;
    #1 J1G = 0; J2G = 1;
    #1 J1G = 0; J2G = 0;
    #1 J1G = 0; J2G = 1;
    #1 J1G = 0; J2G = 0;
    #1 J1G = 0; J2G = 1;//El jugador 2 gana 3:0
    #1 J1G = 0; J2G = 0;
    #1 Reset = 1;
    #1 Reset = 0;
    #1 J1G = 1; J2G = 0;
    #1 J1G = 1; J2G = 0;
    #1 J1G = 0; J2G = 1;
    #1 J1G = 0; J2G = 1;
    #1 J1G = 1; J2G = 0;//El jugador 1 gana 3:2
    #1 J1G = 0; J2G = 0;
    #1 Reset = 1;
    #1 Reset = 0;
    #1 J1G = 0; J2G = 1;
    #1 J1G = 0; J2G = 1;
    #1 J1G = 1; J2G = 0;
    #1 J1G = 0; J2G = 1;//El jugador 2 gana 3:1
    #1 J1G = 0; J2G = 0;
    #1 Reset = 1;
    #1 Reset = 0;
    #1 J1G = 1; J2G = 1;//Error
    #1 J1G = 1; J2G = 1;
    #1 J1G = 1; J2G = 1;
    #10 $finish;
  end
  
  Ganar_3_de_5_RTL maquina(EST, V_J1G3, V_J2G3, E_G3, ERR_11, J1G, J2G, Reset, Clk);
endmodule