

For PowerShell prompt customization see files in this folder


# For CMD.exe command prompt customization:
https://stackoverflow.com/questions/12028372/how-do-i-change-the-command-line-prompt-in-windows

For colors:
https://ss64.com/nt/syntax-ansi.html

- Set a system variable named PROMPT

    By DeFault:
    PROMPT=$P$G


- or from the commandline (set environental variable pernatenly using setx instead of set)
setx PROMPT <FORMAT>

- or temporarily using the prompt command
    https://ss64.com/nt/prompt.html
prompt <FORMAT>

FORMAT: 
   $E Escape code  (ASCII code 27) 
   $G  >           (greater-than sign) 
   $S              (space) 
   $B |            (vertical pipe) 
   $_  Carriage return and linefeed 
   $$  $           (dollar sign)
COLORS:                        FOREGROUND  BACKGROUND
    Black                        $E[30m   $E[40m  
    Red                          $E[31m   $E[41m  
    Green                        $E[32m   $E[42m  
    Yellow                       $E[33m   $E[43m  
    Blue                         $E[34m   $E[44m  
    Magenta                      $E[35m   $E[45m  
    Cyan                         $E[36m   $E[46m  
    Light gray                   $E[37m   $E[47m  
    Dark gray                    $E[90m   $E[100m 
    Light red                    $E[91m   $E[101m 
    Light green                  $E[92m   $E[102m 
    Light yellow                 $E[93m   $E[103m 
    Light blue                   $E[94m   $E[104m 
    Light magenta                $E[95m   $E[105m 
    Light cyan                   $E[96m   $E[106m 
    White                        $E[97m   $E[107m 
    Bold                         $E[1m
    Underline                    $E[4m
    No underline                 $E[24m
    Reverse text                 $E[7m
    Positive text (not reversed) $E[27m




MANU:
    prompt $B$S$P$_CMD$G$S

MANU WITH COLORS:
    prompt $e[32m$P$e[97m$_CMD$G$S


Linux like:
    prompt $p$_%username%@%computername%:.
