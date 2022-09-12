function u=Lasonen(u,ny,NUM_diffusivity)
%***************numerical solution******************
TMP=0;
a=NUM_diffusivity;
b=-2*NUM_diffusivity-1;
c=NUM_diffusivity;
CoefficinetMatrix=zeros(ny-2);
Constantterms(2:ny-3)=-u(3:ny-2);
Constantterms(1)=-u(2)-a*u(1);
Constantterms(ny-2)=-u(ny-1)-c*u(ny);
for j=1:ny-2
    for i=1:ny-2
        if i==j
            CoefficinetMatrix(i,j)=b;
        elseif i-j==1
            CoefficinetMatrix(i,j)=c;
        elseif j-i==1
            CoefficinetMatrix(i,j)=a;
        end
    end
end
constantterms=inv(CoefficinetMatrix)*Constantterms';
u(2:ny-1)=reshape(constantterms,[1,ny-2]);
end

