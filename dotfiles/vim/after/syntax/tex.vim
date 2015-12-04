" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
setlocal iskeyword+=:,\



" syn region texRefZone		matchgroup=texStatement start="\\\(page\|eq\)ref{"	end="}\|%stopzone\>"	contains=@texRefGroup
syn region texRefZone		matchgroup=texStatement start="\\autoref{"	end="}\|%stopzone\>"	contains=@texRefGroup
syn region texRefZone		matchgroup=texStatement start="\\imagetex{"	end="}\|%stopzone\>"	contains=@texRefGroup
syn region texRefZone		matchgroup=texStatement start="\\import{"	end="}\|%stopzone\>"	contains=@texRefGroup
" syn region texRefZone		matchgroup=texStatement start="\\v\=ref{"		end="}\|%stopzone\>"	contains=@texRefGroup
" syn region texRefZone		matchgroup=texStatement start="\\v\=autoref{"		end="}\|%stopzone\>"	contains=@texRefGroup


