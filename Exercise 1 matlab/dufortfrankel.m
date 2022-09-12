function [unext,u]=dufortfrankel(u,uprevious,ny,NUM_diffusivity)
%***************numerical solution******************
utemp=u;
a=1+2*NUM_diffusivity;
b=1-2*NUM_diffusivity;
c=2*NUM_diffusivity;
TMP=0;
unext=u;
    for j=2:ny-1
        TMP = b/a*uprevious(j)+c/a*(u(j+1)+u(j-1));
        unext(j)=TMP;
    end
end
