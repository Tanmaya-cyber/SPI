# SPI


## Introduction 
SPI (Serial Peripheral Interface) is a high-speed, synchronous serial communication protocol used for short-distance communication between microcontrollers and peripheral devices such as sensors, displays, memory modules, and more. It operates in a master-slave architecture, where a single master controls multiple slave devices.

### SPI Pins
_SPI typically uses four main signal lines_:

MOSI (Master Out, Slave In) – Data sent from the master to the slave.
MISO (Master In, Slave Out) – Data sent from the slave to the master.
SCK (Serial Clock) – Clock signal generated by the master to synchronize communication.
CS/SS (Chip Select/Slave Select) – Active-low signal to select a specific slave device.

### Concept of Clock Polarity & Clock Phase and their infulence on SPI Modes
these are different configurations for clk settings, which determine <ins> how </ins> and <ins> when </ins> data is transmitted and recieved.

1. **CPOL**: Clock POLarity determines the idle state of the clk , when the SPI bus is not in use. There are 2 types/values of COPL i.e. 0 & 1.

![Screenshot-175](https://github.com/user-attachments/assets/8e9dfb34-b2cb-4563-b11e-d69755c46bdd)

2. **CPHA**: Clock PHAse determines when data is sampled with respect to clock signal. There are 2 values of CPHA i.e. 0 & 1 .

      in "0" = Data is sampled on the first edge of the clock cycle.
      Data must be stable before the clock transistion
      
      in "1" = Data is sampled on the second edge of the clock cycle.
      Data must be stable after the clock transistion

3. 	SPI Modes
The table below shows the four SPI modes based on Clock Polarity (CPOL) and Clock Phase (CPHA):

| Mode | CPOL | CPHA | Clock Idle State | Data Sampling |
|------|------|------|-----------------|--------------|
| 0    | 0    | 0    | Low             | Leading Edge (Rising) |
| 1    | 0    | 1    | Low             | Trailing Edge (Falling) |
| 2    | 1    | 0    | High            | Leading Edge (Falling) |
| 3    | 1    | 1    | High            | Trailing Edge (Rising) |


## Objectives
1.  To implement the logic using Verilog and therefore, establish the SPI communication between 2 FPGA boards.
2. To do waveform analysis and verify the feasibility of the state machine that we have designed.
3. To verify the full-duplex communication i.e. correct data is transmitted and received.

## Block Diagram 
![block diagram](https://github.com/user-attachments/assets/e1f5e4b5-3b1c-4596-9d8f-720faa97b4ea)

## Details about the sub-blocks
1. SPI CONTROL REGISTER 1
2. SPI CONTROL REGISTER 2
3. SPI STATUS REGISTER
4. BAUD RATE GENERATOR
5. SPI DATA REGISTER
6. SHIFTER
7. PHASE + POLARITY CONTROL
8. SLAVE CONTOL
9. MASTER CONTROL

## Steps of Project implementation



## Results and Simulation


## References
