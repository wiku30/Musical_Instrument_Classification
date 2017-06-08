load('TrainData.mat');

num1=0;
num2=0;
trainData=zeros(10,21);
testData=zeros(10,21);
for(i=1:length(content))
    if(rand()<0.5)
        num1=num1+1;
        trainData(num1,:)=content(i,:);
    else
        num2=num2+1;
        testData(num2,:)=content(i,:);
    end
    
end


num = zeros(6,1);
for(i=1:length(trainData))
    num(trainData(i,21)+1)=num(trainData(i,21)+1)+1;
end

numtest = zeros(6,1);
for(i=1:length(testData))
    numtest(testData(i,21)+1)=numtest(testData(i,21)+1)+1;
end

for(i=1:6)
    for(j=1:6)
        if(i~=j)
            cost(i,j)=(num(i))^-1;
        end
    end
end



t = templateSVM('Standardize',1);

Mdl=fitcecoc(trainData(:,1:20),trainData(:,21),'Learners',t,'Cost',cost);
label = testData(:,21);

pred = predict(Mdl,testData(:,1:20));
confMat = confusionmat(label, pred);
for(i=1:6)
    aconfMat(i,:)=confMat(i,:)/numtest(i);
end
confMat
aconfMat
trace(aconfMat)/6