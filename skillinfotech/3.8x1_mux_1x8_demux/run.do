vlib work
vlog mux_demux.v
vsim tb
add wave -position insertpoint sim:/tb/dut/*
add wave -position insertpoint sim:/tb/dut1/*
run -all
