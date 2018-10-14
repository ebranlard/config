function Prompt
{
    $currentDirectory = $(Get-Location)
    #write-host "$Env:username" -NoNewline -ForegroundColor Yellow
    #write-host "@" -NoNewline -ForegroundColor Green
    #write-host "PS:" -NoNewline -ForegroundColor Yellow
    write-host "$(Convert-Path $currentDirectory)" -NoNewline -ForegroundColor Green
    write-host " >" -NoNewline -ForegroundColor White
    return " "
}

function lg {
   git status $args
}

Set-Alias la dir
