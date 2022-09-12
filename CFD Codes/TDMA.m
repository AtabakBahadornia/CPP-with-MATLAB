% Tridiagonal matrix solver (Thomas algorithm)
% a,b,c coefficient vectors
% d vector of known values
% T vector of unknowns to be found

function T = TDMA(a,b,c,d)

N    = length(d);
v    = zeros(N,1);
T    = v;
w    = b(1);
T(1) = d(1)/w;
%--1st step
for i=2:N
       im = i-1;
    v(im) =  c(im)/w;
    w     =  b(i)-a(i)*v(im);
    T(i)  = (d(i)-a(i)*T(im))/w;
end

%--2nd step
for j=N-1:-1:1
   T(j) = T(j)-v(j)*T(j+1);
end

end
