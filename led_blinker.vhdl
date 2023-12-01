----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.12.2023 10:18:08
-- Design Name: 
-- Module Name: led_blink - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led_blink is
    Port ( i_clock : in STD_LOGIC;
           i_enable : in STD_LOGIC;
           i_switch1 : in STD_LOGIC;
           i_switch2 : in STD_LOGIC;
           o_led_drive : out STD_LOGIC);
end led_blink;
--constant to create frequencies needed
--formula is : (25MHZ/100HZ*50% duty cycle)
--so for 100HZ : (25000000/100)*0.5=125000
architecture Behavioral of led_blink is
constant c_cnt_100 : natural := 12500;
constant c_cnt_50 : natural := 2500;
constant c_cnt_10 : natural := 1250000;
constant c_cnt_1 : natural := 12500000;

-- These sognals will be the counters
signal r_cnt_100 : natural range 0 to c_cnt_100 ;
signal r_cnt_50 : natural range 0 to c_cnt_50 ;
signal r_cnt_10 : natural range 0 to c_cnt_10 ;
signal r_cnt_1 : natural range 0 to c_cnt_1 ;

-- These signals will toggle at the frequencies needed
signal r_toggle_100 : std_logic := '0';
signal r_toggle_50 : std_logic := '0';
signal r_toggle_10 : std_logic := '0';
signal r_toggle_1 : std_logic := '0';

--one bit select wire
signal w_ledselect : std_logic ;

begin
 --All processes toggle a specific signal at a different frequency
 --They all run continuosly even if the switches are not selecting thewir particular output
 p_100HZ : process(i_clock) is
 begin
 if rising_edge(i_clock) then
 if r_cnt_100 = c_cnt_100 - 1 then -- -1, since counter starts at 0
 r_toggle_100 <= not r_toggle_100;
 r_cnt_100 <= 0;
 else
 r_cnt_100 <= r_cnt_100 + 1;
 end if;
 end if;
 end process p_100HZ;
 p_50HZ : process(i_clock) is
 begin
 if rising_edge(i_clock) then
 if r_cnt_50 = c_cnt_50 - 1 then -- -1, since counter starts at 0
 r_toggle_50 <= not r_toggle_50;
 r_cnt_50 <= 0;
 else
 r_cnt_50 <= r_cnt_50 + 1;
 end if;
 end if;
 end process p_50HZ;
 p_10HZ : process(i_clock) is
 begin
 if rising_edge(i_clock) then
 if r_cnt_10 = c_cnt_10 - 1 then -- -1, since counter starts at 0
 r_toggle_10 <= not r_toggle_10;
 r_cnt_10 <= 0;
 else
 r_cnt_10 <= r_cnt_10 + 1;
 end if;
 end if;
 end process p_10HZ;
  p_1HZ : process(i_clock) is
  begin
 if rising_edge(i_clock) then
 if r_cnt_1 = c_cnt_1 - 1 then -- -1, since counter starts at 0
 r_toggle_1 <= not r_toggle_1;
 r_cnt_1 <= 0;
 else
 r_cnt_1 <= r_cnt_1 + 1;
 end if;
 end if;
 end process p_1HZ;
 --create a multiplexer based on switch inputs
 w_ledselect <= r_toggle_100 when(i_switch1 = '0' and i_switch2 = '0') else
  r_toggle_50 when(i_switch1 = '0' and i_switch2 = '0') else
   r_toggle_10 when(i_switch1 = '0' and i_switch2 = '0') else
   r_toggle_1;
 --only allow o_led_drive to drive when i_enable is high
 o_led_drive <= w_ledselect and i_enable;

end Behavioral;
