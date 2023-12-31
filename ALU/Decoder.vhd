------------------------------------------------------
--     BCD to Seven Segment Decoder
------------------------------------------------------
-- Parsa Mohammadi       9923121
------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Decoder is
	port(
			B0,B1,B2,B3 : in STD_LOGIC;
			A : out std_logic := '1';
			B : out std_logic := '1';
			C : out std_logic := '1';
			D : out std_logic := '1';
			E : out std_logic := '1';
			F : out std_logic := '1';
			G : out std_logic := '0'
	);
end Decoder;

architecture Behavioral of Decoder is

begin

A <= B0 OR B2 OR (B1 AND B3) OR (NOT B1 AND NOT B3);
B <= (NOT B1) OR (NOT B2 AND NOT B3) OR (B2 AND B3);
C <= B1 OR NOT B2 OR B3;
D <= (NOT B1 AND NOT B3) OR (B2 AND NOT B3) OR (B1 AND NOT B2 AND B3) OR (NOT B1 AND B2) OR B0;
E <= (NOT B1 AND NOT B3) OR (B2 AND NOT B3);
F <= B0 OR (NOT B2 AND NOT B3) OR (B1 AND NOT B2) OR (B1 AND NOT B3);
G <= B0 OR (B1 AND NOT B2) OR ( NOT B1 AND B2) OR (B2 AND NOT B3);
 

end Behavioral;
