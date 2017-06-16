%anal('piece/VNNOF51.WAV',0)
filename=['AFF';'AFM';'AFP';'RFF';'RFM';'RFP'];
dimension=32;
content=zeros(2136,dimension+1);
k=1;
time=0.2;
    
for i=1:6
    for j=10:70
        for x=111:113
            directory=['../MusicData/AcousticGuitar-piece/',int2str(x),'/AG',filename(i,:),int2str(j),'.WAV'];
            D=dir(directory);
            if(D.bytes>40000)
                [xx,fs]=audioread(directory);
                t=anal2(xx,fs,time);
                content(k,1:dimension)=t;
                content(k,dimension+1)=0;
                k=k+1;
            end
        end
    end
end
fprintf('guitar\n');

filename=['NOF';'NOM';'STF';'STM'];
for i=1:4
    for j=7:27
        for x=262:263
            directory=['../MusicData/AltoSaxophone-piece/',int2str(x),'/AS',filename(i,:),int2str(j),'.WAV'];
            D=dir(directory);
            if(D.bytes>40000)
                [xx,fs]=audioread(directory);
                t=anal2(xx,fs,time);
                content(k,1:dimension)=t;
                content(k,dimension+1)=1;
                k=k+1;
            end
        end
    end
end
fprintf('sax\n');




filename=['NOF';'NOM';'STF';'STM'];
for i=1:4
    for j=7:30
        for x=331:332
            directory=['../MusicData/Flute-piece/',int2str(x),'/FL',filename(i,:),int2str(j),'.WAV'];
            D=dir(directory);
            if(D.bytes>40000)
                [xx,fs]=audioread(directory);
                t=anal2(xx,fs,time);
                content(k,1:dimension)=t;
                content(k,dimension+1)=2;
                k=k+1;
            end
        end
    end
end
fprintf('flute\n');


filename=['NOF';'NOM';'NOP';'PEF';'PEM';'PEP';'STF';'STM';'STP'];
for i=1:9
    for j=10:75
        for x=11:11
            directory=['../MusicData/Piano-piece/0',int2str(x),'/PF',filename(i,:),int2str(j),'.WAV'];
            D=dir(directory);
            if(D.bytes>40000)
                [xx,fs]=audioread(directory);
                t=anal2(xx,fs,time);
                content(k,1:dimension)=t;
                content(k,dimension+1)=3;
                k=k+1;
            end
        end
    end
end
fprintf('piano\n');
filename=['NOF';'NOM';'STF';'STM';'M7F';'M7M';'M7P';'M8F';'M8M';'M8P';'M9F';'M9M';'M9P'];
for i=1:4
    for j=7:25
        for x=211:212
            directory=['../MusicData/Trumpet-piece/',int2str(x),'/TR',filename(i,:),int2str(j),'.WAV'];
            D=dir(directory);
            if(D.bytes>40000)
                [xx,fs]=audioread(directory);
                t=anal2(xx,fs,time);
                content(k,1:dimension)=t;
                content(k,dimension+1)=4;
                k=k+1;
            end
        end
    end
end
fprintf('trumpet\n');
filename=['NOF';'NOM';'NOP';'NVM';'SPF';'SPM';'SPP'];
for i=1:7
    for j=5:55
        for x=151:151
            directory=['../MusicData/Violin-piece/',int2str(x),'/VN',filename(i,:),int2str(j),'.WAV'];
            D=dir(directory);
            if(D.bytes>40000)
                [xx,fs]=audioread(directory);
                t=anal2(xx,fs,time);
                content(k,1:dimension)=t;
                content(k,dimension+1)=5;
                k=k+1;
            end
        end
    end
end
fprintf('violin\n');


save('TrainData_ori.mat','content');