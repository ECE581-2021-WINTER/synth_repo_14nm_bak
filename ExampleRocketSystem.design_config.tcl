set lib_dir /pkgs/synopsys/2020/saed14nm

# Decoder ring for the libraries
# You will need to follow another example or look in the library directories to understand.

# lib_types is used for the dc/dct linking variables and ICC2 NDM lcoations.
# /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm
# /          $lib_dir                   /lib/ $lib_type /db_nldm

# link_library, Target_library use the sub_lib_types and corner variables. 
# For sub_lib_types and corner:
# Example:
#     saed32hvt_ss0p75v125c.db
#     |sub_lib  corner    .db
# The current flow tries to find all sub_lib and all corners in all the search paths.  Any match will be put in the library list.
# Wild cards can be used, but be careful.  Multiple matches can occur in ways you don't want.

# For the target library, the same method is used as the link library except only HVT and RVT lib_types are used.

# ICC2 NDM choosing also uses the sub_lib_types so that only the required libraries and extras are not loaded.

# Risc V
set top_design ExampleRocketSystem
set add_ios 0
set pad_design 0
set design_size { 1850 1380  } 
set design_io_border 10
set dc_floorplanning 1
set rtl_list [list ../rtl/$top_design.sv ]
set slow_corner "ss0p72v125c  "
set fast_corner "ff0p88v125c  "
set synth_corners $slow_corner
set enable_dft 0
set slow_metal Cmax_125
set fast_metal Cmax_125
set lib_types "$lib_dir/stdcell_hvt/db_nldm $lib_dir/stdcell_rvt/db_nldm $lib_dir/stdcell_lvt/db_nldm \
$lib_dir/SAED14nm_EDK_IO_v_06052019/SAED14_EDK/lib/io_std/db_nldm \
$lib_dir/SAED14nm_EDK_SRAM_v_05072020/lib/sram/logic_synth/dual \
/u/bcruik2/14nm_lib/sram_1rw \
$lib_dir/SAED14nm_EDK_PLL_v_06052019/SAED14_EDK/lib/pll/logic_synth"
set sub_lib_type "saed14?vt_ saed14sram_ saed14sram_1rw_"

set ndm_types {$lib_dir/stdcell_hvt/ndm/saed14hvt_frame_only.ndm 
$lib_dir/stdcell_rvt/ndm/saed14rvt_frame_only.ndm
$lib_dir/stdcell_lvt/ndm/saed14lvt_frame_only.ndm
$lib_dir/SAED14nm_EDK_SRAM_v_05072020/lib/sram/ndm/saed14_sram_1rw_frame_only.ndm
$lib_dir/SAED14nm_EDK_SRAM_v_05072020/lib/sram/ndm/saed14_sram_2rw_frame_only.ndm}
set sub_ndm_type "*.ndm"

set lef_types {$lib_dir/stdcell_hvt/lef 
$lib_dir/stdcell_rvt/lef
$lib_dir/stdcell_lvt/lef
$lib_dir/saed14nm/SAED14nm_EDK_SRAM_v_05072020/lib/sram/lef/
}
set sub_lef_type "saed14nm_?vt_*.lef saed14_sram_*.lef saed14io_std_wb saed14_PLL.lef"

set mwlib_types {$lib_dir/stdcell_hvt/milkyway 
$lib_dir/stdcell_rvt/milkyway 
$lib_dir/stdcell_lvt/milkyway  
}
set sub_mwlib_type "saed14nm_?vt_* saed14sram_* saed14io_wb_* saed14pll_*"

#set topdir /u/$env(USER)/PSU_RTL2GDS
set topdir [ lindex [ regexp -inline "(.*)\(syn\|pt\|apr\)" [pwd] ] 1 ]

