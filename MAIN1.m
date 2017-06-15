function MAIN1()
dimension=32;
time=0.2;
content=zeros(7564,dimension+1);
basedir='../MusicData/';
row=1;


folder=dir(fullfile([basedir,'*-piece']));
for i=1:6
    foldername=[folder(i).name,'/'];
    subfolder=dir(fullfile([basedir,foldername]));
    s=size(subfolder);
    for j=1:s(1)
        subfoldername=[subfolder(j).name,'/'];
        if subfoldername(1)=='.'
            continue;
        end
        wavfile=dir(fullfile([basedir,foldername,subfoldername],'*.WAV'));
        s=size(wavfile);
        for k=1:s(1)
            filename=wavfile(k).name;
            if wavfile(k).bytes<40000
                continue;
            end
            [xx,fs]=audioread([basedir,foldername,subfoldername,filename]);
            if fs~=44100
                xx=resample(xx,44100,fs);
                fs=44100;
            end
            t=anal(xx,fs,time);
            content(row,1:dimension)=t;
            content(row,dimension+1)=instr2int(foldername);
            row=row+1;
        end
        fprintf([basedir,foldername,subfoldername,'\n']);
    end
end
   
save('AllTrainData.mat','content');

end




function i=instr2int(foldername)
    if foldername(1:2)=='Ac'
        i=0;
        return;
    end
    if foldername(1:2)=='Al'
        i=1;
        return;
    end
    if foldername(1:2)=='Fl'
        i=2;
        return;
    end
    if foldername(1:2)=='Pi'
        i=3;
        return;
    end
    if foldername(1:2)=='Tr'
        i=4;
        return;
    end
    if foldername(1:2)=='Vi'
        i=5;
        return;
    end
end
            
            
        