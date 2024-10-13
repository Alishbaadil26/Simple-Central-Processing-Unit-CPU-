library verilog;
use verilog.vl_types.all;
entity lab5Combined is
    port(
        current_State   : out    vl_logic_vector(6 downto 0);
        clock           : in     vl_logic;
        data_in         : in     vl_logic;
        reset           : in     vl_logic;
        std_ID          : out    vl_logic_vector(6 downto 0)
    );
end lab5Combined;
