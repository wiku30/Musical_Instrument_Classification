function  formant( filename )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
[x,fs]=audioread(filename);
x=x(:,1);
xx=hamming(4096).*x(0.2*fs:(0.2*fs+4095),1);

y=log(abs(fft(xx)));
%y=y-min(y);
%figure(1);
%plot(1:1024,y);
ceps=fft(y);

ceps(31:4066,1)=0;
profile=real(ifft(ceps));
%figure(2);
ylim([-7,0]);
plot(1:4096,profile);
ylim([-7,0]);
%figure(3)
%plot(1:1024,y-profile);
end

