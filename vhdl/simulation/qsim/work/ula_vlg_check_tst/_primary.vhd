library verilog;
use verilog.vl_types.all;
entity ula_vlg_check_tst is
    port(
        overflow        : in     vl_logic;
        saida           : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end ula_vlg_check_tst;
