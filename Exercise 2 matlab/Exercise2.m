        clc
        clear all;
        L= 0.3;                          %distance of two plates [cm]
        dx=0.05;                         %x direction nodes distance [m] 
        x=0:dx:L;                        %Dividing the distance between two plates 
        nx= length(x);                   %space nodes number 
        Ti=40;                           % T(0-) value
        Ts=500;                          % T(0) value at boundry
        T_initial(2:nx-1)=Ti;            %initial condition
        T_initial(1)=Ti;                 %boundary condition
        T_initial(nx)=Ts;                %boundary condition
        Final_Time=0.5;
        alpha= 0.1;                      % (heat diffusivity) [m^2/s]
        dt=0.01                        % maximum time step size for a stable solve
        t=0:dt:Final_Time;
        nt=length(t)-1;
        NUM_diffusivity= (alpha*dt)/(dx^2); %Numerical_diffusivity
        T_FTCS=T_initial;
        T_Lasonen=T_initial;
        CoefficinetMatrix=zeros(nx-2);
        for i=1:nt
        T_FTCS=FTCS_neumann(T_FTCS,nx,NUM_diffusivity);
        T_Lasonen=Lasonen_neumann(T_Lasonen,nx,NUM_diffusivity);
        if mod(i,10)==0
        figure(1)
        set(gca,'fontsize',14)
        hold on;
            plot(x,T_FTCS,'-o')
            xlabel('x')
            ylabel('T_ FTCS')
            title('\Deltat=0.01 , \Deltax=0.05')
            legend('T=0.1hour','T=0.2hour','T=0.3hour','T=0.4hour','T=0.5hour','location','southeast')
        figure(2)
        set(gca,'fontsize',14)
        hold on;
            plot(x,T_Lasonen,'-o')
            xlabel('x')
            ylabel('T_ Lasonen') 
            title('\Deltat=0.01 , \Deltax=0.05')  
            legend('T=0.1hour','T=0.2hour','T=0.3hour','T=0.4hour','T=0.5hour','location','southeast')
         end
        end