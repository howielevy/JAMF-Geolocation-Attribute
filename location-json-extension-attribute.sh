#!/bin/bash
myIP=$(curl -s --max-time 5 https://ipinfo.io/ip)
[ -z "$myIP" ] && echo "<result>{\"city\":\"Unknown\",\"region\":\"Unknown\",\"country\":\"Unknown\"}</result>" && exit 0
geoData=$(curl -s --max-time 5 https://ipinfo.io/$myIP/json)
city=$(echo "$geoData" | plutil -extract city raw - 2>/dev/null)
region=$(echo "$geoData" | plutil -extract region raw - 2>/dev/null)
country=$(echo "$geoData" | plutil -extract country raw - 2>/dev/null)
city=${city:-Unknown}
region=${region:-Unknown}
country=${country:-Unknown}
echo "<result>{\"city\":\"$city\",\"region\":\"$region\",\"country\":\"$country\"}</result>"
