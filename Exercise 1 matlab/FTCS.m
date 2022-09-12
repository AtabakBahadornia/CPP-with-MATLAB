function unext=FTCS(u,ny,NUM_diffusivity)
%***************numerical solution******************
TMP=0;
unext=u;
    for j=2:ny-1
        TMP = u(j)+ NUM_diffusivity*(u(j+1)- 2*u(j)+ u(j-1));
        unext(j)=TMP;
    end
end
