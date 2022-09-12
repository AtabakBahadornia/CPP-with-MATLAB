function [T,Err]=LGaussSidel(Nx,Ny,T)
    Constantterms(Ny-2)=0;
    TMP=T;
    for j=1:Ny-2
    for i=1:Ny-2
        if i==j
            CoefficinetMatrix(i,j)=-4;
        elseif i-j==1
            CoefficinetMatrix(i,j)=1;
        elseif j-i==1
            CoefficinetMatrix(i,j)=1;
        end
    end
end
for j=1:Nx-2;
for i=1:Ny-2
        Constantterms(i)=-T(j,i+1)-TMP(j+2,i+1);
end
Constantterms(1)=Constantterms(1)-T(j+1,1);
Constantterms(99)=Constantterms(99)-T(j+1,101);
Temp=inv(CoefficinetMatrix)*Constantterms';
T(j+1,2:100)=Temp(1:99);
end    
    
    


Err = max(max(abs(T(2:end-1,2:end-1)-TMP(2:end-1,2:end-1))));
end