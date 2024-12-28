#!/usr/bin/env zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Strong Password Generator
# @raycast.description Generate a strong password of requested character length
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔐
# @raycast.argument1 { "type": "text", "placeholder": "Length (Default: 24)", "optional": true}

# Documentation:
# @raycast.author Paolo Centomani
# @raycast.authorURL https://noveria.it

length="${1:-24}"

LC_ALL=C tr -dc "[:graph:]" < /dev/urandom | tr -d "\"\`'" | head -c $length | pbcopy; echo -n `pbpaste`
