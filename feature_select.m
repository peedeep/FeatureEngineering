clc; clear;

load('AllData.mat');
[c1f, c2f, c3f] = feature_p_values(X((1:230), :), Y((1:230), :));

flute1TrainX = X(:, c1f);
flute2TrainX = X(:, c2f);
flute3TrainX = X(:, c3f);

flute1TestX = T_X(:, c1f);
flute2TestX = T_X(:, c2f);
flute3TestX = T_X(:, c3f);

writetable(table([flute1TrainX Y(:,1)]), 'TrainFlute1.csv') ;
writetable(table([flute2TrainX Y(:,2)]), 'TrainFlute2.csv') ;
writetable(table([flute3TrainX Y(:,3)]), 'TrainFlute3.csv') ;

writetable(table(flute1TestX), 'TestFlute1.csv') ;
writetable(table(flute2TestX), 'TestFlute2.csv') ;
writetable(table(flute3TestX), 'TestFlute3.csv') ;
