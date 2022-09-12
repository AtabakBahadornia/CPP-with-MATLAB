clc
clear all
%**************************Parameters of Problem**************************
        L=0.3;                        %plate length x-direction
        W=0.4;                        %plate width y-direction
        nx=31;                        %numbers of nodes in x-direction
        ny=41;                        %numbers of nodes in y-direction
        x_step=L/(nx-1);              %space step-size in x-direction
        y_step=W/(ny-1);              %space step-size in y-direction
        t_step=0.2;                   %time step-size
        alpha=11.234e-5;              %Thermal diffusivity [m^2/s]
        dx=alpha*t_step/(x_step)^2;   %Numerical diffusivity in x-direction
        dy=alpha*t_step/(y_step)^2;   %Numerical diffusivity in y-direction
        d1=dx/2;                      %is a only definition
        d2=dy/2;                      %is a only definition
%***************************Boundy conditions******************************
        T1=40;                  % T(x,0)=40 degree celsius
        T2=0;                   % T(0,y)=0 degree celsius
        T3=10;                  % T(x,w)=10 degree celsius
        T4=0;                   % T(L,y)=0 degree celsius
%*******************Defining initial Temperature profile*******************
T=zeros(ny,nx);  T(1:ny,1)=T1; T(1:ny,nx)=T3; T(1,1:nx)=T2; T(ny,1:nx)=T4;
%****************************Numerical solution****************************
[T]=ADI(T,nx,ny,dx,dy)
