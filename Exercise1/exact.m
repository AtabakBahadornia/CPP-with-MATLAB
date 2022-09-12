ny=31
nx=61
x_step=0.1;                  y_step=0.1;  
L=6;                        W=3;
T_Left=25;T_Bot=25; T_Right=25; T_Up=100;
T_exact=zeros(ny,nx)
for i=1:31
    for j=1:61
        for m=1:120
            x=(i-1)*x_step;
            y=(j-1)*y_step;
% T_exact(i,j)=T_exact(i,j)+(1-cos(m*pi))/(m*pi*sinh(m*pi*L/W))*(T_Left*sinh(m*pi*(L-y)/W)+T_Right*sinh(m*pi*y/W))*sin(m*pi*x/W);
T_exact(i,j)=T_exact(i,j)+(1-cos(m*pi))/(m*pi*sinh(m*pi*W/L))*(T_Up*sinh(m*pi*x/L))*sin(m*pi*y/L);
        end
    end
end
    T_exact=2*T_exact;
    figure(4)
    contourf(T_exact)
    axis equal
    title('Exact solution  ')
