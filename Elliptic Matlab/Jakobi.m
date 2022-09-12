function [T,Err]=Jakobi(Nx,Ny,T)
    TMP = T;
    for i=2:Nx-1
        for j=2:Ny-1
            T(i,j)=1/4*(TMP(i-1,j)+TMP(i+1,j)+TMP(i,j-1)+TMP(i,j+1));
        end
    end
    Err = max(max(abs(T(2:end-1,2:end-1)-TMP(2:end-1,2:end-1))));
end