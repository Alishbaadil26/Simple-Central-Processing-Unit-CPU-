library verilog;
use verilog.vl_types.all;
entity decod_vlg_check_tst is
    port(
        y               : in     vl_logic_vector(0 to 15);
        sampler_rx      : in     vl_logic
    );
end decod_vlg_check_tst;
