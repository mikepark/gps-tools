#!/usr/bin/env bash
echo $1
gps_root=$1

function ex {
    sudo $* || ( echo FAILED: $* ; exit )
}

ex gpsbabel -t -i garmin -f /dev/ttyUSB0 -o garmin_txt,dist=s,grid=0,prec=8 -F ${gps_root}.gtx
ex gpsbabel -t -i garmin -f /dev/ttyUSB0 -o gpsdrive -F ${gps_root}.gps
ex gpsbabel -t -i garmin -f /dev/ttyUSB0 -o kml,points=0,line_color=ff0000ff -F ${gps_root}.kml

ex chown mikepark ${gps_root}.*
ex chgrp mikepark ${gps_root}.*

