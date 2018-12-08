%% Exercise 1: Linear regression with multiple variables

%% ================ 1.Feature Normalization ================
clear; close all; clc

fprintf('Loading data ...\n');

toOne = 1;
load('selectedData.mat');

dataX = [1 2 3];
p = (1:314);
Y = Y(p, :);

theta1 = [];
theta2 = [];
theta3 = [];

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

    if toOne == 1
       [X mu sigma] = featureNormalize(X); 
    end
    X = [ones(m, 1) X];%630*9
    %X = roundn(X, -2);
    
    %% ================ 2.Gradient Descent ================
    n = size(X, 2);
    alpha = 0.01;
    num_iters = 61000;
    theta = zeros(n, 1);%9*1
    [theta J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);
    
    if f == 1
        theta1 = theta;
    elseif f == 2
        theta2 = theta;
    elseif f == 3
        theta3 = theta;    
    end
   
    %figure;
    %plot(1: numel(J_history), J_history, '-b', 'LineWidth', 2);
    %xlabel('Number of iterations');
    %ylabel('Cost J');
    %initial_wear = [62 9 14];
    initial_wear = [62 55 50];
    if toOne == 1
       pred(:,f) = linearPredictNormalize(T_X, theta, mu, sigma, initial_wear(f)); 
    elseif toOne == 0
       pred(:,f) = linearPredict(T_X, theta, initial_wear(f)); 
    end
    
end

writetable(table(pred), './data/result.csv') ;

predictWearCuts
