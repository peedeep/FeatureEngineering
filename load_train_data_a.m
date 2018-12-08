clear; clc;

%% load train data a
train_a_dir = dir('.\train_a\Train_A\*.csv');
dir_length = length(train_a_dir);
A_X = [];

for i = 1:dir_length
    file_name = ['.\train_a\Train_A\', train_a_dir(i).name];
    disp(file_name);
    A_X(i,:) = feature_explore(file_name);
end

A_Y = csvread('.\train_a\Train_A_wear.csv', 1);
A_Y = A_Y(:, 2:end);

writetable(table([A_X A_Y]), './data/TrainDataA.csv')
save('TrainDataA');