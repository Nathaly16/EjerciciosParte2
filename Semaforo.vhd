library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Semaforo is
Port ( 	L : in  STD_LOGIC_VECTOR (3 downto 0);
         clk : in  STD_LOGIC;
         Q : inout  STD_LOGIC_VECTOR (3 downto 0));
end Semaforo;

architecture Behavioral of Semaforo is
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
			
process (clk) begin

	if (clk' event and clk = '1') then
			q <= q + 1;
		if (q="1001") then
			 q <= "0000";
		end if;
		end if;
	end process;
end Behavioral;

