au! BufNewFile,BufRead *.htc,*.orient,*.constr,*.mbdy,*.setup setf htc
au! BufNewFile,BufRead *.oin setf oin
au! BufNewFile,BufRead *.cu  setf c


au! BufNewFile,BufRead *.fst setf fast
au! BufNewFile,BufRead *.fstf setf fast
au! BufNewFile,BufRead *.ffst setf fast
au! BufNewFile,BufRead *.fmas setf fast
au! BufNewFile,BufRead *.dvr setf fast
au! BufNewFile,BufRead *.dat setf fast
au! BufNewFile,BufRead *.sum setf fast
au! BufNewFile,BufRead *.inp setf fast
au! BufNewFile,BufRead *.viz setf fast

au! BufNewFile,BufRead *.inf setf master
au! BufNewFile,BufRead *.mas setf master
au! BufNewFile,BufRead *.bld setf deflex_basic
au! BufNewFile,BufRead *.brk setf deflex_basic
au! BufNewFile,BufRead *.con setf deflex_basic
au! BufNewFile,BufRead *.fnd setf deflex_basic
au! BufNewFile,BufRead *.gen setf deflex_basic
au! BufNewFile,BufRead *.pit setf deflex_basic
au! BufNewFile,BufRead *.twr setf deflex_basic
au! BufNewFile,BufRead *.yaw setf deflex_basic
au! BufNewFile,BufRead *.out setf out


au! BufNewFile,BufRead *.md  setf markdown

" --- pascal_fpc is set in ftplugin/after
"      pascal_delphi could be set alternatively

" Pascal / pascal
au BufNewFile,BufRead *.pas,*.PAS set ft=pascal
" 
" pascal project file
au BufNewFile,BufRead *.dpr,*.DPR set ft=pascal
au BufNewFile,BufRead *.lpr,*.LPR set ft=pascal
au BufNewFile,BufRead *.lpi,*.LPI set ft=pascal
" pascal form file
au BufNewFile,BufRead *.dfm,*.DFM set ft=pascal
au BufNewFile,BufRead *.xfm,*.XFM set ft=pascal
" pascal package file
au BufNewFile,BufRead *.dpk,*.DPK set ft=pascal
" pascal .DOF file = INI file for MSDOS
au BufNewFile,BufRead *.dof,*.DOF set ft=dosini
au BufNewFile,BufRead *.kof,*.KOF set ft=dosini
au BufNewFile,BufRead *.dsk,*.DSK set ft=dosini
au BufNewFile,BufRead *.desk,*.DESK set ft=dosini
au BufNewFile,BufRead *.dti,*.DTI set ft=dosini
" pascal .BPG = Makefile
au BufNewFile,BufRead *.bpg,*.BPG set ft=make|setlocal makeprg=make\ -f\ % 
