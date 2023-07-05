
--				ALU
----------------------------------------------------
-- Parsa Mohammadi
-- 9923121
----------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
generic(DataWidth : integer := 10); -- Generic allows user to input with any length
    Port ( 
			  input1 : in  STD_LOGIC_VECTOR (DataWidth -1 downto 0);
			  input2 : in  STD_LOGIC_VECTOR (DataWidth -1 downto 0);
           operation : in  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in STD_LOGIC;
			  RST : IN STD_LOGIC;
			  output : out  STD_LOGIC_VECTOR (DataWidth -1 downto 0);
			  scode : out STD_LOGIC_VECTOR (2 downto 0);
			  flag : out std_logic_vector(2 downto 0)
			  );
end ALU;

architecture Behavioral of ALU is

-- Define States
type State is (ready, decode, in_process, writing, reading , in_output);
signal currentState : State;




begin

main : process(clk, RST)
-- Define additional variables
variable REG1,REG2 : std_logic_vector(DataWidth -1  downto 0); -- In this line I have definded two signal as two input registers 
variable OUTREG : std_logic_vector(DataWidth -1  downto 0); -- In this line I have defined one signal as output register
variable temp : std_logic_vector(DataWidth -1  downto 0) := (others => '0');
variable temp2 : std_logic_vector(((2*DataWidth) -1)  downto 0) := (others => '0');

begin

	if (RST = '0')	then
		if rising_edge(clk) then
				case currentState is 
						
						when ready => -- in ready state machine is ready for new inputs ans commands
							REG1 := input1;
							REG2 := input2;
							currentState <= decode;
						
						when decode =>	-- in this state machine will figure out what to do	
								if (operation = "1000") then -- checks if is write moode or not
										scode <= "010";
										currentState <= writing;
										
								elsif (operation = "1001") then -- checks if is read moode or not
										scode <= "011";
										currentState <= reading;	
										
								elsif	(operation > "1001") then -- if none turn back and resive new command
										scode <= "000";
										currentState <= ready;
								
								else 	-- logical and computional operations
										scode <= "001";
										currentState <= in_process;
								end if ;
								
						when in_process => -- in this state logical and computitional operation will done
							case operation is 
										
										when "0000" => --SUB 
												OUTREG := (REG1 - REG2);
												scode <= "100";
												currentState <= in_output;
												
										when "0001" => -- AND
												OUTREG := (REG1 and REG2);
												scode <= "100";
												currentState <= in_output;
												
										when "0010" => -- ADD
												OUTREG := (REG1 + REG2);
												scode <= "100";
												currentState <= in_output;
												
										when "0011" => --OR
												OUTREG := (REG1 or REG2);
												scode <= "100";
												currentState <= in_output;

										when "0100" => --MUL
												temp2 := REG1 * REG2;
												OUTREG := temp2(DataWidth-1 downto 0);
												scode <= "100";
												currentState <= in_output;
												
										when "0101" => --XOR
												OUTREG := (REG1 xor REG2);
												scode <= "100";
												currentState <= in_output;											
										
										when "0110" => -- Right shift
												temp(DataWidth -2 downto 0) := REG2(DataWidth -1 downto 1);
												OUTREG := temp;
												scode <= "100";
												currentState <= in_output;
												
										when "0111" => --left shift
												temp(DataWidth-1 downto 1) := REG2(DataWidth -2 downto 0);
												OUTREG := temp;
												scode <= "100";
												currentState <= in_output;
										
										when others =>
												OUTREG := std_logic_vector(to_unsigned(0,DataWidth)); --zero output
												scode <= "000";
												currentState <= ready; -- change moode to ready mood

									end case; -- process
							
							when writing => --wirte mood
									
									OUTREG := REG2;
									scode <= "000";
									currentState <= ready;
							
							when reading => -- read mood
							
									output <= OUTREG;
									scode <= "000";
									currentState <= ready;
							
							when in_output => -- in this state the value of output register will go to output
									output <= OUTREG;
									
									if OUTREG = std_logic_vector(to_unsigned(0,DataWidth)) then
										flag <= "001"; --Zero flag will rise 
									
									elsif OUTREG > std_logic_vector(to_unsigned((2**DataWidth-1),DataWidth)) then
										flag <= "010"; -- Over flow flag will rise
										
									elsif OUTREG(DataWidth-1) = '1' then
										flag <= "011"; -- Negetive flag will raise
									
									elsif OUTREG = std_logic_vector(to_unsigned((2**DataWidth-1),DataWidth)) then
										flag <= "100"; -- carry flag will rise
									
									else 
										flag <= "000";
									
									end if;
									
									scode <= "000";
									currentState <= ready;

					end case; -- scode
			
			end if; --clk

			else 
					scode <= "000";
					currentState <= ready;
		end if; --reset

end process main;


end Behavioral;

