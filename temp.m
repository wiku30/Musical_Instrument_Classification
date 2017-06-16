load('AllTrainData.mat');
load('Model.mat');
testData=content(:,1:32);
label=content(:,33);
pred = predict(Mdl,testData);
confMat = confusionmat(label, pred);


numtest = zeros(6,1);
for(i=1:length(label))
    numtest(label(i)+1)=numtest(label(i)+1)+1;
end


for i=1:6 
    aconfMat(i,:)=confMat(i,:)/numtest(i);
end

confMat
aconfMat
trace(aconfMat)/6