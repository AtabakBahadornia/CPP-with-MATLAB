function e=err(uexact,unumerical,ny)
e=0;
for i=1:ny-1
   e=e+abs((uexact(i,1)-unumerical(i,1)))*100;
end
e=e/ny;

