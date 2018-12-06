clc; clear;

load('AllData.mat');

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

writetable(table([flute1TrainX Y(:,1)]), 'TrainFlute1.csv') ;
writetable(table([flute2TrainX Y(:,2)]), 'TrainFlute2.csv') ;
writetable(table([flute3TrainX Y(:,3)]), 'TrainFlute3.csv') ;

writetable(table(flute1TestX), 'TestFlute1.csv') ;
writetable(table(flute2TestX), 'TestFlute2.csv') ;
writetable(table(flute3TestX), 'TestFlute3.csv') ; 

save('selectedData');
