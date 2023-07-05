library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Top is
generic(DataWidth : integer := 10); -- Generic allows user to input with any length
    Port ( 
			  -- For ALU
			  input1 : in  STD_LOGIC_VECTOR (DataWidth -1 downto 0);
			  input2 : in  STD_LOGIC_VECTOR (DataWidth -1 downto 0);
           operation : in  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in STD_LOGIC;
			  RST : IN STD_LOGIC;
			  output : out  STD_LOGIC_VECTOR (DataWidth -1 downto 0);
			  scode : out STD_LOGIC_VECTOR (2 downto 0);
			  flag : out std_logic_vector(2 downto 0);
			  -- For seven segments:
			  Ai1, Ai2, Ao3 : out std_logic:= '0';
			  Bi1, Bi2, Bo3 : out std_logic:= '0';
			  Ci1, Ci2, Co3 : out std_logic:= '0';
			  Di1, Di2, Do3 : out std_logic:= '0';
			  Ei1, Ei2, Eo3 : out std_logic:= '0';
			  Fi1, Fi2, Fo3 : out std_logic:= '0';
			  Gi1, Gi2, Go3 : out std_logic:= '0'
			  );
end Top;

architecture Behavioral of Top is

COMPONENT ALU
	PORT(
		input1 : IN std_logic_vector(9 downto 0);
		input2 : IN std_logic_vector(9 downto 0);
		operation : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;
		RST : IN std_logic;          
		output : OUT std_logic_vector(9 downto 0);
		scode : OUT std_logic_vector(2 downto 0);
		flag : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

COMPONENT Decoder
	PORT(
		B0 : IN std_logic;
		B1 : IN std_logic;
		B2 : IN std_logic;
		B3 : IN std_logic;          
		A : OUT std_logic;
		B : OUT std_logic;
		C : OUT std_logic;
		D : OUT std_logic;
		E : OUT std_logic;
		F : OUT std_logic;
		G : OUT std_logic
		);
	END COMPONENT;

signal REG1 : std_logic_vector(DataWidth -1  downto 0); 
signal REG2 : std_logic_vector(DataWidth -1  downto 0); -- In this line I have definded two signal as two input registers 
signal OUTREG : std_logic_vector(DataWidth -1  downto 0); -- In this line I have defined one signal as output register

begin

REG1 <= input1;
REG2 <= input2;
output <= OUTREG;

Inst_ALU: ALU PORT MAP(
		input1 => input1,
		input2 => input2,
		operation => operation,
		clk => clk,
		RST => RST,
		output => OUTREG,
		scode => scode,
		flag => flag
	);

inputSeven1: Decoder PORT MAP(
		B0 => REG1(3),
		B1 => REG1(2),
		B2 => REG1(1),
		B3 => REG1(0),
		A => Ai1,
		B => Bi1,
		C => Ci1,
		D => Di1,
		E => Ei1,
		F => Fi1,
		G => Gi1
	);

inputSeven2: Decoder PORT MAP(
		B0 => REG2(3),
		B1 => REG2(2),
		B2 => REG2(1),
		B3 => REG2(0),
		A => Ai2,
		B => Bi2,
		C => Ci2,
		D => Di2,
		E => Ei2,
		F => Fi2,
		G => Gi2
	);

outputSeven: Decoder PORT MAP(
		B0 => OUTREG(3),
		B1 => OUTREG(2),
		B2 => OUTREG(1),
		B3 => OUTREG(0),
		A => Ao3,
		B => Bo3,
		C => Co3,
		D => Do3,
		E => Eo3,
		F => Fo3,
		G => Go3
	);



end Behavioral;

