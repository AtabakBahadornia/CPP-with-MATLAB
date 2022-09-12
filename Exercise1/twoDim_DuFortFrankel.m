function [unext]=twoDim_DuFortFrankel(T,T_old,nx,ny,dx,dy,dt,alpha)
%**************************numerical solution******************************
d=alpha*dt/(dx)^2
unext=T;
    for i=2:nx-1 
        for j=2 :ny-1
            unext( j, i)=1/(1+4*d)*((1-4*d)*(T_old(j,i)) + 2*d*(T(j-1,i)+T(j+1,i)+T(j,i-1)+T(j,i+1)));
        end
    end
end