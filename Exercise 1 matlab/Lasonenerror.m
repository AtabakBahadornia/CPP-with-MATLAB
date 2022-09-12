        clc
        clear all;
        k=1
        deltaT=[0.01,0.025,0.05,0.1]
        L= 0.3;                          %distance of two plates [cm]
        dx=0.05;                         %x direction nodes distance [m] 
        x=0:dx:L;                        %Dividing the distance between two plates 
        nx= length(x);                   %space nodes number 
        Ti=40;                           % T(0-) value
        Ts=150;                          % T(0) value at boundry
        T_initial(1)=Ts;                 %boundary condition
        T_initial(nx)=Ts;                %boundary condition
        T_initial(2:nx-1)=Ti;            %initial condition
        Final_Time=0.5;
        alpha= 0.1;                      % (heat diffusivity) [m^2/s]
        for dt=[0.01,0.025,0.05,0.1]                        % maximum time step size for a stable solve
        t=0:dt:Final_Time;
        nt=length(t)-1;
        NUM_diffusivity= (alpha*dt)/(dx^2); %Numerical_diffusivity
        T_FTCS=T_initial;
        T_Lasonen=T_initial;
        T_dufortfrankel =T_initial;
        T_cranknikolson=T_initial;
        T_dufortfrankelprevious(1:nx) =Ti;
        CoefficinetMatrix=zeros(nx-2);


set(gca,'fontsize',14)
e(1:nx)=0
for i=1:nt
        T_Lasonen=Lasonen(T_Lasonen,nx,NUM_diffusivity);
        T_Exact=ExactsolutionHeat(Ti,Ts,i,L,nx,alpha,dt);
end
        e=abs(T_Lasonen-T_Exact);
        figure(1)
        plot(x,e,'-o')
        hold on;
        
        esum(k)=sum(e)/nx

        k=k+1
        end
            xlabel('x')
            ylabel('Error') 
            title('Lasonen error')
            legend('dt=0.01','dt=0.025','dt=0.05','dt=0.1')
                figure(2)
        loglog(deltaT,esum,'k-o','linewidth',1.5)
        hold on;
            xlabel('\DeltaT')
            ylabel('Error') 
            title('Lasonen error')
        legend('dt=0.01','dt=0.025','dt=0.05','dt=0.1')


