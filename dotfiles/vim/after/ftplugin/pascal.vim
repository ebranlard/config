setlocal shiftwidth=2
compiler fpc
let b:SingleFileCompiler = 'fpc -g %'
let g:pascal_fpc= '1'


" --------------------------------------------------------------------------------
" --- Align 
" --------------------------------------------------------------------------------
vmap ,ad :Align! =Ip1P1 :: !<<CR>     
vmap ,av :Align! =Ip1P1 :: !<CR>     
vmap ,ac :Align! =Ip1P1 !<CR>
vmap ,ai :Align! =Ip1P0 in\ '<CR>
" vmap ,a= :Align! :=Ip1P1<CR>
vmap ,ae ,a= gv ,a; gv ,ac
