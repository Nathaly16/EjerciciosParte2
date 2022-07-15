library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MaquinaEstado320 is
Port ( CLK : in STD_LOGIC;
           BTN : in STD_LOGIC_VECTOR (4 downto 0);
           LED : out STD_LOGIC_VECTOR (15 downto 0));
end MaquinaEstado;

architecture Behavioral of MaquinaEstado is
alias RST : STD_LOGIC is BTN(0);
    alias A : STD_LOGIC is BTN(4);
    alias B : STD_LOGIC is BTN(2);
    alias Y0 : STD_LOGIC is LED(0);
    alias Y1 : STD_LOGIC is LED(1);
    alias Y2 : STD_LOGIC is LED(2);
    alias Y3 : STD_LOGIC is LED(3);
    
    -- declaraciones modelo FSM
    type STATES is (S0, S1, S2, S3);
    signal state_reg, state_next: STATES;

begin

    -- registro de estados
    process(CLK)
    begin
        if CLK'event and CLK='1' then
            if RST='1' then 
                state_reg <= s0;
            else 
                state_reg <= state_next;
            end if;
         end if;
    end process;

    -- Lógica de estado siguiente (circuito combinacional)
    process (state_reg, A, B)
    begin
        state_next <= state_reg; 
        case state_reg is 
        when S0 =>
            if A='1' then
                state_next <= S1; 
            end if; 
        when S1 =>
            if B='1' then
                state_next <= S2; 
            end if; 
        when S2 => 
            if A='1' then
                state_next <= S3; 
            end if; 
        when S3 =>
            state_next <= S3;
        end case;
    end process;
    
    -- salida tipo Moore
    process (state_reg)
    begin
        -- estableciendo la salida por defecto
        -- nos aseguramos de crear un circuito
        -- combinacional sin latches.
        Y0 <= '0';
        Y1 <= '0';
        Y2 <= '0';
        Y3 <= '0'; 
        case state_reg is 
        when S0 => Y0 <= '1'; 
        when S1 => Y1 <= '1'; 
        when S2 => Y2 <= '1'; 
        when S3 => Y3 <= '1';
        end case; 
    end process;    

end Behavioral;

