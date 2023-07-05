LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY TB_flag IS
END TB_flag;
 
ARCHITECTURE behavior OF TB_flag IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         input1 : IN  std_logic_vector(9 downto 0);
         input2 : IN  std_logic_vector(9 downto 0);
         operation : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         RST : IN  std_logic;
         output : OUT  std_logic_vector(9 downto 0);
         scode : OUT  std_logic_vector(2 downto 0);
         flag : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input1 : std_logic_vector(9 downto 0) := (others => '0');
   signal input2 : std_logic_vector(9 downto 0) := (others => '0');
   signal operation : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(9 downto 0);
   signal scode : std_logic_vector(2 downto 0);
   signal flag : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          input1 => input1,
          input2 => input2,
          operation => operation,
          clk => clk,
          RST => RST,
          output => output,
          scode => scode,
          flag => flag
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		-- ADD
		input1 <= std_logic_vector(to_unsigned(0,10));
		input2 <= std_logic_vector(to_unsigned(1,10));
		operation <= "0010";
		RST <= '0';
		-- OUT = "0000000001"
		
		wait for 10 ns;
		RST <= '1';
		wait for 1 ns;
		
		-- AND
		input1 <= std_logic_vector(to_unsigned(2,10));
		input2 <= std_logic_vector(to_unsigned(1,10));
		operation <= "0001";
		RST <= '0';
		-- OUT = "0000000000"
		
		wait for 10 ns;
		RST <= '1';
		wait for 1 ns;
		
		-- AND
		input1 <= std_logic_vector(to_unsigned(4,10));
		input2 <= std_logic_vector(to_unsigned(1,10));
		operation <= "0000";
		RST <= '0';
		-- OUT = "0000000000"
				
		wait for 10 ns;
		RST <= '1';
		wait for 1 ns;
		
		-- OR
		input1 <= "1010101010";
		input2 <= "0101010101";
		operation <= "0011";
		RST <= '0';
		-- OUT = "1111111111"		

		wait for 10 ns;
		RST <= '1';
		wait for 1 ns;
		
		-- MUL
		input1 <= std_logic_vector(to_unsigned(4,10));
		input2 <= std_logic_vector(to_unsigned(2,10));
		operation <= "0100";
		RST <= '0';
		-- OUT = "0000001000"

		wait for 10 ns;
		RST <= '1';
		wait for 1 ns;

		-- XOR
		input1 <= std_logic_vector(to_unsigned(57,10));
		input2 <= std_logic_vector(to_unsigned(57,10));
		operation <= "0101";
		RST <= '0';
		-- OUT = "0000000000"		
		
		
		wait for 10 ns;
		RST <= '1';
		wait for 1 ns;

		-- Right Shift
		input2 <= "1010101110";
		operation <= "0110";
		RST <= '0';
		-- OUT = "0101010111"		

		wait for 10 ns;
		RST <= '1';
		wait for 1 ns;

		-- left Shift
		input2 <= "1010101110";
		operation <= "0111";
		RST <= '0';
		-- OUT = "0101011101"				

      wait;
   end process;

END;
