%%
clc, clear, close all;
%%
N = 1000;
brownnoise = cumsum( sign(randn(N,1)) );
%%
i = 1;
start = 4;
stop = 50;
step = 2;
entro = zeros(((stop-start)/step)+1,1);
bin = zeros(((stop-start)/step)+1,1);
for nbins = start:step:stop
    % bin the data and convert to probability
    [nPerBin,bins] = histcounts(brownnoise,nbins);
    probs = nPerBin ./ sum(nPerBin);

    % compute entropy
    entro(i) = -sum( probs.*log2(probs+eps) );
    bin(i) = nbins;
    i = i + 1;
end

plot(bin,entro,'-s','color','black');
title('No of Bins Vs Entropy')
xlabel('Bins'), ylabel('Entropy')
