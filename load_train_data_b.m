clear; clc;

%% load train data b
train_b_dir = dir('.\train_b\Train_B\*.csv');
dir_length = length(train_b_dir);
B_X = [];

for i = 1:dir_length
    file_name = ['.\train_b\Train_B\', train_b_dir(i).name];
    disp(file_name);
    B_X(i,:) = feature_explore(file_name);
end

B_Y = csvread('.\train_b\Train_B_wear.csv', 1);
B_Y = B_Y(:, 2:end);

writetable(table([B_X B_Y]), './data/TrainDataB.csv')
save('TrainDataB');