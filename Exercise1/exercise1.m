clc
clear all
%**************************Parameters of Problem**************************
        L=3;                        %plate length x-direction
        W=3;                        %plate width y-direction
        nx=31;                        %numbers of nodes in x-direction
        ny=31;                        %numbers of nodes in y-direction
        x_step=L/(nx-1);              %space step-size in x-direction
        y_step=W/(ny-1);              %space step-size in y-direction
        t_step=0.2;                   %time step-size
        alpha=11.234e-5;              %Thermal diffusivity [m^2/s]
        dx=alpha*t_step/(x_step)^2;   %Numerical diffusivity in x-direction
        dy=alpha*t_step/(y_step)^2;   %Numerical diffusivity in y-direction
%***************************Boundy conditions******************************
        T_Left=25;                  % T(x,0)=40 degree celsius
        T_Bot=25;                   % T(0,y)=0 degree celsius
        T_Right=25;                  % T(x,w)=10 degree celsius
        T_Up=100;                   % T(L,y)=0 degree celsius
%*******************Defining initial Temperature profile*******************
T=zeros(ny,nx); T(1:ny,1:nx)=25;  T(1:ny,1)=T_Left; T(1:ny,nx)=T_Right; T(1,1:nx)=T_Bot; T(ny,1:nx)=T_Up;
%****************************Numerical solution****************************
hold on;
for nt=1 :5000
T_old=T;
T=twoDim_DuFortFrankel(T,T_old,nx,ny,dx,dy,t_step,alpha);
% T=twoDim_FTCS(T,nx,ny,dx,dy);
if(nt*t_step==10 || nt*t_step==40 || nt==5000 )
% figure(5)
hold on;
%     plot(T(1:ny,16),0:0.01:0.4,'-o','linewidth',2)
%     xlabel('T')
%     ylabel('Width')
%     legend('T=10 s' , 'T=40 s' , 'steady state')
%     set(gca,'fontsize',14)
end
if (nt*t_step==10 )
    figure(1)
    contourf(T);
    title('t=10 sec ')

end
if (nt*t_step==40)
    figure(2)
    contourf(T);
    title('t=40 sec ')
end
end
figure(3)
contourf(T);
title('Steady state  ')
% %******************************exact solution******************************
T_exact=zeros(ny,nx)
for i=1:31
    for j=1:31
        for m=1:120
            x=(i-1)*x_step;
            y=(j-1)*y_step;
T_exact(i,j)=T_exact(i,j)+(1-cos(m*pi))/(m*pi*sinh(m*pi*L/W))*(T_Left*sinh(m*pi*(L-y)/W)+T_Right*sinh(m*pi*y/W))*sin(m*pi*x/W);
        end
    end
end
    T_exact=2*T_exact;
    figure(4)
    contourf(T_exact)
    title('Exact solution  ')

