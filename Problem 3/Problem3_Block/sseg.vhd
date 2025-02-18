LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg IS
PORT (bcd: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
neg: IN STD_LOGIC;
leds1: OUT STD_LOGIC_VECTOR(1 TO 7);
leds2: OUT STD_LOGIC_VECTOR (1 TO 7));
END sseg;

ARCHITECTURE Behavior OF sseg IS
BEGIN
PROCESS (neg)
BEGIN
IF (neg = '1') THEN
leds2 <= "1111110";  -- 0000001
ELSE
leds2 <= "1111111";  -- 0000000
END IF;
END PROCESS;
PROCESS (bcd)
BEGIN
CASE bcd IS           --    abcdefg
WHEN "0000" => leds1 <= "0000001";  -- 1111110
WHEN "0001" => leds1 <= "1001111";  -- 0110000
WHEN "0010" => leds1 <= "0010010";  -- 1101101
WHEN "0011" => leds1 <= "0000110";  -- 1111001
WHEN "0100" => leds1 <= "1001100";  -- 0110011
WHEN "0101" => leds1 <= "0100100";  -- 1011011
WHEN "0110" => leds1 <= "0100000";  -- 1011111
WHEN "0111" => leds1 <= "0001111";  -- 1110000
WHEN "1000" => leds1 <= "0000000";  -- 1111111
WHEN "1001" => leds1 <= "0000100";  -- 1111011
-- 10 to 15 (A-F)
WHEN "1010" => leds1 <= "0001000";  -- 1110111
WHEN "1011" => leds1 <= "1100000";  -- 0011111
WHEN "1100" => leds1 <= "0110001";  -- 1001110
WHEN "1101" => leds1 <= "1000010";  -- 0111101
WHEN "1110" => leds1 <= "0110000";  -- 1001111
WHEN "1111" => leds1 <= "0111000";  -- 1000111
WHEN OTHERS => leds1 <= ("-------");

END CASE;
END PROCESS;
END Behavior;
