library verilog;
use verilog.vl_types.all;
entity decod_vlg_sample_tst is
    port(
        En              : in     vl_logic;
        w               : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end decod_vlg_sample_tst;
