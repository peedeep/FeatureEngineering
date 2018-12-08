clc; clear;

A = csvread('./filter/TrainDataA1.csv', 1);
B = csvread('./filter/TrainDataB1.csv', 1);
T_X = csvread('./filter/TestData1.csv', 1);
A_X = A(:,1:end-3);
A_Y = A(:, end-2:end);
A_Y = max(A_Y, [], 2);
B_X = B(:,1:end-3);
B_Y = B(:,end-2: end);
B_Y = max(B_Y, [], 2); 
X = [A_X; B_X];
Y = [A_Y; B_Y];

% load('AllData.mat');
% A_Y = max(A_Y, [], 2);
% B_Y = max(B_Y, [], 2); 
% Y = [A_Y; B_Y];

isAdditional = true;

if isAdditional
  
    [X_Addi_A, Y_Addi_A] = getAdditionalWear(A_X, A_Y);
    [X_Addi_B, Y_Addi_B] = getAdditionalWear(B_X, B_Y);
    %X = [X_Addi_A];
    %Y = [Y_Addi_A];
    X = [X_Addi_A; X_Addi_B];
    Y = [Y_Addi_A; Y_Addi_B];
    [fs] = featureMaximumFDR(X, Y);

    flutesTrainX = X(:, fs);
    flutesTestX = T_X(2:end, fs);
    
else
    
    [fs] = featureMaximumFDR(X, Y);
    flutesTrainX = X(:, fs);
    flutesTestX = T_X(:, fs);
    
end

writetable(table([flutesTrainX Y]), './data/TrainFlutes.csv') ;
writetable(table(flutesTestX), './data/TestFlutes.csv') ;

save('selectedData');

ex3_train_nn_maximum