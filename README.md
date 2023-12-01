# LED Blink VHDL Module

## Overview
This VHDL module, named "led_blink," facilitates LED control based on user-defined frequencies using clock signals and switches. The module generates four toggling signals at 100Hz, 50Hz, 10Hz, and 1Hz, allowing dynamic LED blinking patterns. The LED output is determined by user switches and an enable signal.

## Design Details
- **Inputs:**
  - `i_clock`: Clock signal
  - `i_enable`: Enable signal
  - `i_switch1` and `i_switch2`: User switches for frequency selection

- **Outputs:**
  - `o_led_drive`: Output signal to drive the LED

- **Frequencies:**
  - Toggling signals are generated at 100Hz, 50Hz, 10Hz, and 1Hz.

- **Switch Configuration:**
  - User switches (`i_switch1` and `i_switch2`) are used to select the desired frequency.

## Implementation Notes
- The code includes processes for each frequency, producing toggling signals and a multiplexer to select the appropriate signal based on user switches.
- The LED output is activated only when the enable signal is high.

## How to Use
1. Instantiate the `led_blink` module in your VHDL design.
2. Connect the module to the clock source (`i_clock`), enable signal (`i_enable`), and user switches (`i_switch1` and `i_switch2`).
3. Connect the LED to the `o_led_drive` output.
 
**Acknowledgments:**
Foundational insights into ride patterns. Contributions welcome for project enhancement.

Feel free to customize this description for your GitHub repository.





