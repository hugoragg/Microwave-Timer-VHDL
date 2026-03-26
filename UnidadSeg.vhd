Library ieee; 

Use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
Entity UnidadSeg is 

	Port( 
		en: in std_logic;
		clk: in std_logic;
		reset_n: in std_logic;
		carga_seg: in std_logic;
		ent_p: in std_logic_vector (6 downto 0);
		cnt_segu: out std_logic_vector (3 downto 0);
		co: out std_logic
		);

End UnidadSeg; 

Architecture behavioral of UnidadSeg is  
    signal contador : unsigned(3 downto 0);
	Begin  
	
	process (clk, en,reset_n)
	begin
		if carga_seg='0' then
			contador <= (others => '0');
		else 
			contador<=unsigned(ent_p(3 downto 0));
			if reset_n = '0' then
				contador <=(others => '0');
				co<='0';
			elsif clk 'event and clk = '1' and en='1'then
				if contador=to_unsigned(0,4) then	
					 contador <= to_unsigned(9,4);
					 co<='1';
				else 
					co<='0';
					contador <= contador - 1;
				end if;
			end if;
		end if;
	end process;
	
	cnt_segu<=std_logic_vector(contador);
End behavioral; 