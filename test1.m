clc; clear;

X = csvread('.\train_a\Train_A\Train_A_002.csv');
feature

for i = 1:7
    fprintf('the feature£º %d: ', i);
    slope = feature_slope(X(:, i));
    fprintf('slope: %f\t', slope);

    rms = feature_rms(X(:, i));
    fprintf('rms: %f\t', rms);

    peak = feature_peak(X(:, i));
    fprintf('peak: %f\t', peak);

    mean = feature_mean(X(:, i));
    fprintf('rms: %f\t', mean);

    max = feature_max(X(:, i));
    fprintf('mean: %f\t', max);

    kurtosis = feature_kurtosis(X(:, i));
    fprintf('kurtosis: %f\t', kurtosis);

    fft_power = feature_fft_power(X(:, i));
    fprintf('fft_power: %f\t', fft_power);

    fft_mag = feature_fft_mag(X(:, i));
    fprintf('fft_mag: %f\t', fft_mag);

    fft_energy = feature_fft_energy(X(:, i));
    fprintf('fft_energy: %f\n', fft_energy);
end