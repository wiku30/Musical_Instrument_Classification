function makeMovie(str)

figure %�½�һ��ͼ
axis off
axis([0 5 0 2])%����x�ᣨ��0��5����y��ķ�Χ����0��2��
l=length(str);
t=text(0.5,1,'Start','fontsize',80,'color','black');
pause(1);
for i=1:l
    tic;
    delete(t);
    if str(i)=='V'
        t=text(0.5,1,'Violin','fontsize',80,'color','black');%i=1ʱ��дһ�����١���
    end
    if str(i)=='G'
        t=text(0.5,1,'Guitar','fontsize',80,'color','black');%i=1ʱ��дһ�����١���
    end
    if str(i)=='F'
        t=text(0.5,1,'Flute','fontsize',80,'color','black');%i=1ʱ��дһ�����١���
    end
    if str(i)=='S'
        t=text(0.5,1,'Saxophone','fontsize',80,'color','black');%i=1ʱ��дһ�����١���
    end
    if str(i)=='P'
        t=text(0.5,1,'Piano','fontsize',80,'color','black');%i=1ʱ��дһ�����١���
    end
    if str(i)=='T'
        t=text(0.5,1,'Trumpet','fontsize',80,'color','black');%i=1ʱ��дһ�����١���
    end
    pause(0.1-toc);
end

delete(t);
end



