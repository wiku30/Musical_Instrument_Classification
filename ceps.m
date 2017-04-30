function varargout=ceps(varargin)
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
    logamp=log(abs(freq));
    cp=abs(ifft(logamp));
    plot(0:1/n:1-1/n,cp(1:n));
    varargout{1}=cp;
    xlim([0.002,0.1]); % base: 100-5000Hz
    ylim([0,0.7]);
    if(nargout>=2)
        varargout{2}(1)=mean(varargout{1}(round(0.005*n):round(0.1*n)));
    end
end