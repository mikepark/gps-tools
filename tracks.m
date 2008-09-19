function tracks(root)

eval ( sprintf( "t = load( '%s.gps' ); ", root ) )

n = size(t,1);

r=1:n;

%min(r)
%max(r)

plot(t(r,2),t(r,1),'-@;track;')
eval(sprintf('print -deps %s.eps',root))

clearplot
closeplot

