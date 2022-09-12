function T=ADI(nx,ny,dx,dy,Ti,T1,T2,T3,T4,nt) 
  %--------------------
  % Put initial condition in
  T       = ones(nx,ny)*Ti; 
  % Put boundary conditions in
  T(:,1)  = T1;
  T(:,ny) = T3;
  T(1,:)  = T2;
  T(nx,:) = T4;
  d1      = dx/2;
  d2      = dy/2;
  %--------------------
  for n=1:nt
    % Sweep x
    for j=2:ny-1
      % Coefficients
      a =-d1*ones(1,nx-2) ;
      c =-d1*ones(1,nx-2) ;
      b =(1+2*d1)*ones(1,nx-2) ;
      d = d2*(T(2:nx-1,j+1)+T(2:nx-1,j-1))+(1.0-2.0*d2)*T(2:nx-1,j);
%       d =d2*T(j,3:nx)+d2*T(j,1:nx-2)+(1-2*d2)*T(j,2:nx-1) ;
      % Apply Boundary Conditions
      d(1)   = d(1)   -a(1)*T(1,j) ;
      d(end) = d(end) -c(end)*T(end,j) ;
      %--------------------------Call TDMA
         T(2:nx-1,j)=TDMA(a,b,c,d);
    end

%     Sweep y
    for i=2:nx-1
%         Coefficients
      a =-d2*ones(1,ny-2) ;
      c =-d2*ones(1,ny-2);
      b =(1+2*d2)*ones(1,ny-2) ;
      d = d1*(T(i+1,2:ny-1)+T(i-1,2:ny-1))+(1.0-2.0*d1)*T(i,2:ny-1);
%       d =d1*T(3:nx,i)+d1*T(1:nx-2,i)+(1-2*d1)*T(2:nx-1,i)  ;
      d=d';
      % Apply Boundary conditions
      d(1)   = d(1)   -a(1)*T(i,1);
      d(end) = d(end) - c(end)*T(i,end) ;
%       %--------------------------Call TDMA
      T(i,2:ny-1) = TDMA(a,b,c,d);      
    end

  end
end