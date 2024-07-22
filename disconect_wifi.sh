#!/bin/sh

THRESHOLD=-60

for station in $(iw dev phy1-ap0 station dump | grep Station | awk '{print $2}'); do
    signal=$(iw dev phy1-ap0 station get $station | grep signal: | awk '{print $2}')
    if [ $signal -lt $THRESHOLD ]; then
        iw dev phy1-ap0 station del $station
    fi
done