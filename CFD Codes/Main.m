clear
clc
close all

%------------------------------------------Parameters
alpha = 0.0001;                    % Diffusion coefficient (m2/s);
nx    = 41;                      % Num. of poitns in x
ny    = 41;                      % Num. of poitns in y
L     = 1;                       % Length (m)
W     = 1;                       % width (m)
T1    = 40;                      % Bottom wall (C)
T2    = 0;                       % Left wall (C)
T3    = 10;                      % Upper wall (C)
T4    = 0;                       % Right wall (C)
Ti    = 0;                       % Initial temperature(C)
nt    = 10000;                      % Number of time steps
%-------------------------------------------Grid size & Time step
del_x = L/(nx-1);               % Delta x (m)
del_y = W/(ny-1);               % Delta y (m)
del_t = 0.1;                    % Delta t (s)
dx    = alpha*del_t/del_x^2;    % Diffusion number in x
dy    = alpha*del_t/del_y^2;    % Diffusion number in y
x     = linspace(0,L,nx);       % grid points in x
y     = linspace(0,W,ny);       % grid points in y
%
%------------------------------------------- Call ADI
T_ADI=ADI(nx,ny,dx,dy,Ti,T1,T2,T3,T4,nt)
%------------------------------------------- End
[X,Y]=meshgrid(x,y);
%---------------------------
figure(1)
contourf(X,Y,squeeze(T_ADI(:,:))')
colormap('jet')
colorbar
set(gca,'fontsize',14)
%---------------------------