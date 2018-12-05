%% Exercise 1: Linear regression with multiple variables

%% ================ 1.Feature Normalization ================
clear; close all; clc

fprintf('Loading data ...\n');

toOne = 1;
load('data.mat');

dataX = [1 2 3];
pred = zeros(size(flute1TestX, 1), length(dataX));
p = (1:314);

for f = 1:length(dataX)
    %X = dataX(f);%630*8
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
    disp(f)
    y = Y(p,f);%630*1
    m = length(y);

    fprintf('Normalizing Features ...\n');
    if toOne == 1
       [X mu sigma] = featureNormalize(X); 
    end
    X = [ones(m, 1) X];%630*9
    %X = roundn(X, -2);
    
    %% ================ 2.Gradient Descent ================
    fprintf('Running gradient descent...\n');
    n = size(X, 2);
    alpha = 0.01;
    num_iters = 61000;
    theta = zeros(n, 1);%9*1
    [theta J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

    %figure;
    %plot(1: numel(J_history), J_history, '-b', 'LineWidth', 2);
    %xlabel('Number of iterations');
    %ylabel('Cost J');
    initial_wear = [60 55 45];
    for i = 1:size(T_X, 1)
        if toOne == 1
           pred(i, f) = [1 ((T_X(i,:) - mu) ./ sigma)] * theta + initial_wear(f); 
        elseif toOne == 0
           pred(i, f) = [1 T_X(i,:)] * theta + initial_wear(f);
        end
    end
end
pred = [initial_wear; pred];
writetable(table(pred), 'result.csv') ;
