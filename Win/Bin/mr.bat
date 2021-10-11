:: Calls a command in multiple git repository.
::

@echo off
set CMD=%~1

if "%CMD%" == "" (
    call :help
    pause
    exit 
)

call :mrme "C:/Config/" 
call :mrme "C:/Config/path/MatlabPath/"
call :mrme "C:/Config/dotfiles/vim/bundle/vim-matlab-behave/"
call :mrme "C:/Config/dotfiles/vim/bundle/vim-simple-comment/"
call :mrme "C:/Config/dotfiles/vim/bundle/vim-simple-compile/"
call :mrme "C:/Work/_libs/pyDatView/"
call :mrme "C:/Work/_libs/pybra/"
call :mrme "C:/Work/_libs/wtlib/"
call :mrme "C:/Work/_libs/weBEM/"

goto :eof

:mrme
echo ---------------------------------- %~1 
cd %1
git %CMD% 
goto :eof


:help
echo usage: mr CMD
echo.
echo CMD: a git command, e.g. status 
echo.
echo.
