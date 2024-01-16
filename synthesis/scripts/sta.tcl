read_liberty /lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog netlist/multicore_tt_025C_1v80.lib.v
link_design multicore
read_sdc /constraints/contraint.tcl
report_checks -verbose -path_delay min_max -fields {nets cap slew input_pins} -digits 4 > sta_report/bidcounter_gen_rep.rpt
report_wns -digits 4 > sta_report/wns
report_tns -digits 4 > sta_report/tns
report_worst_slack -digits 4 > sta_report/worst_slack
report_check_types -all_violators > sta_report/violations 
