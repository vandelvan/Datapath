transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH {C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH/MUX5.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH {C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH/CAND.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH {C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH/DATAPATH.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH {C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH/MUX1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH {C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH/pc.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH {C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH/add.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH {C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH/inst_mem.v}
vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH {C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH/registers.v}

vlog -vlog01compat -work work +incdir+C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH {C:/Users/Gustavo/Desktop/SegundoCUCEI/DATAPATH/DATAPATH_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxv_ver -L rtl_work -L work -voptargs="+acc"  DATAPATH_TB

add wave *
view structure
view signals
run -all
