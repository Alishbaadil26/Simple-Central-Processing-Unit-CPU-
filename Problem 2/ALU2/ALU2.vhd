LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
USE ieee.numeric_std.all;
entity ALU2 is 
port(Clock:in std_logic;
		A,B:in unsigned (7 downto 0);
		student_ID:in unsigned (3 downto 0);
		OP:in unsigned(15 downto 0);
		Neg:out std_logic;
		R1:out unsigned(3 downto 0);
		R2:out unsigned(3 downto 0));
end ALU2;

architecture calculation of ALU2 is 
signal Reg1, Reg2, Result: unsigned(7 downto 0):=(others =>'0');
signal Reg4: unsigned (0 to 8);
begin 
Reg1<=A;
Reg2<=B;
process(Clock,OP)
begin 
	if (rising_edge(Clock)) THEN 
		case OP is 
			WHEN "0000000000000001" =>
			Result(0)<= Reg1(0);
			Result(1)<= Reg2(1);
			Result(2)<=Reg1(2);
			Result(3)<=Reg2(3);
			Result(4)<=Reg1(4);
			Result(5)<=Reg2(5);
			Result(6)<=Reg1(6);
			Result(7)<=Reg2(7);
			Neg <= '0';
			WHEN "0000000000000010" =>
			Result <= not(Reg1 and Reg2);
			Neg <= '0';
			WHEN "0000000000000100" =>
			
			Result <= (Reg1 + Reg2 - 5);
			
			Neg <= '0';
	      
			WHEN "0000000000001000" =>
			Result <= not(Reg2)+"00000001";
			Neg <= '0';
			WHEN "0000000000010000" =>
			Result(0)<= not Reg2(0);
			Result(1)<= Reg2(1);
			Result(2)<=	not Reg2(2);
			Result(3)<=	Reg2(3);
			Result(4)<=	not Reg2(4);
			Result(5)<=	Reg2(5);
			Result(6)<=	not Reg2(6);
			Result(7)<=	Reg2(7);
			Neg <= '0';
			WHEN "0000000000100000" =>
				Result <=Reg1(5 downto 0) &"11";
				Neg <= '0';
			WHEN "0000000001000000" =>
			Result<=null;
			Neg <= '0';
			WHEN "0000000010000000" =>
			Result <= not(Reg1)+"00000001";
			Neg <= '0';
			WHEN "0000000100000000" =>
			Result <= Reg2 ROR 2;
			Neg <= '0';
			WHEN others =>
			Null;
		end case;
	end if;
end process;
R1<=Result(3 downto 0);
R2<=Result(7 downto 4);
end calculation;
	