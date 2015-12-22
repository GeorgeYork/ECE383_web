----------------------------------------------------------------------
-- Name:	Capt Jeff Falkinburg
-- Date:	Spring 2016
-- Pupr:	Test bench for Lecture 1 - majority circuit  
----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity lec1_tb is 
end entity lec1_tb;

architecture behavior of lec1_tb is

	----------------------------------------------------------------------
	-- These signal names must match the names of the I/O markers
	----------------------------------------------------------------------
	component majority is
        port(	a, b, c:	in std_logic; 
					f:   		out std_logic);
	end component;
  
  
	signal A, B, C, F : std_logic;
	  
	CONSTANT TEST_ELEMENTS:integer:=8;
	SUBTYPE INPUT is std_logic_vector(2 downto 0);
	TYPE TEST_INPUT_VECTOR is array (1 to TEST_ELEMENTS) of INPUT;
	SIGNAL TEST_IN: TEST_INPUT_VECTOR := (	"000", "001", "010", "011", "100", "101", "110", "111");

	TYPE TEST_OUTPUT_VECTOR is array (1 to TEST_ELEMENTS) of std_logic;
	SIGNAL TEST_OUT: TEST_OUTPUT_VECTOR := ('0', '0', '0', '1', '0', '1', '1', '1');

	SIGNAL i : integer;		

begin

	----------------------------------------------------------------------
	-- Create an instance of your majority
	----------------------------------------------------------------------
	UUT:	majority port map (A, B, C, F);

	tb : PROCESS
	BEGIN
	for i in 1 to TEST_ELEMENTS loop
		-----------------------------------------
		-- Parse out the bits of the test_vector
		-----------------------------------------
		A <= test_in(i)(2);
		B <= test_in(i)(1);
		C <= test_in(i)(0);
		
		wait for 10 ns; 
		assert F = test_out(i)
 				report "Error with input i in majority circuit "
				severity failure;
				
	end loop;
	
	---------------------------
	-- Just halt the simulator
	---------------------------
	assert TRUE = FALSE 
		report "---------------Self-checking testbench completed.  Nominal circuit behavior---------------"
		severity failure;
			
	END PROCESS tb;

end architecture behavior;