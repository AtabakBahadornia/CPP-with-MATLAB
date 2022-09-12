function [Tnext]=Ysweep(T,coefficient_Matrix,d1,d2,nx,ny)
Tnext=T;
for i=2:nx-1
       for j=2:ny-1
        constant_terms(j-1,1)=d1*T(j,i-1)+d1*T(j,i+1)+(1-2*d1)*T(j,i);
if (j==2)
 constant_terms(j-1,1)= constant_terms(j-1,1)+d1*T(1,i);
elseif(j==ny-1)
constant_terms(j-1,1)= constant_terms(j-1,1)+d1*T(j+1,i);
       end
end
Tnext(2:ny-1,i)=(inv(coefficient_Matrix)*constant_terms)';
end
