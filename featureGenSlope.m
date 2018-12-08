function [X_slope] = featureGenSlope(X)

L = length(X);
X_slope = sum(X.^3) / L;

end