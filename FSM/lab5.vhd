library ieee;
USE ieee.std_logic_1164.all;
entity lab5 is 
	port 
	( 
		clk		: in std_logic;
		data_in 	: in std_logic;
		reset		: in std_logic;
		student_id	: out	std_logic_vector(3 downto 0);
		current_state : out std_logic_vector(3 DOWNTO 0)
	);
end entity;

architecture fsm of lab5 is 



	type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8);
	
	signal ysfm	:	state_type;
	signal x: std_logic;
	signal x_meta: std_logic;
	signal x_curr: std_logic;
	signal x_last: std_logic;
	
	
begin 
	x<= data_in;
	sync: process(clk)
	begin 
	if rising_edge(clk) then
	x_meta <=x;
	x_curr<=x_meta;
	end if;
	end process;
	x_last<=x_curr when rising_edge(clk);
	process (clk,reset,x_curr,x_last)
	begin 
		if reset ='1' then 
			ysfm <=s0;
		elsif (clk'EVENT AND clk ='1' )then 
		
		
			case ysfm is 
				when s0=>
				if(x_curr xor x_last)='1'THEN
					if data_in ='0' THEN
					ysfm <=s0;
					else 
					ysfm <=s8;
					
					END IF;
					END IF;
				when s8=>
				if(x_curr xor x_last)='1'THEN
					if data_in ='0' THEN
					ysfm <=s8;
					else 
					ysfm <=s7 ;
					END IF;
					END IF;
				when s7=>
				if(x_curr xor x_last)='1'THEN
					if data_in ='0' THEN
					ysfm <=s7;
					else 
					ysfm <=s6;
					END IF;
					END IF;
				when s6=>
				if(x_curr xor x_last)='1'THEN
					if data_in ='0' THEN
					ysfm <=s6;
					else 
					ysfm <=s5;
					END IF;
					END IF;
				when s5=>
				if(x_curr xor x_last)='1'THEN
					if data_in ='0' THEN
					ysfm <=s5;
					else 
					ysfm <=s4;
					END IF;
					END IF;
				when s4=>
				if(x_curr xor x_last)='1'THEN
					if data_in ='0' THEN
					ysfm <=s4;
					else 
					ysfm <=s3;
					END IF;
					END IF;
				when s3=>
				if(x_curr xor x_last)='1'THEN
					if data_in ='0' THEN
					ysfm <=s3;
					else 
					ysfm <=s2;
					END IF;
					END IF;
				when s2=>
				if(x_curr xor x_last)='1'THEN
					if data_in ='0' THEN
					ysfm <=s2;
					else 
					ysfm <=s1;
					END IF;
					END IF;
				when s1=>
				if(x_curr xor x_last)='1'THEN
					if data_in ='0' THEN
					ysfm <=s1;
					else 
					ysfm <=s0;
					END IF;
					END IF;
			end case;
		end if;
	end process;
	
	process (ysfm,data_in)
	begin 
		case ysfm is 
		      when s0=>
				student_id <="0101";
				current_state <="0000";
				when s8=>
				student_id <="0000";
				current_state <="1000";
				when s7=>
				student_id <="0001";
				current_state <="0111";
				when s6=>
				student_id <="0001";
				current_state <="0110";
				when s5=>
				student_id <="0110";
				current_state <="0101";
				when s4=>
				student_id <="0000";
				current_state <="0100";
				when s3=>
				student_id <="1000";
				current_state <="0011";
				when s2=>
				student_id <="0010";
				current_state <="0010";
				when s1=>
				student_id <="0110";
				current_state <="0001";
			end case;
		end process;
	end fsm;