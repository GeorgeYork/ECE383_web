e--------------------------------------------------------------------------------
-- Name:	George York
-- Purp:	Sandbox testbench to test simple VHDL code
--
-- Academic Integrity Statement: I certify that, while others may have 
-- assisted me in brain storming, debugging and validating this program, 
-- the program itself is my own work. I understand that submitting code 
-- which is the work of other individuals is a violation of the honor   
-- code.  I also understand that if I knowingly give my original work to 
-- another individual is also a violation of the honor code. 
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY sandbox_tb IS
END sandbox_tb;
 
ARCHITECTURE behavior OF sandbox_tb IS 
 

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
	signal ctrl : std_logic_vector(1 downto 0) := (others => '0');
   signal D : unsigned(3 downto 0) := (others => '0');

 	--Outputs
   signal Q : unsigned(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lec4 PORT MAP (
          clk => clk,
          reset => reset,
			 ctrl => ctrl,
          D => D,
          Q => Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
 	-----------------------------------------------------------------------------
	--		ctrl
	--		00			hold
	--		01			count up mod 10
	--		10			load D
	--		11			synch reset
	-----------------------------------------------------------------------------
	ctrl <= "01", "10" after 15us, "01" after 16us, "11" after 17us, "01" after 18us, "00" after 19us, "01" after 20us;
	D <= "1110";
	reset <= '0', '1' after 1us;

END;
