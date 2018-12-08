function [pow] = featureGenFFTPower(X)

Fs = 50;
N = length(X);
pow = sum(X.^2)/N/Fs; %¼ÆËã¹¦ÂÊ
 
end