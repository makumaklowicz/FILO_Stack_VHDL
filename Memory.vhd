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
  signal CellIndex : integer range 0 to 15 := 0;

begin


end Behavioral;

