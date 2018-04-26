%periodogram(x,[],'twosided',512,fs)
%s=periodogram(x,[],512,fs)
w = randn(1,length(x));
y = x + w;

[Syy,w]= pyulear(y,10,length(y),'twosided');

H=(Syy-min(Syy))./Syy;

plot(H)

MX = zeros(1,length(x));
YFFT= fft(y,length(y));
for i=1:length(x)
    MX(i)=YFFT(i)*H(i);
end
mx=ifft(MX,length(x));
%filtered_y = filter(H,1,y);
