function [unext]=twoDim_FTCS(T,nx,ny,dx,dy)
%**************************numerical solution******************************
unext=T;
    for i=2:nx-1 
        for j=2 :ny-1
            unext( j, i)= (1-2*dx-2*dy)*T(j,i)+ dx*(T(j+1,i)+T(j-1,i))+ dy*(T(j,i+1)+T(j,i-1));
        end
    end
end
