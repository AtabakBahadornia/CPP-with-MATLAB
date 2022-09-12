function [Tnext]=Xsweep(T,coefficient_Matrix,d1,d2,nx,ny)
Tnext=T;
for j=2:ny-1
       for i=2:nx-1
        constant_terms(i-1,1)=d2*T(j-1,i)+d2*T(j+1,i)+(1-2*d2)*T(j,i);
if (i==2)
 constant_terms(i-1,1)= constant_terms(i-1,1)+d1*T(j,i-1);
elseif(i==nx-1)
constant_terms(i-1,1)= constant_terms(i-1,1)+d1*T(j,i+1);
       end
end
Tnext(j,2:nx-1)=(inv(coefficient_Matrix)*constant_terms)';
end
