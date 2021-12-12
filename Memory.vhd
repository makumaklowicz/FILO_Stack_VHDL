use IEEE.STD_LOGIC_1164.ALL;

entity Memory is
    Port ( In_BtnValue : in  STD_LOGIC_VECTOR (3 downto 0);
           In_Write : in  STD_LOGIC;
           In_Read : in  STD_LOGIC;
           Out_FullStack : out  STD_LOGIC;
           Out_MemCellValue : out  STD_LOGIC_VECTOR (3 downto 0);
           Out_BtnValue : out  STD_LOGIC_VECTOR (3 downto 0));
end Memory;

architecture Behavioral of Memory is

  type Memory_type is array (15 downto 0) of STD_LOGIC_VECTOR(3 downto 0);
  signal Memory : Memory_type;
  signal FullStackIndicator : STD_LOGIC;
  signal MemCellValue : STD_LOGIC_VECTOR(3 downto 0);
  signal ButtonStates : STD_LOGIC_VECTOR(3 downto 0) :="0000";
  signal CellIndex : integer range 0 to 15 := 0;
  signal MaxIndex : integer range 0 to 15 := 0;

begin

	Out_FullStack <= FullStackIndicator;
	ButtonStates <= In_BtnValue;
	Out_BtnValue <= ButtonStates;


	with ButtonStates select 
			CellIndex <= 0 when "0000",
							1 when "0001",
							2 when "0010",
							3 when "0011",
							4 when "0100",
							5 when "0101",
							6 when "0110",
							7 when "0111",
							8 when "1000",
							9 when "1001",
							10 when "1010",
							11 when "1011",
							12 when "1100",
							13 when "1101",
							14 when "1110",
							15 when "1111",


--Process of writing buttons values to memory cell on rising 
--edge of sw0, value always goes to Memory(0) (First IN)

	process (In_Write)
	begin
		if rising_edge(In_Write) then
	
--Writing new value when stack still have free cells
	
			if FullStackIndicator = '0' then
				if MaxIndex > 0 then
					for i in MaxIndex - 1 downto 0 loop
							Memory(i+1) <= Memory(i);
					end loop;
				end if;
				Memory(0) <= ButtonStates;
				if MaxIndex <= 15 then
					MaxIndex <= MaxIndex + 1;
				end if;
			end if;
		
--Writing new value when stack is overflowed (Last OUT)	
	
			elsif FullStackIndicator = '1' then
				for i in 14 downto 0 loop
					Memory(i+1) <= Memory(i);
				end loop; 
				Memory(0) <= ButtonStates;
			end if;
		end if;	
	end process;

--Process of reading memory on rising edge of sw1, cell to read 
--is chosen by CellIndex variable which depends on states of buttons

	process (In_Read)
	begin
		if rising_edge(In_Write) then
			if CellIndex < MaxIndex then
				Out_MemCellValue <= Memory(CellIndex);
			else
				Out_MemCellValue <= "0000"
			end if;
		end if;
	end process;
 
	if MaxIndex = '16' then
		FullStackIndicator <= "1";
	end if;


end Behavioral;

