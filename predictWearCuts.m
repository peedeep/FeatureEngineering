function [] = predictWearCuts()

%% Predict Wear Cuts
P = csvread('result.csv', 1);
p1 = P(:,1);
p2 = P(:,2);
p3 = P(:,3);
pred_cuts = zeros(1, 150);

for wear = 51:200
    i = wear - 50;
    flutes(1) = max(checkElements(find(p1 <= wear)));
    flutes(2) = max(checkElements(find(p2 <= wear)));
    flutes(3) = max(checkElements(find(p3 <= wear)));
    %disp(flutes);
    [a, ~] = max(flutes);
    if ~isempty(a)
        pred_cuts(i) = a;
    end
end

pred_cuts = pred_cuts(:);
%save result.txt cuts var -ascii;
fid=fopen('result.txt','wt'); %写的方式打开文件（若不存在，建立文件）；
fprintf(fid,'%d\n', pred_cuts);  % %d 表示以整数形式写入数据，这正是我想要的；
fclose(fid);  %关闭文件；

%% Real Wear Cuts
R = csvread('c6_wear.csv');
r1 = R(:,1);
r2 = R(:,2);
r3 = R(:,3);
real_cuts = zeros(1, 150);
for wear = 51:200
    i = wear - 50;
    flutes(1) = max(checkElements(find(r1 <= wear)));
    flutes(2) = max(checkElements(find(r2 <= wear)));
    flutes(3) = max(checkElements(find(r3 <= wear)));
    %disp(flutes);
    [a, ~] = max(flutes);
    if ~isempty(a)
        real_cuts(i) = a;
    end
end

real_cuts = real_cuts(:);
%save result.txt cuts var -ascii;
fid=fopen('real.txt','wt');
fprintf(fid,'%d\n', real_cuts); 
fclose(fid);

cuts = [pred_cuts real_cuts];

%% caculate score
d = pred_cuts - real_cuts;
%disp(d);
n = length(d);
s = zeros(n, 1);
for i = 1:n
   if d(i) < 0
       s(i) = exp(-d(i) / 10) - 1;
   else
       s(i) = exp(d(i) / 4.5) - 1;
   end
end 

disp(sum(s));

%% caculate accuracy
m = size(P, 1);
fprintf('\n flute1 Test set 均方误差（MSE）: %f', sum((p1 - r1).^2) / m);
fprintf('\n flute2 Test set 均方误差（MSE）: %f', sum((p2 - r2).^2) / m);
fprintf('\n flute3 Test set 均方误差（MSE）: %f\n', sum((p3 - r3).^2) / m);

end
