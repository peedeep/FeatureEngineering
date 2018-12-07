clc; clear;

load('AllData.mat');

isAdditional = false;

if isAdditional
  
    [X_Addi_A, Y_Addi_A] = getAdditionalWear(A_X, A_Y);
    [X_Addi_B, Y_Addi_B] = getAdditionalWear(B_X, B_Y);
    X = [X_Addi_A; X_Addi_B];
    Y = [Y_Addi_A; Y_Addi_B];
    [c1f, c2f, c3f] = featureFDR(X, Y);

    flute1TrainX = X(:, c1f);
    flute2TrainX = X(:, c2f);
    flute3TrainX = X(:, c3f);

    flute1TestX = T_X(2:end, c1f);
    flute2TestX = T_X(2:end, c2f);
    flute3TestX = T_X(2:end, c3f);
    
else
    
    [c1f, c2f, c3f] = featureFDR(X, Y);

    flute1TrainX = X(:, c1f);
    flute2TrainX = X(:, c2f);
    flute3TrainX = X(:, c3f);

    flute1TestX = T_X(:, c1f);
    flute2TestX = T_X(:, c2f);
    flute3TestX = T_X(:, c3f);
    
end

writetable(table([flute1TrainX Y(:,1)]), 'TrainFlute1.csv') ;
writetable(table([flute2TrainX Y(:,2)]), 'TrainFlute2.csv') ;
writetable(table([flute3TrainX Y(:,3)]), 'TrainFlute3.csv') ;

writetable(table(flute1TestX), 'TestFlute1.csv') ;
writetable(table(flute2TestX), 'TestFlute2.csv') ;
writetable(table(flute3TestX), 'TestFlute3.csv') ;

save('selectedData');

ex2_train_nn