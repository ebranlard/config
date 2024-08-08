# NOTE: 
# - The icons of C:/Windows/System32/Shell32.dll or imageres.dll are located in 
#  C:/Windows\SystemRessources/shll32.dll.mun  
# You can unzip them with 7zip to figure out the icones number
 

assoc .=txtfile



OR:

Note: SystemRoot is C:/Windows typically

assoc .="No Extension"
ftype "No Extension"uC:\Bin\Vim\vim91\gvim.exe" "%1"
assoc "No Extension"\DefaultIcon=%SystemRoot%\System32\imageres.dll,-102

C:\Bin\Vim\vim91\gvim.exe

To Undo:

ftype "No_Extension"=
assoc "No_Extension"\DefaultIcon=
assoc .=

