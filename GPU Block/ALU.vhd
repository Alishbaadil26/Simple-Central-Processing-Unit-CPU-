library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ALU is
port(Clock: in std_logic;
A,B: in unsigned(7 downto 0);
OP: in unsigned(15 downto 0);
Neg: out std_logic;
R1: out unsigned(3 downto 0);
R2: out unsigned(3 downto 0));
end ALU;

architecture calculation of ALU is
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
Result <= Reg1 + Reg2;
NEG <= '0';

WHEN "0000000000000010"=>
Result <= Reg1 - Reg2;
NEG <= '0';

if(Reg1>Reg2) then
NEG <= '0';
result <= (Reg1 - Reg2);
elsif (Reg2 > Reg1) then
result <= Reg1 + (NOT Reg2 + 1);
NEG <= '1';
end if;

WHEN "0000000000000100"=>
NEG <= '0';
result <=(NOT Reg1);

WHEN "0000000000001000"=>
NEG <= '0';
result <= (Reg1 NAND Reg2);

WHEN "0000000000010000" =>
NEG <= '0';
result <= (Reg1 NOR Reg2);

WHEN "0000000000100000" =>
NEG <= '0';
result <= (Reg1 AND Reg2);

WHEN "0000000001000000"=>
NEG <= '0';
result <= (Reg1 XOR Reg2);

WHEN "0000000010000000"=>
NEG <= '0';
result <= (Reg1 OR Reg2);

WHEN "0000000100000000"=>
NEG <= '0';
result <= (Reg1 XNOR Reg2);

WHEN OTHERS =>
end case;
end if;
end process;
R1 <= Result(3 downto 0);
R2 <= Result(7 downto 4);
end calculation;