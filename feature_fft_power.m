function [pow] = feature_fft_power(X)

Fs = 50;
N = length(X);
pow = sum(X.^2)/N/Fs; %���㹦��
 
end