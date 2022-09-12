        clc
        clear all;
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
        dt=0.01                        % maximum time step size for a stable solve
        t=0:dt:Final_Time;
        nt=length(t)-1;
        NUM_diffusivity= (alpha*dt)/(dx^2); %Numerical_diffusivity
        T_FTCS=T_initial;
        T_Lasonen=T_initial;
        T_dufortfrankel =T_initial;
        T_cranknikolson=T_initial;
        T_dufortfrankelprevious(1:nx) =Ti;
        CoefficinetMatrix=zeros(nx-2);
        %% 
for i=1:nt
        T_FTCS=FTCS(T_FTCS,nx,NUM_diffusivity);
        T_Lasonen=Lasonen(T_Lasonen,nx,NUM_diffusivity);
        [T_dufortfrankel,T_dufortfrankelprevious]=dufortfrankel(T_dufortfrankel,T_dufortfrankelprevious,nx,NUM_diffusivity);
        T_cranknikolson=crank_nicolson(T_cranknikolson,nx,NUM_diffusivity);
%         T_Exact=ExactsolutionHeat(Ti,Ts,i,L,nx,alpha,dt);
        if mod(i,10)==0
        figure(1)
        set(gca,'fontsize',14)
        hold on;
            plot(x,T_FTCS)
%             plot(x,T_Exact,'ro')
            xlabel('x')
            ylabel('T_ FTCS')
            title('\Deltat=0.01 , \Deltax=0.05')
            legend('T numerical','T exact','location','southeast')
        figure(2)
        set(gca,'fontsize',14)
        hold on;
            plot(x,T_Lasonen)
%             plot(x,T_Exact,'ro')
            xlabel('x')
            ylabel('T_ Lasonen') 
            title('\Deltat=0.01 , \Deltax=0.05')  
            legend('T numerical','T exact','location','southeast')
        figure(3)
        set(gca,'fontsize',14)
        hold on;        
            plot(x,T_dufortfrankel)
%             plot(x,T_Exact,'ro')
            xlabel('x')
            ylabel('T_ dufortfrankel') 
            title('\Deltat=0.01 , \Deltax=0.05')
            legend('T numerical','T exact','location','southeast')
        figure(4)
        set(gca,'fontsize',14)
        hold on;        
            plot(x,T_cranknikolson)
%             plot(x,T_Exact,'ro')
            xlabel('x')
            ylabel('T_ cranknikolson') 
            title('\Deltat=0.01 , \Deltax=0.05')
            legend('T numerical','T exact','location','southeast')
         end

end
set(gca,'fontsize',14)


