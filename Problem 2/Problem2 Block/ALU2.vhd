library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ALU2 is
port(Clock: in std_logic;
A,B: in unsigned(7 downto 0);
OP: in unsigned(15 downto 0);
Neg: out std_logic;
R1: out unsigned(3 downto 0);
R2: out unsigned(3 downto 0));
end ALU2;

architecture calculation of ALU2 is
signal Reg1,Reg2,Result: unsigned (7 DOWNTO 0):=(OTHERS => '0');
signal Reg4 : unsigned (0 to 7);
begin
Reg1 <=A;
Reg2 <= B;
process(Clock, OP)
begin
if(rising_edge(Clock)) THEN
case OP is
WHEN "0000000000000001"=>
 -- Function 1: Replace the odd bits of A with odd bits of B
Result <= (A(7) & B(6) & A(5) & B(4) & A(3) & B(2) & A(1) & B(0));          
NEG <= '0';

WHEN "0000000000000010"=>
 -- Function 2: Produce the result of NANDing A and B
Result <= not (A and B);
NEG <= '0';

WHEN "0000000000000100"=>
NEG <= '0';
-- Function 3: Calculate the summation of A and B and decrease it by 5
Result <=(A + B) - 5;

WHEN "0000000000001000"=>
NEG <= '0';
 -- Function 4: Produce the 2's complement of B
Result <= (not B) + "00000001";

WHEN "0000000000010000" =>
NEG <= '0';
-- Function 5: Invert the even bits of B
Result <= (B(7) & not B(6) & B(5) & not B(4) & B(3) & not B(2) & B(1) & not B(0));

WHEN "0000000000100000" =>
NEG <= '0';
-- Function 6: Shift A to left by 2 bits, input bit = 1 (SHL)
Result <= A(5 downto 0) & "00";

WHEN "0000000001000000"=>
NEG <= '0';
--Funtion 7: Produce null on output
result <= NULL;

WHEN "0000000010000000"=>
NEG <= '0';
--Funtion 8: Produce 2'S Compliment of A
result <= NOT A+1;

WHEN "0000000100000000"=>
NEG <= '0';
--Funtion 9: Rotate B to right by 2 bits (ROR)
result <= B(1 downto 0)& B(7 DOWNTO 2);

WHEN OTHERS => NULL;
end case;
end if;
end process;
R1 <= Result(3 downto 0);
R2 <= Result(7 downto 4);
end calculation;