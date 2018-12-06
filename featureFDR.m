function [c1_features, c2_features, c3_features] = featureFDR(X, Y)

m = size(X, 1);
n = size(X, 2);
num_c = size(Y, 2);
c1_features = [];
c2_features = [];
c3_features = [];

for c = 1:num_c
    
    fprintf('\n\n======================cutter %d=======================\n', c); 
    index_features = (1:n);
    y = Y(:, c);
    k = n;
    
    while(k - 1 > 0)
        fprintf('\n********** cutter begin k = %d ***********\n', k);
        x = X(:, index_features);
        model = fitlm(x, y);

        p_val = model.Coefficients.pValue(2:end);
        p_len = length(p_val);
        p_val = [p_val (1:p_len)'];

        [~, k, no_zero_indexs] = findFDRValues(p_val);
        if k - 1 > 0
            index_features = no_zero_indexs';
        end
        fprintf('\n********** cutter end k = %d ***********\n', k); 
    end
    if c == 1
        c1_features = index_features;
    elseif c == 2
        c2_features = index_features;
    elseif c == 3
        c3_features = index_features;
    end

end

end



