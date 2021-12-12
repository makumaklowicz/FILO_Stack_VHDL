
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name FILO_Stack_VHDL -dir "C:/Users/miste/Desktop/VHDL/FILO_Stack_VHDL/planAhead_run_3" -part xc7a100tcsg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Memory.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Memory.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top Memory $srcset
add_files [list {Memory.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc7a100tcsg324-3
