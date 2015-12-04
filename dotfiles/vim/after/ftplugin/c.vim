" OmniCppComplete initialization
" call omni#cpp#complete#Init()


" Set a nicer foldtext function
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction

" 
" 
" function! CFoldLevel(lnum)
"   let line = getline(a:lnum)
"   if line =~ '^/\*'
"     return '>1' " A new fold of level 1 starts here.
"   else
"     return '1' " This line has a foldlevel of 1.
"   endif
" endfunction
" 
" function! CFoldText()
"   " Look through all of the folded text for the function signature.
"   let signature = ''
"   let i = v:foldstart
"   while signature == '' && i < v:foldend
"     let line = getline(i)
"     if line =~ '\w\+(.*)$'
"       let signature = line
"     endif 
"     let i = i + 1
"   endwhile
" 
"   " Return what the fold should show when folded.
"   return '+-- ' . (v:foldend - v:foldstart) . ' Lines: ' . signature . ' '
" endfunction
" 
" function! CFold()               
"   set foldenable
"   set foldlevel=0   
"   set foldmethod=expr
"   set foldexpr=CFoldLevel(v:lnum)
"   set foldtext=CFoldText()
"   set foldnestmax=1
" endfunction
" 

set foldtext=MyFoldText()
set foldnestmax=1
set foldlevel=0   
" set foldmethod=syntax   
set foldmethod=indent  " so that the nont indented stuff still have syntax highlight



" --------------------------------------------------------------------------------
" --- Aligns 
" --------------------------------------------------------------------------------
vmap ,ac :Align! =Ip1P1 // <CR>


