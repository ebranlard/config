
Write-Host "Getting user path"

# Get current user PATH
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")

# Paths to add
$newPaths = @(
    "C:/Bin"
    "C:/Bin/Vim/vim91"
    "C:/Bin/Python/Python313/"
    "C:/Bin/Python/Python313/Scripts/"
    "C:/Bin/msys64\mingw64\bin"
    "C:/Bin/SumatraPDF"
    "C:/Bin/MiKTeX/miktex/bin/x64/"
    "C:/Bin/UnxUtils/user/local/wbin"
    "C:/Bin/Inkskape/bin"
    "C:/Bin/Strawberry/c/bin"
    "C:/Bin/Strawberry/perl/bin"
    "C:/Bin/Strawberry/perl/site/bin"
)
# Replace forward slashes with backslashes
$newPaths = $newPaths | ForEach-Object { $_ -replace '/', '\' }

# Split current PATH into array, remove empty entries, trim spaces
$paths = $userPath -split ';' | Where-Object { $_ -ne "" } | ForEach-Object { $_.Trim() }

# Combine existing paths with new ones (append)
$combinedPaths = $paths + $newPaths

# Remove duplicates but keep original order
$uniquePaths = $combinedPaths | 
    ForEach-Object { $_ } | 
    Select-Object -Unique

# Join back into string
$newPath = $uniquePaths -join ';'

# Set updated PATH as new user PATH
[Environment]::SetEnvironmentVariable("Path", $newPath, "User")

Write-Host "User PATH updated with new entries and duplicates removed."

# Open Environment Variables GUI
Start-Process "rundll32.exe" -ArgumentList "sysdm.cpl,EditEnvironmentVariables"

#Start-Process "SystemPropertiesAdvanced.exe"

