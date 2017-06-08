%anal('piece/VNNOF51.WAV',0)
filename=['AFF';'AFM';'AFP';'RFF';'RFM';'RFP'];
content=zeros(2136,21);
k=1;

    
for i=1:6
    for j=10:70
        for x=111:113
            directory=['../MusicData/AcousticGuitar-piece/',int2str(x),'/AG',filename(i,:),int2str(j),'.WAV'];
            D=dir(directory);
            if(D.bytes>40000)
                t=anal(directory);
                content(k,1:20)=t;
                content(k,21)=0;
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
                t=anal(directory);
                content(k,1:20)=t;
                content(k,21)=1;
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
                t=anal(directory);
                content(k,1:20)=t;
                content(k,21)=2;
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
            %fprintf('%s\n',directory);
            D=dir(directory);
            if(D.bytes>40000)
                t=anal(directory);
                content(k,1:20)=t;
                content(k,21)=3;
                k=k+1;
            end
        end
    end
end
fprintf('piano\n');
filename=['NOF';'NOM';'STF';'STM'];
for i=1:4
    for j=7:25
        for x=211:212
            directory=['../MusicData/Trumpet-piece/',int2str(x),'/TR',filename(i,:),int2str(j),'.WAV'];
            D=dir(directory);
            if(D.bytes>40000)
                t=anal(directory);
                content(k,1:20)=t;
                content(k,21)=4;
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
                t=anal(directory);
                content(k,1:20)=t;
                content(k,21)=5;
                k=k+1;
            end
        end
    end
end
fprintf('violin\n');


save('TrainData.mat','content');