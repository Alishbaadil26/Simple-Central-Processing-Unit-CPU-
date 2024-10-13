onerror {quit -f}
vlib work
vlog -work work lab5Combined.vo
vlog -work work lab5Combined.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.lab5Combined_vlg_vec_tst
vcd file -direction lab5Combined.msim.vcd
vcd add -internal lab5Combined_vlg_vec_tst/*
vcd add -internal lab5Combined_vlg_vec_tst/i1/*
add wave /*
run -all
