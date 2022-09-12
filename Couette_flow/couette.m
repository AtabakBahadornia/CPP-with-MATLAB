clc;
clear all; 
%---------------------System Parameters------------------------------------
    h= 1;   %distance of two plates
    U=1;    %velocity 
    ny= 30; % space nodes number 
    u_numerical=zeros(ny,1); %velocity vector definition
    u_numerical(1,1)=U;   %boundary condition
    u_numerical(ny,1)=0;  %boundary condition
    ntstart=input("input the first time level number?\n");
    dy= h/(ny-1);           %space step size for y direction
    v= 2.17e-4;             %kinematic viscosity (momentum diffusivity)
    dt=(dy^2)/(2*v);        % maximum time step size for a stable solve
    NUM_diffusivity= (v*dt)/(dy^2); %Numerical_diffusivity
    TimeLevelDistance=input("distance between  every two tandem time levels.\n");   %distance of two time levels which we would like to plot
    steps= TimeLevelDistance*input("how many time levels you need to plot?\n");
%----------------Plotting exact and numerical solution---------------------
figure(1)
hold on;
tic;
for numt=ntstart-1:ntstart+(steps-1)-1 %plotting time range
if (mod(numt,TimeLevelDistance)==0)  %an auxiliary condtion for a better plotting
        uexact=exactsolution(numt,dt,ny,dy,U,h,v);
        x = 0:dy:(ny-1)*dy;
        A=plot(uexact,x,'ro','linewidth',1.5);
        ylabel('y')
        xlabel('u')
        hold on;
end
end
for numt=2:ntstart+steps-1;
u_numerical=FTCS(u_numerical,ny,U,NUM_diffusivity);
        if ((numt>=ntstart && mod(numt,TimeLevelDistance)==0))
        x = 0:dy:(ny-1)*dy;
        B=plot(u_numerical,x,'b-') 
        hold on;
        end
end
        legend('ExactValues')
%--------------------------Error calculator--------------------------------
figure(2)
hold on;
nyinitial=9;
nyfinal=14;
for ny=nyinitial:nyfinal
dy= h/(ny-1);
u_numerical=zeros(ny,1); %velocity vector definition
u_numerical(1,1)=U;   %boundary condition
u_numerical(ny,1)=0;  %boundary condition
dt=10; %time step fixed.
            numt=ny;
            uexact=exactsolution(numt,dt,ny,dy,U,h,v);
        for numt=2:(ny+1);
            u_numerical=FTCS(u_numerical,ny,U,NUM_diffusivity);
            end
        e(ny-nyinitial+1,1)=err(uexact,u_numerical,ny);
        delta(ny-nyinitial+1,1)=dy;
end
loglog(delta,e,'k-o','linewidth',2)
toc;
set(gca,'fontsize',14)
legend('FTCS','Location','southeast')




