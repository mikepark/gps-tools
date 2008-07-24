#!/usr/bin/env octave

root = '20080704'

eval ( sprintf( "tracks = load( '%s.gps' ); ", root ) )

n = size(tracks,1);

r=1:n;

%min(r)
%max(r)

plot(tracks(r,2),tracks(r,1),'-@;track;')
print -deps tracks.eps

clearplot
closeplot

