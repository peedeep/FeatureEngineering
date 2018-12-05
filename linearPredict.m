function [y] = linearPredict (X, theta, initialWear)

m = size(X, 1);
X = [ones(m, 1) X];
y = X * theta + initialWear;
y = [initialWear; y];

end