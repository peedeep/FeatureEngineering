clc; clear;

%% load test data
test_dir = dir('.\test\*.csv');
dir_length = length(test_dir);
T_X = [];

for i = 1:dir_length
    file_name = ['.\test\', test_dir(i).name];
    disp(file_name);
    T_X(i,:) = feature_explore(file_name);
end

save('TestData');
writetable(table(T_X), 'TestData.csv')