LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
 
ENTITY TB_Top IS
END TB_Top;
 
ARCHITECTURE behavior OF TB_Top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Top
    PORT(
         input1 : IN  std_logic_vector(9 downto 0);
         input2 : IN  std_logic_vector(9 downto 0);
         operation : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         RST : IN  std_logic;
         output : OUT  std_logic_vector(9 downto 0);
         scode : OUT  std_logic_vector(2 downto 0);
         flag : OUT  std_logic_vector(2 downto 0);
         
			Ai1 : OUT  std_logic;
         Ai2 : OUT  std_logic;
         Ao3 : OUT  std_logic;
         Bi1 : OUT  std_logic;
         Bi2 : OUT  std_logic;
         Bo3 : OUT  std_logic;
         Ci1 : OUT  std_logic;
         Ci2 : OUT  std_logic;
         Co3 : OUT  std_logic;
         Di1 : OUT  std_logic;
         Di2 : OUT  std_logic;
         Do3 : OUT  std_logic;
         Ei1 : OUT  std_logic;
         Ei2 : OUT  std_logic;
         Eo3 : OUT  std_logic;
         Fi1 : OUT  std_logic;
         Fi2 : OUT  std_logic;
         Fo3 : OUT  std_logic;
         Gi1 : OUT  std_logic;
         Gi2 : OUT  std_logic;
         Go3 : OUT  std_logic
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
   signal flag : std_logic_vector(2 downto 0);
   signal Ai1 : std_logic;
   signal Ai2 : std_logic;
   signal Ao3 : std_logic;
   signal Bi1 : std_logic;
   signal Bi2 : std_logic;
   signal Bo3 : std_logic;
   signal Ci1 : std_logic;
   signal Ci2 : std_logic;
   signal Co3 : std_logic;
   signal Di1 : std_logic;
   signal Di2 : std_logic;
   signal Do3 : std_logic;
   signal Ei1 : std_logic;
   signal Ei2 : std_logic;
   signal Eo3 : std_logic;
   signal Fi1 : std_logic;
   signal Fi2 : std_logic;
   signal Fo3 : std_logic;
   signal Gi1 : std_logic;
   signal Gi2 : std_logic;
   signal Go3 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top PORT MAP (
          input1 => input1,
          input2 => input2,
          operation => operation,
          clk => clk,
          RST => RST,
          output => output,
          scode => scode,
          flag => flag,
          Ai1 => Ai1,
          Ai2 => Ai2,
          Ao3 => Ao3,
          Bi1 => Bi1,
          Bi2 => Bi2,
          Bo3 => Bo3,
          Ci1 => Ci1,
          Ci2 => Ci2,
          Co3 => Co3,
          Di1 => Di1,
          Di2 => Di2,
          Do3 => Do3,
          Ei1 => Ei1,
          Ei2 => Ei2,
          Eo3 => Eo3,
          Fi1 => Fi1,
          Fi2 => Fi2,
          Fo3 => Fo3,
          Gi1 => Gi1,
          Gi2 => Gi2,
          Go3 => Go3
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

		
		wait;
   end process;

END;
