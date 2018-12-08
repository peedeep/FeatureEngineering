%% Exercise 1: Linear regression with multiple variables

%% ================ 1.Feature Normalization ================
clear; close all; clc

fprintf('Loading data ...\n');

load('selectedData.mat');

p = (1:314);%ѡ��ѵ����������
Y = Y(p, :);
m = size(Y, 1);%ѵ����������
flute_size = size(Y, 2);%��Ƭ����
pred = zeros(size(T_X, 1), flute_size);

%% ================ 2.Gradient Descent Train ================
for f = 1:flute_size
    if f == 1
        X = flute1TrainX(p,:);
        T_X = flute1TestX;
    elseif f == 2
        X = flute2TrainX(p,:);
        T_X = flute2TestX;
    elseif f== 3
        X = flute3TrainX(p,:);
        T_X = flute3TestX;
    end
    
    y = Y(:,f);
    
    %% nn train
    [p1, minp, maxp, t1, mint, maxt] = premnmx(X, y);
    net = newff(p1, t1, [5], {'tansig','tansig','purelin'}, 'trainlm');
    net.trainParam.epochs = 50000;
    net.trainParam.goal = 0.0000001;
    [net, tr] = train(net, p1, t1);

    if isAdditional
        initial_wear = [62 55 50];
    else
        initial_wear = [-1 -1 -1];
    end
    
    a = premnmx(T_X(1,:));
    b = sim(net, a);
    c = postmnmx(b, mint, maxt);
    
    pred(:, f) = c; 
    
    %% �������ݾ�����MSE��
    train_y = sim(net, p1);
    train_y_value = postmnmx(train_y, mint, maxt);
    if isAdditional
        fprintf('flute%d Train set ������MSE��: %f\n', f, sum((train_y_value - Y(:,1)).^2) / m);
    else
        fprintf('flute%d Train set ������MSE��: %f\n', f, sum((train_y_value - Y(:,1)).^2) / m);
    end
    
end

writetable(table(pred), './data/result.csv') ;

%% check
predictWearCuts

save('Predict');
