
-- VHDL Instantiation Created from source file ALU.vhd -- 23:25:21 06/25/2023
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_ALU: ALU PORT MAP(
		input1 => ,
		input2 => ,
		operation => ,
		clk => ,
		RST => ,
		output => ,
		scode => ,
		flag => 
	);


