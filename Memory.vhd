use IEEE.STD_LOGIC_1164.ALL;

entity Memory is
    Port ( In_BtnValue : in  STD_LOGIC_VECTOR (3 downto 0);
           In_Write : in  STD_LOGIC;
           In_Read : in  STD_LOGIC;
           Out_FullStack : out  STD_LOGIC;
           Out_MemCellValue : out  STD_LOGIC_VECTOR (3 downto 0);
           Out_BtnValue : out  STD_LOGIC);
end Memory;

architecture Behavioral of Memory is

begin


end Behavioral;

