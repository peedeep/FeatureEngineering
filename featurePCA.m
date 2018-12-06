function [X, tran] = featurePCA(X, n)

[pc,score,latent,tsquare] = pca(X);
%disp(cumsum(latent)./sum(latent));
tran=pc(:,1:n);
X = score(:, 1:n);

end