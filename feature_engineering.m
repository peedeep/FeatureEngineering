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

writetable(table([A_X A_Y]), 'TrainDataA.csv')
%save('TrainDataA');

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

writetable(table([B_X B_Y]), 'TrainDataB.csv')
%save('TrainDataB');

%% load train data a&b
X = [A_X; B_X];
Y = [A_Y; B_Y];

%save('TrainData');
writetable(table([X Y]), 'TrainData.csv')

%% load test data
test_dir = dir('.\test\*.csv');
dir_length = length(train_b_dir);
T_X = [];

for i = 1:dir_length
    file_name = ['.\test\', test_dir(i).name];
    disp(file_name);
    T_X(i,:) = feature_explore(file_name);
end

%save('TestData');
writetable(table(T_X), 'TestData.csv')

save('AllData');