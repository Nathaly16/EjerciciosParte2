library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bits4Registro is
Port ( 	L : in  STD_LOGIC_VECTOR (3 downto 0);
         clk : in  STD_LOGIC;
         Q : out  STD_LOGIC_VECTOR (3 downto 0));
end Bits4Registro;

architecture Behavioral of Bits4Registro is
signal L1, L2, L3, L4 : STD_LOGIC;
begin
process(clk, L)
begin
	if(rising_edge(clk))then
			L1<=L(0);
			L2<=L(1);
			L3<=L(2);
			L4<=L(3);
	else
	end if;
end process;
			Q(0)<=L1;
			Q(1)<=L2;
			Q(2)<=L3;
			Q(3)<=L4;
end Behavioral;

