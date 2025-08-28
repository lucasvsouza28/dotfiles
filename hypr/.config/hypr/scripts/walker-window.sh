#!/bin/bash

selected=$(
	hyprctl clients -j |
		jq -r '.[] | "\(.address)\t\(.title) (at workspace \(.workspace.id))"' |
		walker -d -p "go to window..." -l 2 -V 1
)

if [[ -n "$selected" ]]; then
	echo "selected window address: $selected"
	hyprctl dispatch focuswindow "address:$selected"
fi
