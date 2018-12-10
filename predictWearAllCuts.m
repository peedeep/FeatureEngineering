%function [] = predictWearCuts()

%% Predict train Wear Cuts
pred_b_wear = csvread('./data/train_result.csv', 1);
figure;
subplot(2, 1, 1);
pred_maximum_b_wear = max(pred_b_wear, [], 2);
plot(pred_maximum_b_wear);
pred_b_cuts = caculateWearMaxCuts(pred_maximum_b_wear);
%save result.txt cuts var -ascii;
fid=fopen('./data/train_result.txt','wt');
fprintf(fid,'%d\n', pred_b_cuts); 
fclose(fid);

hold on;
real_maximum_b_wear = B_Y;
plot(real_maximum_b_wear);
legend('predB', 'realB');
real_b_cuts = caculateWearMaxCuts(real_maximum_b_wear);

%% Predict test Wear Cuts
pred_test_wear = csvread('./data/test_result.csv', 1);
subplot(2, 1, 2);
pred_maximum_test_wear = max(pred_test_wear, [], 2);
%figure;
plot(pred_maximum_test_wear);
pred_test_cuts = caculateWearMaxCuts(pred_maximum_test_wear);
%save result.txt cuts var -ascii;
fid=fopen('./data/test_result.txt','wt');
fprintf(fid,'%d\n', pred_test_cuts); 
fclose(fid);

%% Real Wear Cuts
real_test_wear = csvread('./data/test.csv');
hold on;
real_maximum_test_wear = max(real_test_wear, [], 2);
plot(real_maximum_test_wear);
legend('predTest', 'realTest');
real_test_cuts = caculateWearMaxCuts(real_maximum_test_wear);
%save result.txt cuts var -ascii;
fid=fopen('./data/real.txt','wt');
fprintf(fid,'%d\n', real_test_cuts); 
fclose(fid);

%% caculate score
punishment_b = caculatePunishment(pred_b_cuts, real_b_cuts);
punishment_test = caculatePunishment(pred_test_cuts, real_test_cuts);

%% caculate accuracy
m = size(pred_maximum_test_wear, 1);

for i = 1:flute_size
    fprintf('\n flute%d train b set ������MSE��: %f', i, sum((pred_maximum_b_wear - real_maximum_b_wear).^2) / m);
    fprintf('\n flute%d Test set ������MSE��: %f', i, sum((pred_maximum_test_wear - real_maximum_test_wear).^2) / m);
end

%end
