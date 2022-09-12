clc
clear all;
    A=zeros(9,9)
    T=zeros(5,5)
    T(1,:)= 100;                                % left  side of the wall temeprature (?)
    T(5,:)= 100;                                % right side of the wall tempereture (?)
    T(:,1)= 100;                                % lower side of the wall temperature (?)
    T(:,5)= 200;                                % upper side of the wall temperature (?)
        L = 1;
    alpha = 0.1;
       dx = 0.1;
       dy = 0.1;
        y = 0:dy:L;
        x = 0:dx:L;
       dt = 50;
       ny = length(y);
      d_y = dt*alpha/(dy^2);
      d_x = dt*alpha/(dx^2);
        a = d_x;
        b = d_x;
        c = -2*(d_x+d_y+1);
        d = d_y; 
        e = d_y;
for i=1:9
    for j=1:9
        if i==j
            A(i,j)=c;
        elseif (i~=1 & i~=2 & i~=3 & i-j==3)
            A(i,j)=a;
        elseif (i~=3 & i~=6 & i~=9 & j-i==1)
            A(i,j)=e;
        elseif (i~=7 & i~=8 & i~=9 & j-i==3)
            A(i,j)=b;
        elseif (i~=1 & i~=4 & i~=7 & i-j==1)
            A(i,j)=d;
        end
    end
end
   for i=1:50
          
    f =   [-T(2,2)-(a*T(1,2))-(d*T(2,1));
           -T(2,3)-(a*T(1,3));
           -T(2,4)-(a*T(1,4))-(e*T(2,5));
           -T(3,2)-(d*T(3,1));
           -T(3,3);       
           -T(3,4)-(e*T(3,5));
           -T(4,2)-(d*T(4,1))-(b*T(5,2));
           -T(4,3)-(b*T(5,3));
           -T(4,4)-(b*T(5,4))-(e*T(4,5))];  
            T(2:4,2:4)= reshape(inv(A)*f,3,3);
   end
T
            T