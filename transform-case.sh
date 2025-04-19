#!/usr/bin/env zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Transform Case
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔠
# @raycast.argument1 { "type": "dropdown", "data": [{"title": "lowercase", "value": "lc"}, {"title": "PascalCase", "value": "pc"}, {"title": "snake_case", "value": "sc"}, {"title": "Title Case", "value": "tc"}, {"title": "UPPERCASE", "value": "uc"}], "placeholder": "Conversion", "optional": false}

# Documentation:
# @raycast.description Transform the case of clipboard content.
# @raycast.author Paolo Centomani
# @raycast.authorURL https://noveria.it

content=$(pbpaste)

case $1 in
    lc)
        echo ${content:l} | pbcopy
        ;;
    pc)
        content=${content//[^[:alnum:]]/" "}  # Replace non-alphanumeric characters with spaces
        content=${(C)content}                 # Convert to TitleCase
        content=${content// /""}              # Remove spaces
        echo $content | pbcopy
        ;;
    sc)
        content=${content:l}                # Convert to lowercase
        content=${content//[^[:alnum:]]/_}  # Replace non-alphanumeric characters with underscores
        content=${content#_}                # Remove leading underscore
        content=${content%_}                # Remove trailing underscore
        content=${content//__/_}            # Replace multiple underscores
        echo $content | pbcopy
        ;;
    tc)
        echo ${(C)content} | pbcopy
        ;;
    uc)
        echo ${content:u} | pbcopy
        ;;
esac

echo "Copied"
