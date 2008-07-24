#!/usr/bin/env octave

root = '20080713'

eval ( sprintf( "tracks = load( '%s.gps' ); ", root ) )

n = size(tracks,1);

for i = 1:n-1
  if ( sign(tracks(i,1)-36.805) != sign(tracks(i+1,1)-36.805))
    disp(i)
  end
end

n = size(tracks,1);

r=1:n;

plot(tracks(r,2),tracks(r,1),'-@;dog walk;')
print -deps tracks.eps

f= fopen('tracks.gps','wt');
for i = r
  fprintf(f,"%9.5f %9.5f\n",tracks(i,1),tracks(i,2));
end
fclose(f);
