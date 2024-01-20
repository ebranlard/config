Conclusion:
The best is still to use the registry files.


# Main reg Adresses
[HKEY_CLASSES_ROOT\*\shell\YOURNAME]
[HKEY_CLASSES_ROOT\Directory\Background\shell\YOURNAME]
[HKEY_CLASSES_ROOT\Folder\shell\YOURNAME]

# FileTypes
Directory
CompressedFolders
Folders

# For graphical editing 
ContextEdit is quite good

# For the context menu to collect multiple files
use singleinstance.exe

# .reg files
 - To remove a reg entry put a "-" in front of the path
 - Blank lines are important between entries
 - They should be run as root
