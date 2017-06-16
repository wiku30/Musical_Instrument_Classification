function vec = anal2(xx, fs, time)
    [lpc,lpmag]=lp_ori(xx, fs, time);
    vec=zeros(1,20);
    vec(1:13) = lpc(1:13); % 1-13: normalized LPC
    vec(14) = lpmag; % 14:   LPC magnitude
    [~,~,pk] = ceps(xx, fs, time);
    pkmag = pk(:,2);
    for i=1:min(4,length(pkmag))
        vec(14+i)=pkmag(i);
    end             % 15-18: cepstrum peaks
    [sl,r] = formant(xx, fs, time);
    vec(19)=sl;
    vec(20)=r;      % 19-20: spectral outline
    vec(21:32)=MFCC(xx, fs, time);
end