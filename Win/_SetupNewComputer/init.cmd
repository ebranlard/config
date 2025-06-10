:: Register this with the following command:
:: reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun ^
::      /t REG_EXPAND_SZ /d "%"USERPROFILE"%\init.cmd" /f


@echo off 
@echo ">>>" Running init.cmd from C:/Users/ebranlar
@SET PATH=C:/Bin/msys64/mingw64/bin/;%PATH%
