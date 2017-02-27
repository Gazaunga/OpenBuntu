#!/bin/sh

URL='http://www.accuweather.com/en/us/baltimore-md/21202/weather-forecast/348707'

curl -q "$URL" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $2": "$14", "$12"°" }'| head -1
