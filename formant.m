function  [slope,delta]=formant( filename )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
[x,fs]=audioread(filename);
x=x(:,1);
xx=hamming(4096).*x(0.4*fs:(0.4*fs+4095),1);

y=log(abs(fft(xx)));

ceps=fft(y);

ceps(21:4076,1)=0;
profile=real(ifft(ceps));

ylim([-7,0]);
plot(1:4096,profile);
ylim([-7,0]);


i=1;
while(i<4000)
    if(profile(i+10) < profile(i))
        break;
    end
    i=i+10;
end
X=zeros(1000,2);
for i=1:1000
    X(i,1)=i;
    X(i,2)=1;
end

[B,~,R]=regress(profile(i:i+1000),X);
slope=B(1);
delta=sqrt(R'*R);
end

