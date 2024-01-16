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

### OpenSTA Commands
```
read_liberty /lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog netlist/multicore_tt_025C_1v80.lib.v
link_design multicore
read_sdc /constraints/contraint.tcl
report_checks -verbose -path_delay min_max -fields {nets cap slew input_pins} -digits 4 > sta_report/bidcounter_gen_rep.rpt
report_wns -digits 4 > sta_report/wns
report_tns -digits 4 > sta_report/tns
report_worst_slack -digits 4 > sta_report/worst_slack
report_check_types -all_violators > sta_report/violations
```
> [!NOTE]
> After reading the constraints file
> input command report_checks
> Check if the slack is positive
> Take the reciprocal of the slack to obtain the maximum clock frequency
> time scale is typically in nano seconds
