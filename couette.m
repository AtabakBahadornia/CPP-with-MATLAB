clc;
clear all; 
%***************numerical solution******************
tic;
h= 1;   %distance of two plates
U=1;    %velocity 
ny= 11; % space nodes number 
ntstart=input("input the first time level number?\n");;
dy= h/(ny-1); %space step size for y direction
v= 2.17e-4;   %kinematic viscosity (momentum diffusivity)
dt= dy^2/(2*v);% maximum time step size for a stable solve
NUM_diffusivity= (v*dt)/(dy^2);
steps= input("how many time levels you need to solve?\n");
unumerical=FTCS(ntstart,dt,ny,dy,U,h,v,NUM_diffusivity,steps);
uexact=exactsolution(ntstart,dt,ny,dy,U,h,v,steps);

toc;