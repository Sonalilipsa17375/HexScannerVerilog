# Hexadecimal Keypad Scanner using Verilog

## Project Description

This project implements a hexadecimal keypad scanner using Verilog. The scanner detects key presses from a 4x4 matrix keypad (Grayhill 072) and outputs the corresponding hexadecimal code. It includes modules for row scanning, synchronization, and state machine logic to accurately identify which key is pressed.

## Modules

### Hex_Keypad_Grayhill_072

This is the main module that handles the state machine logic to scan the keypad and output the corresponding hexadecimal code.

#### Ports
- `input [3:0] Row`: Row inputs from the keypad.
- `input S_Row`: Synchronized row input.
- `input clock`: Clock signal.
- `input reset`: Reset signal.
- `output reg [3:0] Code`: Hexadecimal code of the pressed key.
- `output Valid`: Indicates if a valid key is pressed.
- `output reg [3:0] Col`: Column outputs to the keypad.

### Row_Signal

This module determines which row of the keypad has an asserted key.

#### Ports
- `input [15:0] Key`: One-hot encoded key press inputs.
- `input [3:0] Col`: Column inputs.
- `output reg [3:0] Row`: Row outputs.

### Synchronizer

This module synchronizes the row signals to avoid glitches and ensure accurate key detection.

#### Ports
- `input [3:0] Row`: Row inputs from the keypad.
- `input clock`: Clock signal.
- `input reset`: Reset signal.
- `output reg S_Row`: Synchronized row output.

### test_Hex_Keypad

This is the testbench module used to simulate and verify the functionality of the keypad scanner.

#### Signals
- `wire [3:0] Code`: Hexadecimal code output from the scanner.
- `wire Valid`: Valid signal from the scanner.
- `wire [3:0] Col`: Column outputs from the scanner.
- `wire [3:0] Row`: Row inputs to the scanner.
- `reg clock, reset`: Clock and reset signals.
- `reg [15:0] Key`: One-hot encoded key press inputs.
- `reg [39:0] Pressed`: ASCII representation of the pressed key for display.

## Simulation and Testbench

The testbench module `test_Hex_Keypad` simulates the keypad scanner's functionality. It generates clock and reset signals and iterates through all possible key presses to verify the scanner's output.

### Waveform Configuration

The provided waveform configuration XML file can be used with a simulation tool to visualize the signals during simulation. The file sets up the display of important signals such as `clock`, `reset`, `Code`, `Valid`, `Col`, `Row`, `Key`, and `Pressed`.

## Usage

1. Compile and load the Verilog modules in your preferred simulation tool.
2. Run the simulation using the `test_Hex_Keypad` module.
3. Observe the output signals and verify that the correct hexadecimal code is generated for each key press.
4. Use the waveform configuration file to visualize the signals during the simulation for easier debugging and verification.

## Parameters

- `S_0` to `S_5`: One-hot encoded state machine parameters used in the `Hex_Keypad_Grayhill_072` module.
- `Key_0` to `Key_F`: ASCII representations of the keys used in the testbench for display purposes.
- `None`: ASCII representation for no key press.

## Dependencies

- Verilog simulation tool (Xilinx Vivado).

## License

This project is under the Apache License. See the LICENSE file for more details.
