function [en] = feature_fft_energy(X)

y = fft(X);   %进行fft变换
en = sum(y.^2);   %能量end

end