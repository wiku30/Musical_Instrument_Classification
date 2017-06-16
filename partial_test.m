clear;
load('TrainData2.mat');

rand('seed', 0.618);
dim=32;
num1=0;
num2=0;
trainData=zeros(10,dim+1);
testData=zeros(10,dim+1);

for i=1:length(content)
    content(i,1:5)=0;
    content(i,8:32)=0;
    if(rand()<0.5)
        num1=num1+1;
        trainData(num1,:)=content(i,:);
    else
        num2=num2+1;
        testData(num2,:)=content(i,:);
    end
    
end


num = zeros(6,1);
for i=1:length(trainData)
    num(trainData(i,dim+1)+1)=num(trainData(i,dim+1)+1)+1;
end

numtest = zeros(6,1);
for(i=1:length(testData))
    numtest(testData(i,dim+1)+1)=numtest(testData(i,dim+1)+1)+1;
end

for(i=1:6)
    for(j=1:6)
        if(i~=j)
            cost(i,j)=(num(i))^-1;
        end
    end
end



t = templateSVM('Standardize',1);

Mdl=fitcecoc(trainData(:,1:dim),trainData(:,dim+1),'Learners',t,'Cost',cost);
label = testData(:,dim+1);

pred = predict(Mdl,testData(:,1:dim));
confMat = confusionmat(label, pred);
for(i=1:6)
    aconfMat(i,:)=confMat(i,:)/numtest(i);
end
%save('Model2.mat','Mdl');

confMat
aconfMat
trace(aconfMat)/6