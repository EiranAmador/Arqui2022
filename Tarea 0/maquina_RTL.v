/*******************************
Eiran Amador Alvarado C00411
Fundamentos de Arquitectura
Tarea 0

Archivo .v con la implementación del módulo que define la máquina de estados
********************************/

module Ganar_3_de_5_RTL(EST, V_J1G3, V_J2G3, E_G3, ERR_11, J1G, J2G, Reset, clk);
  
  output reg [3:0] EST = 0;

  output reg [1:0] V_J1G3;
  output reg [1:0] V_J2G3;
  output reg [1:0] E_G3;
  output reg [1:0] ERR_11;

  input J1G, J2G, Reset, clk;

  always @(negedge clk or Reset) begin
    
    if (Reset) begin
        EST = 0;
        ERR_11 = 0;
        V_J1G3 = 0;
        V_J2G3 = 0;
        E_G3 = 0;
    end
  
    case (EST)
      0: begin//J1G0_J2G0
        if (J1G && J2G) begin EST = 9; end
        else if (J1G) begin EST = 1; end
        else if (J2G) begin EST = 2; end
      end

      1: begin//J1G1_J2G0
        if (J1G && J2G) begin EST = 9; end
        else if (J1G) begin EST = 4; end
        else if (J2G) begin EST = 3; end
      end

      2: begin//J1G0_J2G1
        if (J1G && J2G) begin EST = 9; end
        else if (J1G) begin EST = 3; end
        else if (J2G) begin EST = 7; end
      end

      3: begin//J1G1_J2G1
        if (J1G && J2G) begin EST = 9; end
        else if (J1G) begin EST = 3; end
        else if (J2G) begin EST = 2; end
      end

      4: begin//J1G2_J2G0
        if (J1G && J2G) begin EST = 9; end
        else if (J1G) begin EST = 12; end//J1 Gana 3:0
        else if (J2G) begin EST = 5; end
      end

      5: begin//J1G2_J2G1
        if (J1G && J2G) begin EST = 9; end
        else if (J1G) begin EST = 10; end//J1 Gana
        else if (J2G) begin EST = 8; end
      end

      6: begin//J1G1_J2G2
        if (J1G && J2G) begin EST = 9; end
        else if (J1G) begin EST = 8; end
        else if (J2G) begin EST = 11; V_J2G3 = 1; end//J2 Gana
      end

      7: begin//J1G0_J2G2
        if (J1G && J2G) begin EST = 9; end
        else if (J1G) begin EST = 6; end
        else if (J2G) begin EST = 13;  end//J2 Gana 3:0
      end

      8: begin//J1G2_J2G2
        if (J1G && J2G) begin EST = 9; end
        else if (J1G) begin EST = 10; end//J1 Gana
        else if (J2G) begin EST = 11; end//J2 Gana
      end
	
      9: begin//Estado ERR_11 
        EST = 9; ERR_11 = 1;
      end

      10: begin//V_J1G3
        EST = 10; V_J1G3 = 1;
      end

      11: begin//V_J2G3
        EST = 11; V_J2G3 = 1;
      end

      12: begin//V_J1G3 E_G3
        EST = 12; V_J1G3 = 1; E_G3 = 1; 
      end

      13: begin//V_J2G3 E_G3
        EST = 13; V_J2G3 = 1; E_G3 = 1;
      end
    endcase

  end
endmodule
