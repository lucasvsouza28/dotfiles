#!/usr/bin/env bash

case $1 in
d)
	cliphist list | walker -d -l 2 -V 1 -p "select a entry to remove from clipboard" | cliphist delete
	;;

w)
	if [ $(echo -e "Clear\nCancel" | walker -d -p "Clear clipboard history?") == "Clear" ]; then
		cliphist wipe
	fi
	;;

*)
	cliphist list |
		walker -d -l 2 -V 1 -p "select a entry to paste" |
		tr -d '\n' |
		cliphist decode |
		wl-copy
	;;
esac
