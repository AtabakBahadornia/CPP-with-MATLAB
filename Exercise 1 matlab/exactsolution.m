
function u=exactsolution(numt,dt,ny,dy,U,h,v)
%***************exact solution******************
uny=0;   u=zeros(ny,1); 
u(1,1)=1;       %boundary condition
    for numy=2:ny-1
      etha1 = h/(2*sqrt(v*numt*dt));
      etha = (numy-1)*dy/(2*sqrt(v*numt*dt));
        for n=0:200
          u(numy,1)= U*((erfc(2*n*etha1+etha))-(erfc(2*(n+1)*etha1-etha)))+u(numy,1);   
        end
    end

end