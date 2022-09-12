function [T,Err]=PSOR(Nx,Ny,T)
    
    om = 1.99;
    
    TMP = T;
    for i=2:Nx-1
        for j=2:Ny-1
            T(i,j)=om/4*(T(i-1,j)+TMP(i+1,j)+T(i,j-1)+TMP(i,j+1))+(1-om)*TMP(i,j);
        end
    end
    Err = max(max(abs(T(2:end-1,2:end-1)-TMP(2:end-1,2:end-1))));
end%