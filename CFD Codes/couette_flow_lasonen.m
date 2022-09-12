%---couette flow lasonen (2)---%
clc
clear
close all

      H = 1;                                        %height of channel (m)
     U0 = 1;                                        %velocity of lower plate (m/s)
      v = 2.17e-4;                                  %static viscousity of fluid (m^2/m)
     dy = 0.01;                                     %local step
      y = 0:dy:H;                                   %y-axis
     ny = length(y);                                %number of y-grid
     dt = 100;                                      %time step
     tf = 1000;                                     %final time
      t = 0:dt:tf;                                  %time-grid
     nt = length(t);                                %number of time step
      u = zeros(ny, 1);                             %velocity of fluid matrix
   u(1) = U0;                                       %lower plate velocity
  u(ny) = 0;                                        %upper plate velocity
      d = v*dt/(dy^2);                              %diffusion number
      
      a = d*ones(ny-2,1);                           %a vector (ny-2 taa moadele)
      b = -((2*d) + 1)*ones(ny-2, 1);               %b vector
      c = d*ones(ny-2, 1);                          %c vector

figure(1)
hold on;
tic;
for i= 1:nt
    D = -u(2:ny-1);                                 %d vector
    D(1) = -(u(2) + (v*dt)/(dy^2)*u(1));            %first value of D
    D(end-1) = -(u(ny-1) + (v*dt)/(dy^2)*u(ny));    %end value of D(
    U = TDMA(a, b, c, D);
    for j=1:ny-2
        u(j+1)= U(j);                               %velocity matrix collector
    end
    plot(u,y)
end
toc;