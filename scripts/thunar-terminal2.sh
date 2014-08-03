#!/bin/bash
ActiveWinID=20971524
## Get thunar pathbar
xdotool key --window "$ActiveWinID" --clearmodifiers "Ctrl+l"

## Select all
#         xdotool key --window "$ActiveWinID" --clearmodifiers "Ctrl+a"

## Save old clipboard value
OldClip=$(xclip -o)

## Copy thunar directory path to clipboard
ActiveWinID2=$(xdotool getactivewindow)
xdotool key --window "$ActiveWinID" --clearmodifiers "Ctrl+c"

## Copy the path to variable
Location=$(xclip -o)
echo "Location: $Location"

## Should remove the pathbar if selected
xdotool key --window "$ActiveWinID" --clearmodifiers "Return"
#         xdotool search --name "Open Location" windowkill


## Restore old clipboad value
echo "$OldClip" | xclip -i

## If connected to remote server, grab user name and server
# User_Server=$(echo "$Location" | sed 's/\//\n/g' | grep '@' \
#     | cut -d: -f1)
# 
# if [ -z "$User_Server" ];then
#     ## Open terminal in location
#     xfce4-terminal --working-directory="$Location" &
#     PID=$(echo "$!")
# else
#     WorkingDir="$(echo "$Location" | sed 's/^.*@//' \
#         | sed 's/::/\//' | sed 's/:/\//g' \
#         | sed 's/\//@/' \
#         | sed 's/^.*@/\//' | sed 's/ /\\ /g')"
#     xfce4-terminal -x ssh -tX "$User_Server" "cd ${WorkingDir} 2>/dev/null; bash" &
#     PID=$(echo "$!")
# fi
# 
## Wait before searching for the latest window
# sleep 0.5s
# XtermID=$(xdotool search --pid "$PID" --class "Xfce4-terminal" \
#     | tail -n 1)

## Activate latest window
# xdotool windowactivate "$XtermID"

# xfce4-terminal --working-directory="$Location" &
# echo "Thunar window was not active. Aborting."
# exit 1

