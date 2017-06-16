clear;
load('Model.mat');

[xx,fs]=audioread('../canon1.mp3');
xx=xx(:,1);
xx=resample(xx,44100,fs);
fs=44100;

interval = 0.2;
aaa=size(xx,1);

length=round(aaa/44100/interval-2);
vec=zeros(length,32);
np=('');
for i=1:length
    vec(i,:)=anal(xx,fs,i*0.2);
end
pred=predict(Mdl,vec);
name=['Gui';'Sax';'Flu';'Pia';'Tru';'Vio'];
for i=1:length
    np(i)=name(round(pred(i))+1);
end
np

    
    
    