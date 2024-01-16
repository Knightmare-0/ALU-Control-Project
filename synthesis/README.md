## Netlist and Report Generation


### Run the below to generate the netlist
```
./netlist_gen.sh
```
> [!NOTE]
> Change the file path, file name, top module name and the library that is to be synthesized in
> netlist_gen.sh yosys_run.ys

### Run the below command to generate GLS and STA reports
```
./report_gen.sh
```
> [!NOTE]
> Change the file path, file name, top module name,the library, and the constraints in
> report_gen.sh sta.tcl


### Yosys Commands
```
read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog multicore_alu.v 
synth -top multicore_alu
dfflibmap -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
opt -purge 
abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
write_verilog -noattr multicore_tt_025C_1v80.v
```
