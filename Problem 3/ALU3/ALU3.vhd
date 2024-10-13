LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
USE ieee.numeric_std.all;
entity ALU3 is 
port(Clock:in std_logic;
		A,B:in unsigned (7 downto 0);
		student_ID:in unsigned (3 downto 0);
		OP:in unsigned(15 downto 0);
		Neg:out std_logic;
		R:out unsigned(3 downto 0));
end ALU3;

architecture calculation of ALU3 is 
signal Reg1, Reg2: unsigned(7 downto 0):=(others =>'0');
signal Result: unsigned(3 downto 0):=(others =>'0');

signal Reg4: unsigned (0 to 8);
begin 
Reg1<=A;
Reg2<=B;
process(Clock,OP)
begin 
	if (rising_edge(Clock)) THEN 
		case OP is 
			WHEN "0000000000000001" =>
			if ((Reg1(7)&Reg1(6)&Reg1(5)&Reg1(4))> student_ID) or ((Reg1(3)&Reg1(2)&Reg1(1)&Reg1(0))> student_ID)then 
			Result <="0001";
			Neg<='1';
			else
			Result <="0000";
			Neg<='1';
			end if;
			WHEN "0000000000000010" =>
			if ((Reg1(7)&Reg1(6)&Reg1(5)&Reg1(4))> student_ID) or ((Reg1(3)&Reg1(2)&Reg1(1)&Reg1(0))> student_ID)then 
			Result <="0001";
			Neg<='1';
			else
			Result <="0000";
			Neg<='1';
			end if;
			WHEN "0000000000000100" =>
			if ((Reg1(7)&Reg1(6)&Reg1(5)&Reg1(4))> student_ID) or ((Reg1(3)&Reg1(2)&Reg1(1)&Reg1(0))> student_ID)then 
			Result <="0001";
			Neg<='1';
			else
			Result <="0000";
			Neg<='1';
			end if;
			WHEN "0000000000001000" =>
			if (Reg1(7 downto 4 )> student_ID) or (Reg1(3 downto 0 )> student_ID)then 
			Result <="0001";
			Neg<='1';
			else
			Result <="0000";
			Neg<='1';
			end if;
			WHEN "0000000000010000" =>
			if (Reg1(7 downto 4 )> student_ID) or (Reg1(3 downto 0 )> student_ID)then 
			Result <="0001";
			Neg<='1';
			else
			Result <="0000";
			Neg<='1';
			end if;
			WHEN "0000000000100000" =>
			if (Reg1(7 downto 4 )> student_ID) or (Reg1(3 downto 0 )> student_ID)then 
			Result <="0001";
			Neg<='1';
			else
			Result <="0000";
			Neg<='1';
			end if;
			WHEN "0000000001000000" =>
			if (Reg1(7 downto 4 )> student_ID) or (Reg1(3 downto 0 )> student_ID)then 
			Result <="0001";
			Neg<='1';
			else
			Result <="0000";
			Neg<='1';
			end if;
			WHEN "0000000010000000" =>
			if (Reg1(7 downto 4 )> student_ID) or (Reg1(3 downto 0 )> student_ID)then 
			Result <="0001";
			Neg<='1';
			else
			Result <="0000";
			Neg<='1';
			end if;
			WHEN "0000000100000000" =>
			if (Reg1(7 downto 4 )> student_ID) or (Reg1(3 downto 0 )> student_ID)then 
			Result <="0001";
			Neg<='1';
			else
			Result <="0000";
			Neg<='1';
			end if;
			WHEN others =>
		end case;
	end if;
end process;
R<=Result;

end calculation;
			
