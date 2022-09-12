%Elliptic PDE using 2nd orde FD
clear
close all
clc

TL = 10;
TR = 10;
TB = 10;
TT = 100;
Nx = 101;
Ny = 101;
Lx = 1;
Ly = 1;

T=zeros(Ny,Nx);

T(:,1)  = TL;
T(Ny,:) = TT;
T(:,Nx) = TR;
T(1,:)  = TB;
T(Ny,:) = TT;
x       = linspace(0,Lx,Nx);
y       = linspace(0,Ly,Ny);
k       = 0;
Err     = 1.0;
while(Err>1e-3)
    k=k+1;
    
%     [T,Err] = Jakobi(Nx,Ny,T);
%     [T,Err] = PGaussSidel(Nx,Ny,T);
    [T,Err] = PSOR(Nx,Ny,T);
%     [T,Err] = LGaussSidel(Nx,Ny,T);
    if (mod(k,100)==0)
        disp(['Iteration: ', num2str(k) ', Error: ',num2str(Err)])
    end
end

figure(1)
contourf(x,y,T)
colorbar
set(gca,'fontsize',14)