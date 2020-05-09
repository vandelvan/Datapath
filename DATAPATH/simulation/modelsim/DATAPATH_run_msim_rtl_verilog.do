transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/MUX5.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/CAND.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/DATAPATH.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/MUX1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/MUX2.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/SIGNEXT.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/UC.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/MUX3.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/pc.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/add.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/inst_mem.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/registers.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/alucontrol.v}

vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Datapath/DATAPATH {C:/Users/Gustavo/Datapath/DATAPATH/DATAPATH_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxv_ver -L rtl_work -L work -voptargs="+acc"  DATAPATH_TB

add wave *
view structure
view signals
run -all
