function makeMovie(filename)

load('Model.mat');
[xx,fs]=audioread(filename);
xx=xx(:,1);
xx=resample(xx,44100,fs);
fs=44100;
l=round(length(xx)/4410)-10;


sound(xx,44100);




figure %新建一张图
axis off
axis([0 5 -1 6]);%定义x轴（从0到5）和y轴的范围（从0到2）
set(gcf, 'position', [0 0 1000 1000]);
ins(1)=text(0.2,0,'Guitar','fontsize',60,'color','black');
ins(2)=text(0.2,1,'Sax','fontsize',60,'color','black');
ins(3)=text(0.2,2,'Flute','fontsize',60,'color','black');
ins(4)=text(0.2,3,'Piano','fontsize',60,'color','black');
ins(5)=text(0.2,4,'Trumpet','fontsize',60,'color','black');
ins(6)=text(0.2,5,'Violin','fontsize',60,'color','black');
t(1)=text(0.5,1,'Start','fontsize',80,'color','black');
t(2)=text(0.5,1,'Start','fontsize',80,'color','black');
t(3)=text(0.5,1,'Start','fontsize',80,'color','black');
t(4)=text(0.5,1,'Start','fontsize',80,'color','black');
t(5)=text(0.5,1,'Start','fontsize',80,'color','black');
t(6)=text(0.5,1,'Start','fontsize',80,'color','black');
prediction=zeros(1,l);


for i=1:l
    tic;
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
        t(j)=text(2.5,j-1,n,'fontsize',60,'color','black');
    end
    pause(0.1-toc);
end

delete(t);
delete(ins)
end



