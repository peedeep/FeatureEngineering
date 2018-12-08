clc; clear;

A = csvread('./filter/TrainDataA1.csv', 1);
A_X = A(:,1:end-3);
A_Y = A(:, end-2:end);
B = csvread('./filter/TrainDataB1.csv', 1);
B_X = B(:,1:end-3);
B_Y = B(:,end-2: end);
T_X = csvread('./filter/TestData1.csv', 1);
X = [A_X; B_X];
Y = [A_Y; B_Y];

isAdditional = false;

if isAdditional
    
    [X_Addi_A, Y_Addi_A] = getAdditionalWear(A_X, A_Y);
    [X_Addi_B, Y_Addi_B] = getAdditionalWear(B_X, B_Y);
    X = [X_Addi_A; X_Addi_B];
    Y = [Y_Addi_A; Y_Addi_B];

    [flute1TrainX, tran1] = featurePCA(X, 3);
    [flute2TrainX, tran2] = featurePCA(X, 3);
    [flute3TrainX, tran3] = featurePCA(X, 3);

    flute1TestX = T_X(2:end,:) * tran1;
    flute2TestX = T_X(2:end,:) * tran2;
    flute3TestX = T_X(2:end,:) * tran3;

else

    [flute1TrainX, tran1] = featurePCA(X, 4);
    [flute2TrainX, tran2] = featurePCA(X, 4);
    [flute3TrainX, tran3] = featurePCA(X, 4);

    flute1TestX = T_X * tran1;
    flute2TestX = T_X * tran2;
    flute3TestX = T_X * tran3;

end

writetable(table([flute1TrainX Y(:,1)]), './data/TrainFlute1.csv') ;
writetable(table([flute2TrainX Y(:,2)]), './data/TrainFlute2.csv') ;
writetable(table([flute3TrainX Y(:,3)]), './data/TrainFlute3.csv') ;

writetable(table(flute1TestX), './data/TestFlute1.csv') ;
writetable(table(flute2TestX), './data/TestFlute2.csv') ;
writetable(table(flute3TestX), './data/TestFlute3.csv') ; 

save('selectedData');

%ex2_nn_net_predict;
ex2_train_nn;