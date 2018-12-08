%feature_names = ['fx', 'fy', 'fz', 'vx', 'vy', 'vz', 'ae'];
%feature_explore = ['mean', 'slope', 'kurtosis', 'rms', 'max', 'peak', 'X_fft_power', 'X_fft_mag', 'X_fft_energy'];

function [features] = featureExplore(file_name)
    %feature_explore_names = ['mean', 'slope', 'kurtosis', 'rms', 'max', 'peak', 'X_fft_power', 'X_fft_mag'];
    A = csvread(file_name);
    n = size(A, 2);
    X_mean = zeros(1, n);
    X_slope = zeros(1, n);
    X_kurtosis = zeros(1, n);
    X_rms = zeros(1, n);
    X_max = zeros(1, n);
    X_peak = zeros(1, n);
    X_fft_power = zeros(1, n);
    X_fft_mag = zeros(1, n);
    X_fft_energy = zeros(1, n);
    X_wave1 = zeros(1, n);
    X_wave2 = zeros(1, n);
    X_wave3 = zeros(1, n);
    %features = zeros(1, n * length(feature_explore_names));
    %disp(features)
    %fprintf('=================start caculate=================\n');
    for i = 1:n
        X = A(:, i);
        X_mean(i) = featureGenMean(X);
        X_slope(i) = featureGenSlope(X);
        X_kurtosis(i) = featureGenKurtosis(X);
        X_rms(i) = featureGenRms(X);
        X_max(i) = featureGenMax(X);
        X_peak(i) = featureGenPeak(X);
        X_fft_power(i) = featureGenFFTPower(X);
        X_fft_mag(i) = featureGenFFTMag(X);
        X_fft_energy(i) = featureGenFFTEnergy(X);
        [X_wave1(i), X_wave2(i), X_wave3(i)] = featureGenWave(X);
    end
    %fprintf('=================end caculate=================\n');
    %disp(X_mean);
    %fprintf('==================================\n');
    %disp(X_slope);
    %fprintf('==================================\n');
    %disp(X_kurtosis);
    %fprintf('==================================\n');
    %disp(X_rms);
    %fprintf('==================================\n');
    %disp(X_max);
    %fprintf('==================================\n');
    %disp(X_peak);
    %fprintf('==================================\n');
    %disp(X_fft_power);
    %fprintf('==================================\n');
    %disp(X_fft_mag);
    %fprintf('==================================\n');
    %disp(X_fft_energy);
    %fprintf('=================features vector=================\n');
    features = [X_mean X_slope X_kurtosis X_rms X_max X_peak X_fft_power X_fft_mag X_wave1 X_wave2 X_wave3];
    %features = [X_mean X_slope X_kurtosis X_rms X_max X_peak];
    %disp(features);

end