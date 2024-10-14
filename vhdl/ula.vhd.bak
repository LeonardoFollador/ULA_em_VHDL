
library IEEE;
use IEEE.std_logic_1164.all;


	entity ula is
	port(
			entrada1		:  in		std_logic_vector (3 downto 0);
			entrada2		:	in		std_logic_vector (3 downto 0);
			seletor		:	in		std_logic_vector (3 downto 0);
			saida		   :	out	std_logic_vector (3 downto 0);
			overflow		:	out	std_logic);
	end ula;

	architecture hardware of ula is
	
	signal carry : std_logic_vector(4 downto 0);
	
	begin		
	   process  (entrada1, entrada2, seletor)
		begin
		
		case seletor is
			when "0001" =>
				carry(0) <= '0';
					for i in 0 to 3 loop
						saida(i) <= (entrada1(i) XOR entrada2(i)) XOR carry(i);
						carry(i+1) <= (entrada1(i) AND entrada2(i)) OR ((entrada1(i) XOR entrada2(i)) AND carry(i));
					end loop;
			
					if (carry(4) = '1') then
						saida <= (others => '0');
						overflow <= '1';
					else
						overflow <= '0';
					end if;
				
			when others =>
				saida <= (others => '0');
				overflow <= '0';
			end case;
			
		end process;
		
	end hardware;
	