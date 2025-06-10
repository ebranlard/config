:: RUN THIS SCRIPT AS ADMIN
::
:: The script creates a link between the palettes stored in this repo and the ones in the Inscape installation folder
::

:: # C:/Program Files/Inkscape/share/palettes
:: # "C:\Program Files\Inkscape\share\inkscape\palettes\"
@echo off

:: Inkscape 1.1:
set PALDIR="C:\Bin\Inkscape\share\inkscape\palettes"
:: Inkscape 0.9
:: set PALDIR="C:\Bin\Inkscape\share\palettes"

copy *.gpl %PALDIR%

::# 1 Delete inscape palette diretory
:: rename %PALDIR% %PARDIR%_bkp

:: ::  2 create a softlink
:: cd ..
:: mklink /d %PALDIR% "C:\Config\look\Inkscape_palettes"

pause
