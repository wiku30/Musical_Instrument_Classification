function makeMovie(filename)

load('Model.mat');
[xx,fs]=audioread(filename);
xx=xx(:,1);
xx=resample(xx,44100,fs);
fs=44100;
l=round(length(xx)/4410)-10;







figure %�½�һ��ͼ
axis off
axis([0 5 -1 6]);%����x�ᣨ��0��5����y��ķ�Χ����0��2��
set(gcf, 'position', [0 0 1100 1000]);

ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'down')
II=imread('photo/Star04.jpg');
image(II)
colormap gray
set(ha,'handlevisibility','off','visible','off');

set(gca,'color','none') %������ǰ�Լ�û��ע��


ins(1)=text(0.2,0,'Guitar','fontsize',60,'color','white');
ins(2)=text(0.2,1,'Sax','fontsize',60,'color','white');
ins(3)=text(0.2,2,'Flute','fontsize',60,'color','white');
ins(4)=text(0.2,3,'Piano','fontsize',60,'color','white');
ins(5)=text(0.2,4,'Trumpet','fontsize',60,'color','white');
ins(6)=text(0.2,5,'Violin','fontsize',60,'color','white');
t(1)=text(0.5,1,'Start','fontsize',80,'color','white');
t(2)=text(0.5,1,'Start','fontsize',80,'color','white');
t(3)=text(0.5,1,'Start','fontsize',80,'color','white');
t(4)=text(0.5,1,'Start','fontsize',80,'color','white');
t(5)=text(0.5,1,'Start','fontsize',80,'color','white');
t(6)=text(0.5,1,'Start','fontsize',80,'color','white');
prediction=zeros(1,l);

sound(xx,44100);
tic;
for i=1:l
    
    vec=anal(xx,fs,i*0.1);
    pred=predict(Mdl,vec);
    prediction(1,i)=pred;
    num=zeros(1,6);
    for j=0:9
        if (i-j)>0
            num(prediction(i-j)+1)=num(prediction(i-j)+1)+1;
        end
    end
    delete(t);
    for j=1:6
        n=' ';
        for k=1:num(j)
            n(1,k)='+';
        end
        t(j)=text(2.5,j-1,n,'fontsize',60,'color','white');
    end
    while(toc < 0.1 * i)
        pause(0.01);
    end
    
end

delete(t);
delete(ins)
end



