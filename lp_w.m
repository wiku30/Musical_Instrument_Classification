function [ar]=lp_w(file,time,varargin)
    [wav,fs]=audioread(file);
    wav = wav(:,1);
    if nargin>=3
        lvl=varargin{1};
    else
        lvl=12;
    end
    l=length(time);
    ar = zeros (l,lvl+1);
    for i = 1:length(time)
        t = time(i);
        if(round((t+0.1)*fs)>length(wav))
            break;
        end
        window = round(t*fs+1):round((t+0.1)*fs);
        [ar(i,:),~,~]=lpcauto(wav(window),lvl);
    end
end