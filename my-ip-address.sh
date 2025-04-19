#!/usr/bin/env zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title My IP Address
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🌐
# @raycast.argument1 { "type": "dropdown", "data": [{"title": "IPv4 External", "value": "ipv4_e"}, {"title": "IPv4 Internal", "value": "ipv4_i"}, {"title": "IPv6 External", "value": "ipv6_e"}, {"title": "IPv6 Internal", "value": "ipv6_i"}], "placeholder": "Mode (Default: IPv4 Internal)", "optional": true}

# Documentation:
# @raycast.description Copy the current IP address to the clipboard.
# @raycast.author Paolo Centomani
# @raycast.authorURL https://noveria.it

case $1 in
    ipv6_e)
        ip=$(curl --ipv6 --silent --max-time 5 https://api64.ipify.org)
        ;;
    ipv6_i)
        ips_line=$(ifconfig | grep "inet6.*%en" | awk "{print $2}")
        read -A ips <<< "$ips_line"
        ip=${ips[1]}
        ;;
    ipv4_i)
        ips_line=$(ifconfig | grep "inet.*broadcast" | awk "{print $2}")
        read -A ips <<< "$ips_line"
        ip=${ips[1]}
        ;;
    *)
        ip=$(curl --ipv4 --silent --max-time 5 https://api.ipify.org)
        ;;
esac

echo $ip | tr -d "\n" | pbcopy
echo "Copied $ip"
