#!/usr/bin/env bash
echo $1
gps_root=$1

function ex {
    $* || ( echo FAILED: $* ; exit )
}

source='usb:'

ex gpsbabel -t -i garmin -f ${source} -o garmin_txt,dist=s,grid=0,prec=8 -F ${gps_root}.gtx
ex gpsbabel -t -i garmin -f ${source} -o gpsdrive -F ${gps_root}.gps
ex gpsbabel -t -i garmin -f ${source} -o kml,points=0,line_color=ff0000ff -F ${gps_root}.kml

