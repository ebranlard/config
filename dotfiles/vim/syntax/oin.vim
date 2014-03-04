" Vim syntax file
" Language: Omnivor input file
" Maintainer: Emmanuel Branlard
" Latest Revision: December 2012
" Installation:
" - Put this file in ~./vim/syntax/
" - Either: 
"   -  Create/edit the file ~./vim/filetype.vim  with the following content:
"        if exists("did_load_filetypes")
"          finish
"        endif
"        augroup filetypedetect
"          au! BufNewFile,BufRead *.htc setf htc
"        augroup END
"  - or but the au command in ftdetect/something.vim 


if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword oKeyword Wind Environment CommonData Algo Param Coupling Field

syn keyword oIdentifier b3D bBuildMatrix bComputeGrad bConvertToPart bDistortPart bExport bForceOneInfiniteWakePanel bForceWakePanelAlongU0 bGridVelocity bHybridWake bNoRollUp tRollUpStart bPlaceConcentratedShedVorticity bPlotGeometry bPlots bPrescribedGamma bProfilesData bRemoveFarWake bNoShedding bViscousDiffusion bViscousBoundaries EmissionMethod HGridnx HGridny HGridnz HGridPbur HGridPtll IprescribedIntensities nTGridVelocity pNumericalScheme pDiffusionScheme PanlSmooth PartSmooth SgmtSmooth Model Param1 Param2 ParamMethod PrescribedIntensities ProfileSolving crit MaxIter relax RelSizeNWPanel SmoothAlpha tConvertToPart pConvertToPart tHybridEnd tHybridStart tRemoveFarWake UGridnx UGridny UGridnz UGridPbur UGridPtll bProfiles2PiAlpha bProfiles2PiSinAlpha bHawcWind bProfilesNoInduction bNoShedding bExportPlotVtk bExportPlotBin bExportPlotVtkBin bExportLoads nTExportPlot nTExportLoads bProfilesAlphaSmooth  bProfilesNoInduction  bProfilesAlphaSmooth bRemoveZeroVorticity

syn keyword oIdentifier bTIMING bDEBUGMIN bSTOP_ALLOWED prefix sim_folder nExportStates bExportStates bMemoryAnalyser bMemorySaver bTimeEstimator bSILENT_WARN bSILENT_ERROR bSILENT_INFO bExportConverged bConstantUiExternalPerStep state_file bExportPlot bExportLoads pExportPlotFormat pExportVelocityFormat nTExportPlot nTExportLoads  nExportPlot nExportLoads
syn keyword oIdentifier pVortexSplittingScheme bVortexSplitting VortexSplittingParam1 VortexSplittingParam2

syn keyword oIdentifier bHybridWake HGrid_n1 HGrid_n2 HGrid_n3 HGrid_l1 HGrid_l2 HGrid_l3 HGrid_PO_g HGrid_e1_g HGrid_e2_g  HGrid_tStart  HGrid_tEnd
syn keyword oIdentifier bMGrid MGrid_bComputeGrad nTMGrid nMGrid MGrid_n1 MGrid_n2 MGrid_n3 MGrid_l1 MGrid_l2 MGrid_l3 MGrid_PO_g MGrid_e1_g MGrid_e2_g 
syn keyword oIdentifier bUGrid1 UGrid1_bComputeGrad nTUGrid1 nUGrid1 UGrid1_n1 UGrid1_n2 UGrid1_n3 UGrid1_l1 UGrid1_l2 UGrid1_l3 UGrid1_PO_g UGrid1_e1_g UGrid1_e2_g  UGrid1_bPolar 
syn keyword oIdentifier bUGrid2 UGrid2_bComputeGrad nTUGrid2 nUGrid2 UGrid2_n1 UGrid2_n2 UGrid2_n3 UGrid2_l1 UGrid2_l2 UGrid2_l3 UGrid2_PO_g UGrid2_e1_g UGrid2_e2_g  UGrid2_bPolar 
syn keyword oIdentifier Field_bComputeGrad Field_bPolar Field_e1_g Field_e1_g Field_PO_g Field_n1 Field_n1 Field_n3 Field_l1 Field_l1 Field_l3 Field_pType Field_v1_g Field_v1_g Field_v3_g 

syn keyword oIdentifier nu V0 Model 
syn keyword oIdentifier bTurb_box Turb_box_file_u Turb_box_file_v Turb_box_file_w Turb_box_n1 Turb_box_n2 Turb_box_n3 Turb_box_d1 Turb_box_d2 Turb_box_d3 Turb_box_e1_g Turb_box_e2_g Turb_box_P1_g Turb_box_P2_g 

syn keyword oIdentifier KinVisc rho rho_water

syn keyword oIdentifier dt tmax bDEBUG

syn keyword oIdentifier pCoupling bWall bNacelle bOtherTurbine

" syn keyword celTodo contained TODO FIXME XXX NOTE HACK
syn keyword oTodo TODO FIXME XXX NOTE HACK
syn keyword oBool true false T F

" syn match oParam '^[\ a-zA-Z0-9]*'
syn match oComment "!.*$" contains=hTodo


" syn match EmptyLines /^$/
" syn match EmptyLines /^\s*$/ 

" Regular int like number with - + or nothing in front
syn match oNumber '\d\+' 
" Regular int like number with - + or nothing in front
syn match oNumber '[-+]\d\+' 
" Floating point number with decimal no E or e (+,-)
syn match oNumber '[-+]\d\+\.\d*' 
" Floating point like number with E and no decimal point (+,-)
syn match oNumber '[-+\ ]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
" Floating point like number with E and decimal point (+,-)
syn match oNumber '[-+\ ]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

" syn region celString start='"' end='"' contained
" syn region all start='\&' end='\/' contains=oString oKeyword
syn region oString start='\'' end='\''  


syn match oEqual '[=]'


let b:current_syntax = "oin"

hi def link oTodo        Todo
hi def link oComment     Comment
hi def link oKeyword     Preproc
hi def link oIdentifier  Type
hi def link oEqual  Statement
hi def link oNumber      Number
hi def link oBool      Number
hi def link oString      String
" hi def link all  Constant
