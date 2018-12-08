clear; clc;

%% load train data a&b
load('TrainDataA');
load('TrainDataB');

X = [A_X; B_X];
Y = [A_Y; B_Y];

save('TrainData');
writetable(table([X Y]), './data/TrainData.csv')