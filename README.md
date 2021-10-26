# MIPS Processor
###### tags: `ece550 project`

## Contributor
* `cl583 Chang Che Liu`
* `sb712 Sangwook Bok`

## Thinking Process
1. calcualte delay
2. design clock
3. wire different components
4. test the result thoroughly (by extend wire to ouput)

## Datapath Design
![](https://i.imgur.com/xipEynA.jpg)

## Control Logic Design
![](https://i.imgur.com/7ZR5yiO.jpg)
![](https://i.imgur.com/y7ihsNQ.jpg)


## Delay Calculate
* ALU: 26ns
* Imem: 12ns
* PC: 7ns
* Control: 8ns
* Register: 20ns
* mux 2 to 1 (32 bit): 11ns
* sign extension: 8ns
* DMem: 11ns

## Clock Design
![](https://i.imgur.com/4NAjDZE.jpg)
* Period of Processor clock: 120ns
    * PC = PC+1 every 120ns
* Period of imem clock: 20ns
    * update instruction every 20ns
    * however, instruction only changes every 120ns
* Period of dmem clock: 120ns
    * write/read every 120ns
* Period of regfile clock: 120ns
    * write every 120ns

## Files Description 
### alu.v
Do the following alu operation:
* add
* sub
* addi
* sll
* sra
* and
* or
### imem.v
instruction memory

### dmem.v
data memory

### refile.v
registers files

### processor.v
Take in different clocks for each components (processor, imeme, dmem, reg files), and produce adress for memory component (imem, dmem, reg files)

### clock_generator.v
Produce processor clock, dmem clock, and regfile clock by adjusting main clock using PWM.
