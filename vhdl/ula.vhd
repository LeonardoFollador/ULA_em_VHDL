library IEEE;
use IEEE.std_logic_1164.all;

entity ula is
    Port (
        entrada1    : in  std_logic_vector (3 downto 0);  -- Entrada A de 4 bits
        entrada2    : in  std_logic_vector (3 downto 0);  -- Entrada B de 4 bits
        seletor     : in  std_logic_vector (3 downto 0);  -- Seletor de operação
        saida       : out std_logic_vector (3 downto 0);  -- Saída da operação
        overflow     : out std_logic                       -- Sinal de overflow
    );
end ula;

architecture hardware of ula is

    signal carry : std_logic_vector(4 downto 0);
    signal subtracao : std_logic_vector(3 downto 0);
    signal entrada_maior : std_logic_vector(3 downto 0);
    signal entrada_menor : std_logic_vector(3 downto 0);
    signal igual : std_logic;              -- Sinal para indicar igualdade
    signal comparacao : std_logic_vector(1 downto 0); -- Sinal para indicar comparações

begin
    process (entrada1, entrada2, seletor)
    begin
        -- Inicializa a saída e o sinal de overflow
        saida <= (others => '0');
        overflow <= '0';

        -- Comparar entradas para ver qual é o maior número
        if (entrada1 > entrada2) then
            entrada_maior <= entrada1;
            entrada_menor <= entrada2;
            comparacao <= "01";  -- A > B
        elsif (entrada1 < entrada2) then
            entrada_maior <= entrada2;
            entrada_menor <= entrada1;
            comparacao <= "10";  -- A < B
        else
            entrada_maior <= entrada1; -- ou entrada2, pois são iguais
            entrada_menor <= entrada2; -- ou entrada1, pois são iguais
            comparacao <= "00";  -- A = B
        end if;

        -- Lógica da ULA com base no seletor
        case seletor is
            when "0001" =>  -- Somador
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

            when "0010" =>  -- Subtrator
				    if (comparacao = "10") then
						overflow <= '1';
					 else
						overflow <= '0';
					 end if;
					 
                subtracao <= NOT entrada_menor;  -- Inverte bits da menor entrada
                carry(0) <= '1';  -- Complemento de 2 para subtração
                for i in 0 to 3 loop
                    saida(i) <= (entrada_maior(i) XOR subtracao(i)) XOR carry(i);
                    carry(i+1) <= (entrada_maior(i) AND subtracao(i)) OR ((entrada_maior(i) XOR subtracao(i)) AND carry(i));
                end loop;

            when "1001" =>  -- Comparador Igualdade
                if (entrada1 = entrada2) then
                    igual <= '1';
                else
                    igual <= '0';
                end if;

                if igual = '1' then
                    saida <= "1111";
                else
                    saida <= "0000";
                end if;

            when "0100" =>  -- Comparador de Maior que
                if comparacao = "01" then
                    saida <= "1111";  -- A é maior que B
                else
                    saida <= "0000";  -- A não é maior que B
                end if;

            when "1000" =>  -- Comparador de Menor que
                if comparacao = "10" then
                    saida <= "1111";  -- A é menor que B
                else
                    saida <= "0000";  -- A não é menor que B
                end if;

            when others =>
                saida <= (others => '0');  -- Para qualquer outro valor de seletor
                overflow <= '0';
        end case;

    end process;

end hardware;
