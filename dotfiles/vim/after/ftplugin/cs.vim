
" 
" Error format for Mono compiler
set efm=%f(%l\,%c):\ error\ %m
" 
" 
" 
" NOTE: Code below is to test!!!!
" cgetexpr [
"         \ 'MAKE Version 5.2  Copyright (c) 1987, 2000 Borland',
"         \ '	mcs JobWriterMain.cs TicToc.cs /r:System.Windows.Forms.dll',
"         \ 'JobWriterMain.cs(103,31): error CS0246: The type or namespace name  could not be found. Are you missing an assembly reference?',
"         \ 'JobWriterMain.cs(112,12): error CS0841: A local variable `CoreFiles cannot be used before it is declared',
"         \ 'Compilation failed: 2 error(s), 0 warnings',
"         \ '** error 1 ** deleting JobWriterMain.exe'
"     \ ]
" 
" echomsg string(map(getqflist(), '[v:val.text, v:val.valid]'))
" echomsg string(getqflist())
" copen
" wincmd p

