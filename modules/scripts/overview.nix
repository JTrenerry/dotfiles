{ pkgs }:

pkgs.writeScriptBin "overview" ''
  #!${pkgs.bash}/bin/bash

  while read overviewOpened; do
    if [[ $overviewOpened == 'true' ]]; then
      waybar & disown
    else
      pkill -xf waybar
    fi
  done < <(niri msg -j event-stream | jq --unbuffered -r '.OverviewOpenedOrClosed | select(. != null) | .is_open')
''
