function MFCC1( filename,time )
%UNTITLED ��ȡ�������Ƶ����MFCC�����12��������ͼ��time��λΪ���롣
%  ��ʱ��Ϊtime����ȡ256��sample��MFCC��time��λΪ���롣
% MFCC implement with Matlab %  
[x,fs]=audioread(filename);
x=x(:,1);
x(1:round(fs*time/1000))=[];
bank=melbankm(24,256,fs,0,0.4,'t'); %Mel�˲����Ľ���Ϊ24��FFT�任�ĳ���Ϊ256������Ƶ��Ϊ16000Hz  
%��һ��Mel�˲�����ϵ��  
bank=full(bank); %full() convert sparse matrix to full matrix  
bank=bank/max(bank(:));  
for k=1:12  
    n=0:23;  
    dctcoef(k,:)=cos((2*n+1)*k*pi/(2*24));  
end  
w=1+6*sin(pi*[1:12]./12);%��һ��������������  
w=w/max(w);%Ԥ�����˲���  
xx=double(x);  
xx=filter([1-0.9375],1,xx);%�����źŷ�֡  
xx=xx(1:256);%��xx 256���Ϊһ֡ 
%����ÿ֡��MFCC����   
s=xx.*hamming(256);  
t=abs(fft(s) );%FFT���ٸ���Ҷ�任  
t=t.^2;  
c1=dctcoef*log(bank*t(1:129));  
c2=c1.*w';  
m(1,:)=c2;   
plot(1:12,m);
end

