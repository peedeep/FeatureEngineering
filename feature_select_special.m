clc; clear;

%load('AllData.mat');
%[c1f, c2f, c3f] = feature_p_values(X((1:230), :), Y((1:230), :));

load('TrainDataA.mat');
load('TestData.mat');
[c1f, c2f, c3f] = feature_p_values(A_X, A_Y);
X = A_X;
Y = A_Y;

flute1TrainX = X(:, c1f);
flute2TrainX = X(:, c2f);
flute3TrainX = X(:, c3f);

flute1TestX = T_X(:, c1f);
flute2TestX = T_X(:, c2f);
flute3TestX = T_X(:, c3f);

writetable(table([flute1TrainX Y(:,1)]), './data/TrainFlute1.csv') ;
writetable(table([flute2TrainX Y(:,2)]), './data/TrainFlute2.csv') ;
writetable(table([flute3TrainX Y(:,3)]), './data/TrainFlute3.csv') ;

writetable(table(flute1TestX), './data/TestFlute1.csv') ;
writetable(table(flute2TestX), './data/TestFlute2.csv') ;
writetable(table(flute3TestX), './data/TestFlute3.csv') ;

save('data');