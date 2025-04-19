#!/usr/bin/env zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title URL IP Address
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🌐
# @raycast.argument1 { "type": "text", "placeholder": "URL", "optional": false}
# @raycast.argument2 { "type": "dropdown", "data": [{"title": "IPv4", "value": "ipv4"}, {"title": "IPv6", "value": "ipv6"}], "placeholder": "Mode (Default: IPv4)", "optional": true}

# Documentation:
# @raycast.description Copy the IP address of the given URL.
# @raycast.author Paolo Centomani
# @raycast.authorURL https://noveria.it

domain=${1#*//}
domain=${domain%%/*}

if [[ "$2" == "ipv6" ]]
then
    mode="-6"
else
    mode="-4"
fi

ip=$(dig $mode +short +time=1 $domain | grep -v "\.$" | awk "{ print ; exit }")
echo $ip | pbcopy
echo "Copied $ip"
