# Microwave Timer System (VHDL)

## Overview

This project implements a digital microwave timer using VHDL on an FPGA platform. The system replicates the behavior of a real microwave oven, allowing users to input a time in minutes and seconds, start the countdown, and interact with the system through control signals such as door opening.

The design follows a structured hardware approach, separating the system into a datapath and a control unit governed by a finite state machine (FSM).

---

## System Functionality

The system operates as follows:

* A time value (0–59) is introduced using switches (BCD format)
* First button press loads the minutes
* Second button press loads the seconds and starts the countdown
* While running:

  * The signal `horno_on` is active (microwave ON)
* If the door is opened:

  * The system pauses
  * The microwave turns OFF
* If the door is closed:

  * The countdown resumes
* When the timer reaches zero:

  * The microwave turns OFF
  * A `fin` signal indicates completion

---

## Architecture

### Datapath

The datapath implements the countdown logic using cascaded counters:

* Frequency divider (50 MHz → 1 Hz)
* BCD counters for:

  * Seconds (units and tens)
  * Minutes (units and tens)
* Parallel load capability for initial time input

### Control Unit (FSM)

The control logic is implemented as a finite state machine responsible for:

* Managing time loading (minutes and seconds)
* Starting and stopping the timer
* Handling door events (pause/resume)
* Activating system outputs (`horno_on`, `fin`)

---

## Technologies and Tools

* VHDL
* Quartus II
* ModelSim (simulation)
* FPGA DE1 Board (50 MHz clock)

---

## Project Structure

```bash
src/        → VHDL source files (datapath, control unit, top level)
testbench/  → simulation files
docs/       → practice statement and diagrams
```

---

## Key Concepts Demonstrated

* Design of sequential digital systems
* Finite State Machines (FSM)
* Modular hardware design (datapath + control separation)
* Clock-driven systems and timing
* BCD counters and cascaded architectures

---

## Simulation

A testbench was developed to verify system behavior, including:

* Correct start after second button press
* Pause/resume functionality with door control
* Proper shutdown at end of countdown

---

## Possible Improvements

* Add display multiplexing for efficiency
* Implement adjustable clock scaling for faster simulation
* Extend functionality with additional user controls

---

## Author

Hugo Raggini Paternain
