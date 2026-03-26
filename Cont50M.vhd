library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Contador is
    Port(
        en_cnt   : in  std_logic;
        clk      : in  std_logic;
        reset_n  : in  std_logic;
        co       : out std_logic
    );
end contador;

architecture behavioral of Contador is
    signal contador : unsigned(25 downto 0) ;
begin
    process (clk, reset_n)
    begin
        if reset_n = '0' then
            contador <= (others => '0');
            co <= '0';
        elsif clk 'event and clk = '1' then
            if en='1' then 
					if contador=20831 then
						contador<=(others=>'0'); 	
						co<='1';
					else
						contador<=contador+1;	
					end if;
				end if;
			end if;
		end process;

end behavioral;
