
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
	signal subtracao : std_logic_vector(3 downto 0);
	signal entrada_maior : std_logic_vector(3 downto 0);
	signal entrada_menor : std_logic_vector(3 downto 0);
	signal invertido : std_logic := '0';  -- Inversão das entradas para subtracao

	begin		
	   process  (entrada1, entrada2, seletor)
		begin
		
		-- Comparar entradas para ver qual é o maior número
		-- Para evitar números negativos na subtração
		if (entrada1 > entrada2) then
			entrada_maior <= entrada1;
			entrada_menor <= entrada2;
			invertido <= '0';
		else
			entrada_maior <= entrada2;
			entrada_menor <= entrada1;
			invertido <= '1';
		end if;
		
		-- Somador
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
					
			
			-- Subtrator
			when "0010" =>
				subtracao <= NOT entrada_menor;  -- Inverte bits da menor entrada
				carry(0) <= '1';  -- Complemento de 2 para subtração
				for i in 0 to 3 loop
					saida(i) <= (entrada_maior(i) XOR subtracao(i)) XOR carry(i);
					carry(i+1) <= (entrada_maior(i) AND subtracao(i)) OR ((entrada_maior(i) XOR subtracao(i)) AND carry(i));
				end loop;
				
					
				when others =>
					saida <= (others => '0');
					overflow <= '0';
				end case;
			
		end process;
		
	end hardware;
	