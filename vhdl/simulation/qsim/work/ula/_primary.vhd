library verilog;
use verilog.vl_types.all;
entity ula is
    port(
        entrada1        : in     vl_logic_vector(3 downto 0);
        entrada2        : in     vl_logic_vector(3 downto 0);
        seletor         : in     vl_logic_vector(3 downto 0);
        saida           : out    vl_logic_vector(3 downto 0);
        overflow        : out    vl_logic
    );
end ula;
