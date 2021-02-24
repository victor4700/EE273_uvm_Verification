# EE273_uvm_Verification
 Topics in verification with the full System Verilog language. Majortopics include classes and objects, random constrained test generation, and system-level verification.

## 1. Rand numbers
This first assignment provides a test bench and a set of DUTs. You will be required to modify the test bench to find all the failing DUTs. To help you out, the DUTs are encrypted. They are black boxes. The working model is dut0.sv.

## 2. Messages
Create a UVM environment and test bench with two scoreboards. In the run phase of the first scoreboard, send 20 messages containing your name, and an integer with the message number.

Receive these messages in the second scoreboard. Print the message content. 

You don't need a DUT, but will need a top level module to get things going.

## 3. ALU sequence
Create a UVM model consisting of a sequence, sequencer, and driver (Contained in some hierarchy of your choice). Generate 50 patterns to test the carry from bit 5 to bit 6 in an ALU. Generate 100 patterns to text bit XOR for all 36 bits.  Print the pattern data in the driver (There is no DUT for this problem).

Assume the ALU has 4 inputs

A 36 bits signed

B 21 bits signed

op 1 bit 0= add 1=xor

ci 1 bit (carry in)

Assume the ALU has 2 outputs

Z 36 bits signed

co 1 bit (carry out)
