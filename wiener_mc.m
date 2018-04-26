close all;
clear all;
N=1e4;
p11=0.2;p12=0.3;p13=0.2;p14=0.3;
p21=0.4;p22=0.1;p23=0.3;p24=0.2;
p31=0.1;p32=0.2;p33=0.4;p34=0.3;
p41=0.3;p42=0.3;p43=0.1;p44=0.3;
P = [p11,p12,p13,p14;p21,p22,p23,p24;p31,p32,p33,p34;p41,p42,p43,p44];
mc=dtmc(P);
xmc = simulate(mc,(N-1));
xmc(xmc==4)=20;
xmc(xmc==3)=10;
xmc(xmc==2)=5;

xmc=transpose(xmc);
w=randn(1,N);
y=xmc+w;
figure();
plot(y);



[Syy,w]= pyulear(y,10,length(y),'twosided');

H=(Syy-min(Syy))./Syy;


MX = zeros(1,length(y));
YFFT= fft(y,length(y));
for i=1:length(y)
    MX(i)=YFFT(i)*H(i);
end
mx=ifft(MX,length(y));


figure();
subplot(3,1,1);
stairs(xmc(1:200));
subplot(3,1,2);
stairs(y(1:200));
subplot(3,1,3);
stairs(mx(1:200));
%filtered_y = filter(H,1,y);
