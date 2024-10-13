library verilog;
use verilog.vl_types.all;
entity decod is
    port(
        w               : in     vl_logic_vector(3 downto 0);
        En              : in     vl_logic;
        y               : out    vl_logic_vector(0 to 15)
    );
end decod;
