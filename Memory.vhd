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

  type Memory_type is array (15 downto 0) of std_logic_vector(3 downto 0);
  signal Memory : Memory_type;
  signal FullStackIndicator : std_logic;
  signal MemCellValue : std_logic_vector(3 downto 0);
  signal ButtonStates : std_logic_vector(3 downto 0);
  signal CellIndex : integer range 0 to 15 := 0;

begin
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

process(In_Write)
begin
	if rising_edge(In_Write) then
		

end process;

process(In_Read)
begin
	if rising_edge(In_Write) then
		if CellIndex < MaxIndex then
			Out_MemCellValue <= Memory(CellIndex);
		end if;
	end if;
end process;
 



end Behavioral;

