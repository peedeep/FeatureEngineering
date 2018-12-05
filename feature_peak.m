function [pk] = feature_peak(X)

mi = min(X);
ma = max(X);  
pk = ma - mi;

end