" Vim syntax file
" Language: hawc2 input file
" Maintainer: E. Branlard
" Latest Revision: December 2012 
" Installation:
" - First, the file htc.vim should be put in the directory BASE_PATH/syntax/ where
"   BASE_PATH is a directory that Vim searches for. To know which directories
"   Vim is searching for, you can type :help runtimepath within Vim, and look
"   at the content of the $HOME and $VIM variables by typing :echo $HOME.
"   Typical values would be:
"         Windows:  BASE_PATH="C:/Documents and Settings/USERNAME/vimfiles/"
"         Unix:     BASE_PATH="~/.vim/"
"   The file htc.vim should then be placed in (you might need to create this directory)
"         Windows: "C:/Documents and Settings/USERNAME/vimfiles/syntax/"
"         Unix:     "~/.vim/syntax/"
"
" - Then, either: 
"    - Create/edit the file ftdetect/custom.vim and add the following content:
"             au! BufNewFile,BufRead *.htc setf htc
"    - Or Create/edit the file BASE_PATH/filetype.vim  with the following content:
"             if exists("did_load_filetypes")
"               finish
"             endif
"             augroup filetypedetect
"               au! BufNewFile,BufRead *.htc setf htc
"             augroup END


if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword hKeyword begin end nextgroup=hIdentifier
" syn keyword hIdentifier aero simulation wind dll output mann aerodrag aerodrag_element tower_shadom_potential newmark actions hawc_dll c2_def blade_c2_def structure timoschenko_input main_body orientation base relative constraint bearing1 bearing2 fix1 fix2 
syn keyword hIdentifier simulation new_htc_structure main_body orientation wind output aero blade_c2_def dll aerodrag hydro soil force exit
syn keyword hIdentifier newmark main_body orientation constraint hawc_dll output actions mann flex wakes tower_shadow_potential tower_shadow_jet tower_shadow_potential_2 tower_shadow_jet_2 turb_export dynstall_so dynstall_mhh actions dynstall_mhhmagf bemwake_method nearwake_method aerodrag_element water_properties hydro_element soil_element dll
syn keyword hIdentifier timoschenko_input c2_def base relative fix0 fix1 fix2 fix3 fix4 bearing1 bearing2 bearing3 bearing4
syn keyword hIdentifier body body_eulerang body_axisangle body1 body2 body2_eulerang body2_eulerpar body2_axisangle body2_ini_rotvec_d1 a1 a2 ae_filename ae_sets aerocalc_method aero_distribution aerodrag_sections aerosections ais alfs alrund animation arraysizes axial_norm b1 b2 beam_output_file_name bearing_vector beta bis ble_parameters body_eigenanalysis_file_name body_eulerpar body_name body_output_file_name box_dim_u box_dim_v box_dim_w buffer buoyancy center_pos0 concentrated_mass constraint_output_file_name convergence_limits copy_main_body create_turb_parameters current damping damping_k_factor damping_posdef data_format datafile dclda dcldas deltat density dll dll_subroutine dont_scale dump_coef_filename dynstall_method estimate_exp fdydxle filename filename_u filename_v filename_w flap gamma gdydxle gravity gyle hdydx horizontal_input hub_vec hy hydrosections iec_gust indicial_weight_function induction_method induction_scale inipos init_string limit_exp_error link logfile max_exp_order max_indicials max_iterations mbdy mbdy_axisangle mbdy_eulerang mbdy_name mbdy1 mbdy2 mbdy2_axisangle mbdy2_eulerang mbdy2_eulerpar mbdy2_ini_rotvec_d1 microturb_factors min_exp_order mudlevel mwl name nblade_corr nblades nbodies node node_distribution nsec nsource omegas on_no_convergence only_potential_model op_data pc_filename perform_gamma_filter Prescribedfile radius rho scale_nw scale_time_start sec set shear_format soilsections solver_relax solvertype source_pos std_scaling structure_eigenanalysis_file_name symmetry tau_r_poly taubly taufak taupre ti1 ti2 ti3 ti4 ti5 ti6 ti7 ti8 ti9 time time_stop tint tint_meander tiploss_method tower_mbdy_link tower_offset tower_shadow_method turb_format type update update_kinematics update_states use_local_dt use_original_induction user_defined_shear user_defined_shear_turbulence water_kinematics_dll wave_direction wind_ramp_abs wind_ramp_factor windfield_rotations write_ct_cq_file write_final_deficits 







" syn keyword celTodo contained TODO FIXME XXX NOTE HACK
syn keyword hTodo TODO FIXME XXX NOTE HACK
syn match hComment ";.*$" contains=hTodo

syn match EmptyLines /^$/
syn match EmptyLines /^\s*$/ 

" Regular int like number with space or tab in front
syn match hNumber '[\t\ ]\d\+' 
" Regular int like number with - + or nothing in front
syn match hNumber '[-+\ ]\d\+' 
" Floating point number with decimal no E or e (+,-)
syn match hNumber '[-+\ ]\d\+\.\d*' 
" Floating point like number with E and no decimal point (+,-)
syn match hNumber '[-+\ ]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
" Floating point like number with E and decimal point (+,-)
syn match hNumber '[-+\ ]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

" syn region celString start='"' end='"' contained
syn region masterReplace start='\[' end='\]'
syn region hString start='./' end=';'  contains=masterReplace



let b:current_syntax = "htc"

hi def link hTodo        Todo
hi def link hComment     Comment
hi def link hKeyword     Keyword
hi def link hIdentifier  Identifier
hi def link hString      String
hi def link masterReplace  Constant
hi def link hNumber      Number
hi def link EmptyLines  Error
