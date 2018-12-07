%% Exercise 1: Linear regression with multiple variables

%% ================ 1.Feature Normalization ================
clear; close all; clc

load('selectedData.mat');

p = (1:315);%ѡ��ѵ����������
Y = Y(p, :);
m = size(Y, 1);%ѵ����������
flute_size = size(Y, 2);%��Ƭ����
T_B_X = flute1TrainX(316:630, :);%��������1

pred_train = zeros(size(T_B_X, 1), flute_size);%��������1Ԥ����
pred_test = zeros(size(T_X, 1), flute_size);%��������2Ԥ����

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
    fprintf('��%d�ѵ�\t', f);
    
    y = Y(:,f);
    
    %% nn train
    [inputn, inputps] = mapminmax(X');
    [outputn, outputps] = mapminmax(y');
    net = newff(inputn, outputn, 6,  {'logsig', 'purelin'});
    net.trainParam.epochs = 1000;
    net.trainParam.lr = 0.01;
    net.trainParam.goal = 0.00004;
    net = train(net, inputn, outputn);
    
    %% for train data predict
    inputn_test = mapminmax('apply', T_B_X', inputps);
    an = sim(net, inputn_test);
    BPoutput = mapminmax('reverse', an', outputps);
    %pred(:, f) = BPoutput; 
    
    %initial_wear = [62 55 50];
    initial_wear = [62.7 9.89 14.6];
    if isAdditional
        pred_train(:, f) = nnPredict(BPoutput, initial_wear(f));
    else
        pred_train(:, f) = BPoutput;
    end

    %% for test data predict
    inputn_test = mapminmax('apply', T_X', inputps);
    an = sim(net, inputn_test);
    BPoutput = mapminmax('reverse', an', outputps);
    %pred(:, f) = BPoutput;
        
    %initial_wear = [62 55 50];
    initial_wear = [62.7 9.89 14.6];
    if isAdditional
        pred_test(:, f) = nnPredict(BPoutput, initial_wear(f));
    else
        pred_test(:, f) = BPoutput;
    end
    
    %% �������ݾ�����MSE��
    train_y = sim(net, inputn);
    train_y_value(:, f) = mapminmax('reverse', train_y', outputps);
    
    if f == 1
       net1 = net;
       inputps1 = inputps;
       outputps1 = outputps;
       save net1 net1 inputps1 outputps1;
    elseif f == 2
       net2 = net;
       inputps2 = inputps;
       outputps2 = outputps;
       save net2 net2 inputps2 outputps2;
    elseif f == 3
       net3 = net;
       inputps3 = inputps;
       outputps3 = outputps;
       save net3 net3 inputps3 outputps3;
    end
    
    if isAdditional
        fprintf('flute%d Train set ������MSE��: %f\n', f, sum((train_y_value(:, f) - Y(:,1)).^2) / m);
    else
        fprintf('flute%d Train set ������MSE��: %f\n', f, sum((train_y_value(:, f) - Y(:,1)).^2) / m);
    end
    
end

writetable(table(pred_train), 'train_result.csv') ;
writetable(table(pred_test), 'test_result.csv') ;
%plot(train_y_value);

%% check
predictWearAllCuts

save('AllPredict');
