#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Auto Dark Mode Fix
# @raycast.description Fix auto dark mode for applications that do not support it (e.g. PhpStorm)
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🌗

# Documentation:
# @raycast.author Paolo Centomani
# @raycast.authorURL https://noveria.it

tell application "System Events" to tell appearance preferences to set dark mode to not dark mode
tell application "System Events" to tell appearance preferences to set dark mode to not dark mode
