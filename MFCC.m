function m=MFCC( xx, fs, time )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% MFCC implement with Matlab %  
width=4096;
xx=xx((time*fs+1):(time*fs+width));
bank=melbankm(24,width,fs); %Mel�˲����Ľ���Ϊ24��FFT�任�ĳ���Ϊ256������Ƶ��Ϊ16000Hz  
%��һ��Mel�˲�����ϵ��  
bank=full(bank); %full() convert sparse matrix to full matrix  
bank=bank/max(bank(:)); 
dctcoef=zeros(12,24);
for k=1:12  
    n=0:23;  
    dctcoef(k,:)=cos((2*n+1)*k*pi/(2*24));  
end  
w=1+6*sin(pi*[1:12]./12);%��һ��������������  
w=w/max(w);%Ԥ�����˲���  

%����ÿ֡��MFCC����    
    s=xx.*hamming(width);  
    t=abs(fft(s));%FFT���ٸ���Ҷ�任  
    t=t.^2;  
    c1=dctcoef*log(bank*t(1:(width/2+1)));  
    m=c1.*w';  

end

