use WORK.ALL;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use Std.TextIO.all;
use work.debugtools.all;

entity ramlatch64 is
  port (
    fastclock : in std_logic;
    slowclock : in std_logic;
    
    address_in : in std_logic_vector(13 downto 0);
    wea_in : in std_logic_vector(7 downto 0);
    data_in : in std_logic_vector(63 downto 0);
    
    address_out : out std_logic_vector(13 downto 0);
    wea_out : out std_logic_vector(7 downto 0);
    data_out : out std_logic_vector(63 downto 0)
    );
end ramlatch64;

architecture behavioural of ramlatch64 is

begin  -- behavioural

  -- purpose: copy address, write enable and write data lines on rising edge of slow clock
  -- type   : combinational
  -- inputs : slowclock, address_in, wea_in, data_in
  -- outputs: *_out
  process (slowclock, address_in, wea_in, data_in)
  begin  -- process
    if rising_edge(slowclock) then
      address_out <= address_in;
      wea_out <= wea_in;
      data_out <= data_in;
    end if;
  end process;

end behavioural;

    
