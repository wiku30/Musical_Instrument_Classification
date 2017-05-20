%   ar: LPC shape   
%   mag: LPC magnitude
%       The features of mag can show some differences between 
%   instruments.
%       For piano mag decays with time, for violin and sax
%   the magnitude differs.
%
%   Cepstrum feature: 
%       piano:  low peaks
%       violin: high decaying peaks
%       sax:    high peaks with less decay

function lptest(file)
    
    [ar,mag] = lp_w(file,[0.2 0.6]);
    set(gcf, 'position', [0 0 600 1000]);
    for i=1:2
        if(length(mag)<i)
            continue;
        end
        subplot(3,1,i);
        
        plot(ar(i,:));
        text(2,0,num2str(mag(i)));
        ylim([-3,3]);
    end
    subplot(3,1,3);
    pk=zeros(1,2);
    [cp,m,pk]=ceps(file,0.2);
    title(file);
end