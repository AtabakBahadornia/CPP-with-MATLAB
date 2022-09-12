%----------------------- garmaaye divaar 2D ---------------------------%
clc
clear
close all

A  = zeros(9,9);                            % Matrix of Coefficients 
T  = zeros(5,5);                             % All ponits Temperature Matrix
T(1,:)= 100;                                % left  side of the wall temeprature (?)
T(5,:)= 100;                                % right side of the wall tempereture (?)
T(:,1)= 100;                                % lower side of the wall temperature (?)
T(2:end-1,5)= 200;                                % upper side of the wall temperature (?)

L = 1;                                      % wall length (m)   
H = 1;                                      % wall height (m)
alpha = 0.1;                                % Heat diffusion coefficient (m^2/s)

dX = 1;                                     % steps for wall length (m) 
dY = 1;                                     % steps for wall height (m)
x = 1:dX:L;                                 % wall lenght points
y = 1:dY:H;                                 % wall height points
nx = length(x);                             % number of points in length of the wall
ny = length(y);                             % number of points in height of the wall
  
dt =1;                                   % Time step (s)
ft = 2000;                                   % Final time (s)
t = 0:dt:ft;                                % Time grid
nt = length(t);                             % number of time steps

dx = alpha*dt/(dX^2);                       % x diffusion number
dy = alpha*dt/(dY^2);                       % y diffusion number 
 
a = dx;                                     % a coefficient definition
b = dx;                                     % b coefficient definition
c = -2*(dx+dy+1);                           % c coefficient definition
d = dy;                                     % d coefficient definition
e = dy;                                     % e coefficient definition


% for i=1:9  
%     for j=1:9      
%         if i==j     
%             A(i,j)=c;      
%         elseif (i~=1 && i~=2 && i~=3 && i-j==3)           
%             A(i,j)=a;        
%         elseif (i~=3 && i~=6 && i~=9 && j-i==1)          
%             A(i,j)=e;       
%         elseif (i~=7 && i~=8 && i~=9 && j-i==3)          
%             A(i,j)=b;      
%         elseif (i~=1 && i~=4 && i~=7 && i-j==1)           
%             A(i,j)=d;      
%         end
%     end
%     
% end

 A = [ c e 0 b 0 0 0 0 0 ;              % A Matrix
       d c e 0 b 0 0 0 0 ;
       0 d c 0 0 b 0 0 0 ;
       a 0 0 c e 0 b 0 0 ;
       0 a 0 d c e 0 b 0 ;
       0 0 a 0 d c 0 0 b ;
       0 0 0 a 0 0 c e 0 ;
       0 0 0 0 a 0 d c e ;
       0 0 0 0 0 a 0 d c ];
   for i=1:nt
          
    f =   [-T(2,2)-(a*T(1,2))-(d*T(2,1));
           -T(2,3)-(a*T(1,3));
           -T(2,4)-(a*T(1,4))-(e*T(2,5));
           -T(3,2)-(d*T(3,1));
           -T(3,3);       
           -T(3,4)-(e*T(3,5));
           -T(4,2)-(d*T(4,1))-(b*T(5,2));
           -T(4,3)-(b*T(5,3));
           -T(4,4)-(b*T(5,4))-(e*T(4,5))];  
                 T=T';

            T(2:4,2:4)= reshape(inv(A)*f,3,3);
                             T=T';

   end
   T
       contourf(T) 
        
        
        