%% Exercise 1: Linear regression with multiple variables

%% ================ 1.Feature Normalization ================
clear; close all; clc

fprintf('Loading data ...\n');

load('selectedData.mat');

p = (1:314);%选择训练样本数量
Y = Y(p, :);
m = size(Y, 1);%训练样本个数
flute_size = size(Y, 2);%刀片数量
pred = zeros(size(T_X, 1), flute_size);

%% ================ 2.Gradient Descent Train ================
for f = 1:flute_size
    if f == 1
        X = flute1TrainX(p,:);
        T_X = flute1TestX;
    elseif f == 2
        X = flute2TrainX(p,:);
        T_X = flute2TestX;
    elseif f == 3
        X = flute3TrainX(p,:);
        T_X = flute3TestX;
    end
    disp(f)
    
    y = Y(:,f);
    
    %% nn train
    [inputn, inputps] = mapminmax(X');
    [outputn, outputps] = mapminmax(y');
    net = newff(inputn, outputn, 20,  {'logsig', 'purelin'});
    
    net = train(net, inputn, outputn);
    
    inputn_test = mapminmax('apply', T_X', inputps);
    an = sim(net, inputn_test);
    BPoutput = mapminmax('reverse', an', outputps);
    %pred(:, f) = BPoutput; 
    
    %% 测试数据均方误差（MSE）
    train_y = sim(net, inputn);
    train_y_value(:, f) = mapminmax('reverse', train_y', outputps);
    
    %net = newff(X', y', [9], {'logsig', 'purelin'});
    %net.trainParam.epochs = 1000;
    %net.trainParam.lr = 0.1;
    %net.trainParam.goal = 0.00004;
    %net = train(net, X', y');
    %an = sim(net, T_X');
    %pred(:, f) = an';
    
    %initial_wear = [62 55 50];
    initial_wear = [62.7 9.89 14.6];
    if isAdditional
        pred(:, f) = nnPredict(BPoutput, initial_wear(f));
    else
        pred(:, f) = BPoutput;
    end
    
    if isAdditional
        fprintf('flute1 Train set 均方误差（MSE）: %f\n', sum((train_y_value(:, f) - Y(:,1)).^2) / m);
    else
        fprintf('flute1 Train set 均方误差（MSE）: %f\n', sum((train_y_value(:, f) - Y(:,1)).^2) / m);
    end
    
end

writetable(table(pred), 'result.csv') ;
%plot(train_y_value);

%% check
predictWearCuts
