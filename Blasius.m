%clear workspace and screen
clc
clear all
%boundry conditions and finite element definition
deltaeta=0.1;
f(1)=0;
fp(1)=0;
fpp(1)=0.0;
fpfinal=0
%a loop to attribution a good value to fpp boundry condition
while (abs(fpfinal-1)>=0.001)
    fpp(1)=fpp(1)+0.001;
imax=100;
%a loop to solve equations
for i=2:1:imax;
f(i)=f(i-1)+fp(i-1)*deltaeta;
fp(i)=fp(i-1)+fpp(i-1)*deltaeta;
fpp(i)=fpp(i-1)-fpp(i-1).*f(i-1)*deltaeta/2
end
fpfinal=fp(100);
end
% plotting fp as a function of eta
i=1:100;
eta=i*deltaeta;
subplot(3,1,1)
plot(f,eta);
xlabel("f");
ylabel("eta")
subplot(3,1,2)
plot(fp,eta);
xlabel("fp");
ylabel("eta")
subplot(3,1,3)
plot(fpp,eta);
xlabel("fpp");
ylabel("eta")
grid on;
