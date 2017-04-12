function [L]=spec(varargin)
    filename=varargin{1};

    [in1,fs]=audioread(filename);
    n=round(fs*0.1);
    if(nargin<=1)
        range=1:n;
    else
        range = round(fs*varargin{2}+1) : round(fs*varargin{2}+n) ; 
    end
    sig=in1(range,1);
    for i=1:n
        sig(i)=sig(i)*power(sin(i/n*pi),2); %±ÜÃâ±ßÔµÃ«´Ì
    end
    freq=fft(sig,n);
    amp=abs(freq);
    set(gcf, 'position', [0 0 600 1000]);
    subplot(2,1,1);
    plot(0:fs/n:fs-0.1,amp);
    xlim([0,8000]);
    subplot(2,1,2);
    plot(0:fs/n:fs-0.1,amp);
    xlim([0,8000]);
    set(gca,'YScale','log');

    thre1=4;

    cnt=0;
    sum=0;
    L=zeros(1,2);
    glbavg=mean(amp(1:800));

    for i=4:797
       av(i)=mean(amp(i-3:i+3));
    end

    for i=11:790
        avmin(i)=min(av(i-7:i+7));
    end

    for i=11:790
        ma=max(amp(i-5:i+5));
        if ma==amp(i) && ma>=thre1*avmin(i) && ma>glbavg
            cnt=cnt+1;
            L(cnt,1)=(i-1)*10;
            L(cnt,2)=av(i);
            sum=sum+av(i);
            %L(cnt,3)=ma/avmin(i);
            %L(cnt,4)=amp(i)/glbavg;
        end
    end

    for i=1:cnt
        L(i,2)=L(i,2)/sum*100;
    end