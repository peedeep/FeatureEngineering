function [en] = feature_fft_energy(X)

y = fft(X);   %����fft�任
en = sum(y.^2);   %����end

end