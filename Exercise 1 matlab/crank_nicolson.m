function u=crank_nicolson(u,ny,NUM_diffusivity)
%***************numerical solution******************
CoefficinetMatrix=zeros(ny-2);
Constantterms(1:ny-2)=0;
Constantterms(1)=+NUM_diffusivity/2*u(1);
Constantterms(end)=+NUM_diffusivity/2*u(end);
      for j=1:ny-2
        Constantterms(j)=Constantterms(j)+NUM_diffusivity/2*(u(j)+u(j+2))+(1-NUM_diffusivity)*u(j+1);
      end
    for j=1:ny-2
        for i=1:ny-2
            if(i==j)
                CoefficinetMatrix(i,j)=1+NUM_diffusivity;
            elseif(i-j==1)
                    CoefficinetMatrix(i,j)=-NUM_diffusivity/2;
            elseif(j-i==1)
                        CoefficinetMatrix(i,j)=-NUM_diffusivity/2 ;
            end
        end
    end
  
    Answers=inv(CoefficinetMatrix)*Constantterms';
    u(2:ny-1)=reshape(Answers,[1,ny-2]);
    
