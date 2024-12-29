#!/usr/bin/env zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Count Characters
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔢
# @raycast.argument1 { "type": "text", "placeholder": "Text (Default: clipboard)", "optional": true }

# Documentation:
# @raycast.description Counts the characters of either the clipboard or the passed argument.
# @raycast.author Paolo Centomani
# @raycast.authorURL https://noveria.it

arg=${1:-$(pbpaste)}

echo "${#arg} characters"
