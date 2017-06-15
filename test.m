load('Model.mat');
[xx,fs]=audioread('../Hatsukoi.mp3');
xx=xx(:,1);
xx=resample(xx,44100,fs);
fs=44100;
length=1000;
vec=zeros(length,32);
for i=1:length
    vec(i,:)=anal(xx,fs,i*0.1);
end
pred=predict(Mdl,vec);
name=['Gui';'Sax';'Flu';'Pia';'Tru';'Vio'];
for i=1:length
    np(i)=name(round(pred(i))+1);
end
np

    
    
    