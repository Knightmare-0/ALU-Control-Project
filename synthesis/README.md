## Netlist and Report Generation


### Run the below to generate the netlist
```
./netlist_gen.sh
```
#### Note
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
