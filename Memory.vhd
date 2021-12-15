library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Memory is
    Port ( In_BtnValue : in  STD_LOGIC_VECTOR (3 downto 0);
           In_Write : in  STD_LOGIC;
           In_Read : in  STD_LOGIC;
			  In_Enable : in STD_LOGIC;
           Out_FullStack : out  STD_LOGIC;
           Out_MemCellValue : out  STD_LOGIC_VECTOR (3 downto 0);
           Out_BtnValue : out  STD_LOGIC_VECTOR (3 downto 0));
end Memory;

architecture Behavioral of Memory is

  type Memory_type is array (15 downto 0) of STD_LOGIC_VECTOR(3 downto 0);
  signal Memory : Memory_type;
  signal FullStackIndicator : STD_LOGIC := '0';
  signal ButtonStates : STD_LOGIC_VECTOR(3 downto 0) :="0000";
  signal MaxIndex : integer range 0 to 16 := 0;
  signal Writesig : STD_LOGIC;
  signal Readsig : STD_LOGIC;
  signal MemCellValue : STD_LOGIC_VECTOR(3 downto 0) :="0000";
  signal Enable : STD_LOGIC;
  
begin

	Out_FullStack <= FullStackIndicator;
	ButtonStates <= In_BtnValue;
	Out_BtnValue <= ButtonStates;
	Writesig <= In_Write;
	Readsig <= In_Read;
	Out_MemCellValue <= MemCellValue;
	Enable <=In_Enable;
	
--Process of writing buttons values to memory cell on rising 
--edge of btn0, value always goes to Memory(0) (First IN)

	process (Writesig,Readsig)
	begin
	if Enable ='1' then
		if Writesig='1' and Readsig='0' then
	
--Writing new value when stack still have free cells
	
			if FullStackIndicator = '0' then
				if MaxIndex > 0 then
					for i in Memory'high - 1 downto 0 loop
							Memory(i+1) <= Memory(i);
					end loop;
				end if;
				Memory(0) <= ButtonStates;
				if MaxIndex <= 15 then
					MaxIndex <= MaxIndex + 1;
				end if;
		
--Writing new value when stack is overflowed (Last OUT)	
	
			elsif FullStackIndicator = '1' then
				for i in 14 downto 0 loop
					Memory(i+1) <= Memory(i);
				end loop; 
				Memory(0) <= ButtonStates;
			end if;
			
			if MaxIndex = 16 then
				FullStackIndicator <= '1';
			end if;
		end if;	
	

--Process of reading memory on rising edge of btn1, reading last cell
--and deleting this cell (Last OUT)

		if Readsig ='1' and Writesig='0' then
		if MaxIndex > 0 then
				MemCellValue <= Memory(MaxIndex - 1);
				Memory(MaxIndex - 1) <="0000";
				MaxIndex <= MaxIndex - 1;
		end if;
		end if;
		end if;
	end process;


end Behavioral;

