function vec = anal(filename)
    [lpc,lpmag]=lp_w(filename,0.2);
    vec=zeros(1,20);
    vec(1:13) = lpc; % 1-13: normalized LPC
    vec(14) = lpmag; % 14:   LPC magnitude
    [~,~,pk] = ceps(filename,0.2);
    pkmag = pk(:,2);
    for(i=1:min(4,length(pkmag)))
        vec(14+i)=pkmag(i);
    end             % 15-18: cepstrum peaks
    [sl,r] = formant(filename);
    vec(19)=sl;
    vec(20)=r;      % 19-20: spectral outline
end