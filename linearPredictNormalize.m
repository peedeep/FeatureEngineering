function [y] = linearPredictNormalize (X, theta, mean, sigma, initialWear)

m = size(X, 1);
X_norm = (X - repmat(mean, m, 1)) ./ repmat(sigma, m, 1);
X = [ones(m, 1) X_norm];
y = X * theta + initialWear;
y = [initialWear; y];

end