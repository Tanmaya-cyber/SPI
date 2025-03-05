## Introduction 
SPI (Serial Peripheral Interface) is a high-speed, synchronous serial communication protocol used for short-distance communication between microcontrollers and peripheral devices such as sensors, displays, memory modules, and more. It operates in a master-slave architecture, where a single master controls multiple slave devices.

### SPI Pins
_SPI typically uses four main signal lines_:

> MOSI (Master Out, Slave In) – Data sent from the master to the slave.
> MISO (Master In, Slave Out) – Data sent from the slave to the master.
> SCK (Serial Clock) – Clock signal generated by the master to synchronize communication.
> CS/SS (Chip Select/Slave Select) – Active-low signal to select a specific slave device.

### Concept of Clock Polarity & Clock Phase and their infulence on SPI Modes
These are different configurations for clk settings, which determine <ins>how</ins> and <ins>when</ins> data is transmitted and recieved.

1. **CPOL**: Clock POLarity determines the idle state of the clk , when the SPI bus is not in use. There are 2 types/values of COPL i.e. 0 & 1.
![cpol](https://github.com/user-attachments/assets/203b6229-e5c4-4e6e-8ffa-a171ba5f79b0)

3. **CPHA**: Clock PHAse determines when data is sampled with respect to clock signal. There are 2 values of CPHA i.e. 0 & 1 .

      in "0" = Data is sampled on the first edge of the clock cycle.
      Data must be stable before the clock transistion
      
      in "1" = Data is sampled on the second edge of the clock cycle.
      Data must be stable after the clock transistion

4. **SPI Modes**
The table below shows the four SPI modes based on Clock Polarity (CPOL) and Clock Phase (CPHA):

      | Mode | CPOL | CPHA | Clock Idle State | Data Sampling |
      |------|------|------|-----------------|--------------|
      | 0    | 0    | 0    | Low             | Leading Edge (Rising) |
      | 1    | 0    | 1    | Low             | Trailing Edge (Falling) |
      | 2    | 1    | 0    | High            | Leading Edge (Falling) |
      | 3    | 1    | 1    | High            | Trailing Edge (Rising) |

<!--![download](https://github.com/user-attachments/assets/14e27d31-f3b1-4cda-9321-6acbb44aa798)
 ![spi-modes png-1230x0](https://github.com/user-attachments/assets/df7c01b1-60b0-4d96-a306-33e5c5c8d31b)  -->
![Screenshot 2025-03-05 183442](https://github.com/user-attachments/assets/e4a89a37-5865-4dec-a94b-3479921d0092)


## Objectives
1. To implement the logic using Verilog and therefore, establish the SPI communication.
2. To do waveform analysis and verify the feasibility of the state machine that we have designed.
3. To verify the full-duplex communication i.e. correct data is transmitted and received.

## Multi Slave - Configurations in SPI
1. Independent Slave Configuration
   - each slave has a dedicated CS line.
   - the master activates <ins>only one slave at a time</ins> by pulling CS down.
2. Daisy Chain Configuration
   - slaves are connected in a chain, passing data through each device.
   - MISO of one slave connects to MOSI of the next slave.
  
## How Does SPI Work?
1. Clock:
   -The clock signal synchronizes the output of data bits from the master to the sampling of bits by the slave. 1 bit of data is transferred in each clock cycle , so the speed of data transfer is determined by frequency of the clock signal. The Clock signal in SPI can be modified using the properties of CPOL & CPHA .
2. Slave Select:
   - A slave chip becomes active when cs = 0.
   - in case of multiple chip select, either all are given parallel cs lines or are connected in daisy chaining method.
3. MOSI:
   -The master sends data to the slave bit by bit, in serial through the MOSI line.
   -Data sent from the master to the slave is usually sent with the MSB first.
5. MISO:
   -The slave can also send data back to the master through the MISO line in serial.
   -The data sent from the slave back to the master is usually sent with the LSB first.

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
