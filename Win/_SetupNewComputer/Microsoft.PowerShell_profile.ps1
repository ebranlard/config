
## ---  Aliases
function lg {
   git status $args
}

function pydat {
    C:\Users\ebranlar\AppData\Local\pyDatView\Python\pythonw.exe "C:\Users\ebranlar\AppData\Local\pyDatView\pyDatView.launch.pyw" $args
}



Set-Alias la dir
Set-Alias mkae make
Set-Alias gti git
Set-Alias pyton python
Set-Alias py python

function listpath {$Env:Path -split ';'}

Set-Alias -Name path -Value listpath


function eagle {
    echo "Running: ssh -m hmac-sha2-512 ebranlar@eagle.hpc.nrel.gov $args"
    ssh -m hmac-sha2-512 ebranlar@eagle.hpc.nrel.gov $args
}

function myscp {
    echo "NOTE: scp -o MACs=hmac-sha2-512 ebranlar@eagle.hpc.nrel.gov:SRC DEST"
    scp "-o MACs=hmac-sha2-512" $args
}


function gap {
    git commit --amend --no-edit; git push --force
}



## --- Add to system path
# $pathToPortableGit = "D:\shared_tools\tools\PortableGit"
# $scripts = "D:\shared_tools\scripts"
# Add Git executables to the mix.
# [System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";" + (Join-Path $pathToPortableGit "\bin") + ";" + $scripts, "Process")
# [System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";" + (Join-Path $pathToPortableGit "\bin") + ";" + $scripts, "Process")

$myPath = "C:\Bin\msys64\mingw64\bin"
[System.Environment]::SetEnvironmentVariable("PATH", $myPath + ";" + $Env:Path, "Process")

$myPath = "C:\Bin\UnxUtils\usr\local\wbin\"
[System.Environment]::SetEnvironmentVariable("PATH", $myPath + ";" + $Env:Path, "Process")


[System.Environment]::SetEnvironmentVariable("HOMEDRIVE", "C:/", "Process")
[System.Environment]::SetEnvironmentVariable("HOMEPATH", "Config/dotfiles", "Process")

# Setup Home so that Git doesn't freak out.
[System.Environment]::SetEnvironmentVariable("HOME", (Join-Path $Env:HomeDrive $Env:HomePath), "Process")

$Global:CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$UserType = "User"
$CurrentUser.Groups | foreach { 
    if ($_.value -eq "S-1-5-32-544") {
        $UserType = "Admin" } 
    }

function MyPrompt
{
    write-host "$(Convert-Path $(Get-Location))" -NoNewline -ForegroundColor Green
    write-host "" -ForegroundColor White
    write-host "$" -NoNewLine -ForegroundColor White
    return " "
}

function Prompt {
    $status_string = ""
    $branch = ""
    Write-Host ""

    # --- Git status
    if (Get-Command git -ErrorAction SilentlyContinue) {
        try {
            $symbolicref = git symbolic-ref HEAD 2>$null
            if ($symbolicref) {
                $branch = "[" + $symbolicref.Substring($symbolicref.LastIndexOf("/") + 1) + "]"
                $differences = git status --porcelain 2>$null

                if ($differences) {
                    $git_update_count    = [regex]::matches($differences, "^ M ").count
                    $git_create_count    = [regex]::matches($differences, "^A ").count
                    $git_delete_count    = [regex]::matches($differences, "^D ").count
                    $git_untracked_count = [regex]::matches($differences, "^\?\? ").count

                    if ($git_update_count -gt 0)    { $status_string += " ~$git_update_count" }
                    if ($git_create_count -gt 0)    { $status_string += " +$git_create_count" }
                    if ($git_delete_count -gt 0)    { $status_string += " -$git_delete_count" }
                    if ($git_untracked_count -gt 0) { $status_string += " ?$git_untracked_count" }
                }

                Write-Host $branch -NoNewline -ForegroundColor Yellow
                Write-Host $status_string -NoNewline -ForegroundColor Red
                Write-Host " | " -NoNewline -ForegroundColor White
            }
        } catch {
            # Ignore git errors silently
        }
    }

    # --- Path and prompt symbol
    Write-Host "$(Convert-Path $(Get-Location))" -NoNewline -ForegroundColor Green
    Write-Host "" -ForegroundColor White
    Write-Host "$" -NoNewline -ForegroundColor White
    return " "
}
