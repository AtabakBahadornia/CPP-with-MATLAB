clc
clear all;
u=[150,40,40,40,40,40,150]
NUM_diffusivity=0.4
a=NUM_diffusivity;
b=-2*NUM_diffusivity-1;
c=NUM_diffusivity;
CoefficinetMatrix=zeros(5);
for n=0:50
Constantterms(2:4,1)=-u(3:5);
Constantterms(1,1)=-u(2)-a*150
Constantterms(5,1)=-u(6)-c*150
for j=1:5
    for i=1:5
        if i==j
            CoefficinetMatrix(i,j)=b;
        elseif i-j==1
            CoefficinetMatrix(i,j)=c;
        elseif j-i==1
            CoefficinetMatrix(i,j)=a;
        end
    end
end
constantterms=inv(CoefficinetMatrix)*Constantterms
u(2:6)=reshape(constantterms,[1,5])
end