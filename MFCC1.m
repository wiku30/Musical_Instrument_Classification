function MFCC1( filename,time )
%UNTITLED 读取输入的音频，做MFCC并输出12个参数的图，time单位为毫秒。
%  在时间为time出截取256个sample求MFCC，time单位为毫秒。
% MFCC implement with Matlab %  
[x,fs]=audioread(filename);
x=x(:,1);
x(1:round(fs*time/1000))=[];
bank=melbankm(24,256,fs,0,0.4,'t'); %Mel滤波器的阶数为24，FFT变换的长度为256，采样频率为16000Hz  
%归一化Mel滤波器组系数  
bank=full(bank); %full() convert sparse matrix to full matrix  
bank=bank/max(bank(:));  
for k=1:12  
    n=0:23;  
    dctcoef(k,:)=cos((2*n+1)*k*pi/(2*24));  
end  
w=1+6*sin(pi*[1:12]./12);%归一化倒谱提升窗口  
w=w/max(w);%预加重滤波器  
xx=double(x);  
xx=filter([1-0.9375],1,xx);%语音信号分帧  
xx=xx(1:256);%对xx 256点分为一帧 
%计算每帧的MFCC参数   
s=xx.*hamming(256);  
t=abs(fft(s) );%FFT快速傅里叶变换  
t=t.^2;  
c1=dctcoef*log(bank*t(1:129));  
c2=c1.*w';  
m(1,:)=c2;   
plot(1:12,m);
end

