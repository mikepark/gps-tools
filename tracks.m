#!/usr/bin/env octave

root = '20080704'

eval ( sprintf( "tracks = load( '%s.gps' ); ", root ) )

n = size(tracks,1);

for i = 1:n-1
  if ( sign(tracks(i,1)-36.805) != sign(tracks(i+1,1)-36.805))
    disp(i)
  end
end

n = size(tracks,1);

r=348:1099;
r=1:810;
r=1:n;

%r = find(tracks(:,1)>36.86);
%min(r)
%max(r)

plot(tracks(r,2),tracks(r,1),'-@;dog walk;')
print -deps tracks.eps

f= fopen('tracks.gps','wt');
for i = r
  fprintf(f,"%9.5f %9.5f\n",tracks(i,1),tracks(i,2));
end
fclose(f);
