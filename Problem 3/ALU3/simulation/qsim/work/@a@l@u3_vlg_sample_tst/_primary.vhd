library verilog;
use verilog.vl_types.all;
entity ALU3_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        Clock           : in     vl_logic;
        OP              : in     vl_logic_vector(15 downto 0);
        student_ID      : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end ALU3_vlg_sample_tst;
