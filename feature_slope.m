function [X_slope] = feature_slope(X)

L = length(X);
X_slope = sum(X.^3) / L;

end