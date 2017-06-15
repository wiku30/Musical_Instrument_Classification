function m=MFCC( xx, fs, time )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
% MFCC implement with Matlab %  
width=4096;
xx=xx((time*fs+1):(time*fs+width));
bank=melbankm(24,width,fs); %Mel滤波器的阶数为24，FFT变换的长度为256，采样频率为16000Hz  
%归一化Mel滤波器组系数  
bank=full(bank); %full() convert sparse matrix to full matrix  
bank=bank/max(bank(:)); 
dctcoef=zeros(12,24);
for k=1:12  
    n=0:23;  
    dctcoef(k,:)=cos((2*n+1)*k*pi/(2*24));  
end  
w=1+6*sin(pi*[1:12]./12);%归一化倒谱提升窗口  
w=w/max(w);%预加重滤波器  

%计算每帧的MFCC参数    
    s=xx.*hamming(width);  
    t=abs(fft(s));%FFT快速傅里叶变换  
    t=t.^2;  
    c1=dctcoef*log(bank*t(1:(width/2+1)));  
    m=c1.*w';  

end

