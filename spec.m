function [L]=spec(filename)
    [in1,fs]=audioread(filename);
    n=round(fs*0.1);
    sig=in1(:,1);
    freq=fft(sig,n);
    amp=abs(freq);
    plot(0:fs/n:fs-0.1,amp);
    xlim([0,5000]);
    %set(gca,'YScale','log');

    thre1=4;

    cnt=0;
    sum=0;
    L=zeros(1,2);
    glbavg=mean(amp(1:500));

    for i=4:497
       av(i)=mean(amp(i-3:i+3));
    end

    for i=11:490
        avmin(i)=min(av(i-7:i+7));
    end

    for i=11:490
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