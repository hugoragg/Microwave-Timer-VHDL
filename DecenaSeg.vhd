Library ieee; 
Use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

Entity DecenaSeg is 

	Port( 
		en: in std_logic;
		clk: in std_logic;
		reset_n: in std_logic;
		carga_seg: in std_logic;
		ent_p: in std_logic_vector (6 downto 0);
		cnt_segd: out std_logic_vector (2 downto 0);
		co: out std_logic
		);

End DecenaSeg; 

Architecture behavioral of DecenaSeg is  
    signal contador : unsigned(2 downto 0);
	Begin  
	
	process (clk, en,reset_n)
	begin
		if carga_seg='0' then
			contador <= (others => '0');
		else 
			contador<=unsigned(ent_p(6 downto 4));
			if reset_n = '0' then
				contador <=(others => '0');
				co<='0';
			elsif clk 'event and clk = '1' and en='1'then
				if contador=to_unsigned(0,3) then	
					 contador <= to_unsigned(5,3);
					 co<='1';
				else 
					co<='0';
					contador <= contador - 1;
				end if;
			end if;
		end if;
	end process;
	
	cnt_segd<=std_logic_vector(contador);
End behavioral; 