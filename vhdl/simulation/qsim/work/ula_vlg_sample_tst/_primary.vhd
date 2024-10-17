library verilog;
use verilog.vl_types.all;
entity ula_vlg_sample_tst is
    port(
        entrada1        : in     vl_logic_vector(3 downto 0);
        entrada2        : in     vl_logic_vector(3 downto 0);
        seletor         : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end ula_vlg_sample_tst;
