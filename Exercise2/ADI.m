function [T]=ADI(T,nx,ny,dx,dy)
%**************************Parameters of Problem***************************
        d1=dx/2;                      %is a only definition
        d2=dy/2;                      %is a only definition
        coefficient_Matrix_Xsweep=zeros(nx-2);
        coefficient_Matrix_Ysweep=zeros(ny-2);
        a=-d1;
        c=-d1;
        b=1+2*d1;
%---------------------Coefficient Matrix for x-sweep-----------------------
for j=1:nx-2
       for i=1:nx-2
        if(i-j==1)
            coefficient_Matrix_Xsweep(j,i)=a;
        elseif(j-i==1)
            coefficient_Matrix_Xsweep(j,i)=c;
        elseif(i-j==0)
            coefficient_Matrix_Xsweep(j,i)=b;
        end
       end
end
%---------------------Coefficient Matrix for y-sweep-----------------------
for j=1:ny-2
       for i=1:ny-2
        if(i-j==1)
            coefficient_Matrix_Ysweep(j,i)=a;
        elseif(j-i==1)
            coefficient_Matrix_Ysweep(j,i)=c;
        elseif(i-j==0)
            coefficient_Matrix_Ysweep(j,i)=b;
        end
       end
end
for n=1:2000
%---------------------------------X-sweep----------------------------------
T=Xsweep(T,coefficient_Matrix_Xsweep,d1,d2,nx,ny);
%--------------------------------------------------------------------------

%---------------------------------Y-sweep----------------------------------
 T=Ysweep(T,coefficient_Matrix_Ysweep,d1,d2,nx,ny);
%--------------------------------------------------------------------------
if(n*0.2==10)
figure(1)
contourf(T)
title('ADI    t=10 s')
elseif (n*0.2==40)
figure(2)
contourf(T)
title('ADI    t=40 s')
end
end
figure(3)
contourf(T)
title('ADI   steady state')