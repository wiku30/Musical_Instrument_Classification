clear;
load('Model.mat');
<<<<<<< HEAD
[xx,fs]=audioread('../canon1.mp3');
xx=xx(:,1);
xx=resample(xx,44100,fs);
fs=44100;
l=round(length(xx)/4410)-10;
vec=zeros(l,32);
for i=1:l
    vec(i,:)=anal(xx,fs,i*0.1);
=======
[xx,fs]=audioread('pre_music/kiminona.mp3');
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
>>>>>>> e2257d6c844ecd2fe07018833c3b033061cdac0b
end
pred=predict(Mdl,vec);
name=['Gui';'Sax';'Flu';'Pia';'Tru';'Vio'];
for i=1:l
    np(i)=name(round(pred(i))+1);
end
sound(xx,44100);
makeMovie(np);

    
    
    