function unextn=FTCS(u,ny,U,NUM_diffusivity)
%***************numerical solution******************
unextn=zeros(ny,1);
unextn(1,1)=U; %boundary condition
unextn(ny,1)=0; %boundary condition
TMP=0;
    for j=2:ny-1
        TMP = u(j,1)+ NUM_diffusivity*(u(j+1)- 2*u(j)+ u(j-1));
        unextn(j,1)=TMP;
    end
end
