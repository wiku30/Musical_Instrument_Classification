function [ar,mag]=lp_w(file,time,varargin)
    [wav,fs]=audioread(file);
    wav = wav(:,1);
    if nargin>=3
        lvl=varargin{1};
    else
        lvl=12;
    end
    l=length(time);
    ar = zeros (l,lvl+1);
    mag=0;
    for i = 1:length(time)
        t = time(i);
        if(round((t+0.2)*fs)>length(wav))
            break;
        end
        window = round(t*fs+1):round((t+0.1)*fs);
        lp_origin = lpcauto(wav(window),lvl);
        %lp_origin = lp_origin(2:lvl+1);
        mag(i) = rms(lp_origin);
        lp_norm = (lp_origin - ones(1,lvl+1)*mean(lp_origin))./mag(i);
        ar(i,:) = lp_norm ;
    end
end