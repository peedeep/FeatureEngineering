function [en] = featureGenFFTEnergy(X)

y = fft(X);   %����fft�任
en = sum(y.^2);   %����end

end