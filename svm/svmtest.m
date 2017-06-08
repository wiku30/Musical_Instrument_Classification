traindata = [0 0;0 1;2 1;1 3;1.5 0;3 4;4 3;5 1];
type = [0 0 0 0 1 1 1 1];
svm = svmtrain(traindata, type, 'ShowPlot', true);
test = [1 1; 3 3];
groups = svmclassify(svm, test, 'ShowPlot', true);