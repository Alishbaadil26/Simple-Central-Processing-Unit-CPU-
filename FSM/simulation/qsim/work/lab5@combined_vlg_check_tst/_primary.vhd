library verilog;
use verilog.vl_types.all;
entity lab5Combined_vlg_check_tst is
    port(
        current_State   : in     vl_logic_vector(6 downto 0);
        std_ID          : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab5Combined_vlg_check_tst;
