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

syn keyword oIdentifier nDim bBuildMatrix bComputeGrad bConvertToPart bDistortPart bForceOneInfiniteWakePanel bForceWakePanelAlongmX bForceWakePanelAlongU0 bGridVelocity bHybridWake bNoRollUp tRollUpStart bPlaceConcentratedShedVorticity bPlotGeometry bPlots bPrescribedGamma bProfilesData bRemoveFarWake bNoShedding bViscousBoundaries EmissionMethod IprescribedIntensities nTGridVelocity pNumericalScheme PanlSmooth PartSmooth SgmtSmooth Model Param1 Param2 ParamMethod PrescribedIntensities ProfileSolving pSolverMatrixMethod bNWCPatTE crit MaxIter relax RelSizeNWPanel tConvertToPart pConvertToPart tRemoveFarWake bHawcWind bProfilesNoInduction bNoShedding bProfilesAlphaSmooth bProfilesNoInduction  bProfilesAlphaSmooth bRemoveZeroVorticity

syn keyword oIdentifier bExportPlot bExportLoads pExportPlotFormat pExportVelocityFormat nTExportPlot nTExportLoads nExportPlot bExportLoads  nExportLoads bExportPlotLight bExportPlotBodiesOnly bExportConverged 

syn keyword oIdentifier bTIMING bDEBUGMIN bSTOP_ALLOWED prefix sim_folder nExportStates bExportStates bMemoryAnalyser bMemorySaver bTimeEstimator bSILENT_WARN bSILENT_ERROR bSILENT_INFO bConstantUiExternalPerStep state_file bSmartTicToc SmartTicTocVal

syn keyword oIdentifier pVortexSplittingScheme bVortexSplitting VortexSplittingParam1 VortexSplittingParam2

syn keyword oIdentifier nTConvertToPart bReduceSegments tReduceSegments nTReduceSegments

syn keyword oIdentifier bProfiles2PiAlpha bProfiles2PiSinAlpha

" UI related
syn keyword oIdentifier pTree_k_factor pTree_small_branch

" Grid related Inputs
syn keyword oIdentifier pMG pRM pHW pU1 pU2 pField AI GI PE nx ny nz vx ny nz Scaling bScaling

" Box and Domains
syn keyword oIdentifier MainDomain ConvectionDomain Box rangeX rangeY rangeZ

" Diffusion
syn keyword oIdentifier bDiffusion pDiffusion Scheme SchemeSgmt pPSE pCoreSpread delta t0 max_radius

" Grid Inputs
syn keyword oIdentifier n1 n2 n3 l1 l2 l3 filename PO_g e1_g e2_g e3_g range1 range2 range3 range1_high range2_high range3_high h_high bPolar

" ActionTimeInfo
syn keyword oIdentifier bActive n nT tStart tEnd

syn keyword oIdentifier pCoupling SmoothBEM bUseBEM

syn keyword oIdentifier nu V0 Model 
syn keyword oIdentifier bTurb_box Turb_box_file_u Turb_box_file_v Turb_box_file_w Turb_box_n1 Turb_box_n2 Turb_box_n3 Turb_box_d1 Turb_box_d2 Turb_box_d3 Turb_box_e1_g Turb_box_e2_g Turb_box_P1_g Turb_box_P2_g  TurbPart basename file_format 

syn keyword oIdentifier KinVisc rho rho_water min_scale max_scale typical_scale ShearLayerHeight

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
