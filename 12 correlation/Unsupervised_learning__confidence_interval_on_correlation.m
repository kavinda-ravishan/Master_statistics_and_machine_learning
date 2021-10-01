clc, clear, close all;

N = 100;
r = 0.6;

x = randn(N, 1);
y = randn(N, 1);

y = x*r + y*sqrt(1-r^2);

[r, p] = corr(x, y);

samplesize = N/2;
confidence = 95;
numboots = 100;
corrs = zeros(numboots, 1);

for i=1:numboots
    
    sample = randi(N, samplesize, 1);
    x1 = x(sample);
    y1 = y(sample);

    [corrs(i), ] = corr(x1, y1);
end

corrub = prctile(corrs,(100-confidence)/2);
corrlb = prctile(corrs,100-(100-confidence)/2);

hist(corrs, 10);
title([num2str(corrub) ' : ' num2str(corrlb)])




