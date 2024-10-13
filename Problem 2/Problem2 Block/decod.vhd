LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY decod IS
	PORT ( w : IN STD_LOGIC_vector(3 DOWNTO 0) ;
			 En : IN STD_LOGIC ;
			 y : OUT STD_LOGIC_VECTOR(0 TO 15) ) ;
END decod ;

ARCHITECTURE Behavior OF decod IS
	SIGNAL Enw : STD_LOGIC_VECTOR(4 DOWNTO 0) ;
BEGIN 	
Enw <= En & w ;

WITH Enw SELECT
y <= "1000000000000000" WHEN "10000",
	  "0100000000000000" WHEN "10001",
     "0010000000000000" WHEN "10010",
     "0001000000000000" WHEN "10011",
	  "0000100000000000" WHEN "10100",
	  "0000010000000000" WHEN "10101",
     "0000001000000000" WHEN "10110",
     "0000000100000000" WHEN "10111",
	  "0000000010000000" WHEN "11000",
	  "0000000001000000" WHEN "11001",
     "0000000000100000" WHEN "11010",
     "0000000000010000" WHEN "11011",
	  "0000000000001000" WHEN "11100",
	  "0000000000000100" WHEN "11101",
     "0000000000000010" WHEN "11110",
     "0000000000000001" WHEN "11111",
	  
     "1000000000000000" WHEN OTHERS ;
END Behavior ;