#!/usr/bin/env zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Run Shell Command
# @raycast.description Run an arbitrary zsh command and return its output.
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 📺

# Documentation:
# @raycast.author Paolo Centomani
# @raycast.authorURL https://noveria.it

# @raycast.packageName Zsh Command
# @raycast.argument1 { "type": "text", "placeholder": "Command (Default: open Warp)", "optional": true }
# @raycast.argument2 { "type": "text", "placeholder": "Directory (Default: Finder)", "optional": true }

cmd="$1"
dir="${2/#\~/$HOME}"

source ~/.zshrc

# Parse directory
if [ -z "$dir" ] ; then
	finder_dir=$( osascript -e "tell application \"Finder\"" -e "if exists window 1 then" -e "set pathList to (POSIX path of (folder of the front window as alias))" -e "pathList" -e "end if" -e "end tell" )
	if [ -z "$finder_dir" ] ; then
		dir="${HOME}"
	else
		dir="$finder_dir"
	fi
fi

# Action
if [ -z "$cmd" ] ; then
	open -a Warp.app "$dir"
else
	TERM="linux" ; export TERM
	cd "$dir"
	eval "$cmd"
	cd "$OLDPWD"
fi
