function [pk] = featureGenPeak(X)

mi = min(X);
ma = max(X);  
pk = ma - mi;

end