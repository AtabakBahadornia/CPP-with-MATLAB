function T=ExactsolutionHeat(Ti,Ts,i,L,nx,alpha,dt)
%***************Exact solution******************
t=i*dt
dx=L/(nx-1);
x=0:dx:L;
T=Ts;
for m=1:100
T=T+2*(Ti-Ts)*exp(-(m*pi/L)^2*alpha*t)*(1-(-1)^m)/(m*pi)*sin(m*pi*x/L);
end
end

