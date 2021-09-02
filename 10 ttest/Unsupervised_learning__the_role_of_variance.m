close all; clear; clc

N = 20; % sample size
popMu = .5; % true population mean
stdev = 0.1:0.01:3; %  standard deviation
p = zeros(size(stdev,2),1);
tval = zeros(size(stdev,2),1);

for i = 1:1:size(stdev,2)
    data = stdev(i)*randn(N,1) + popMu;
    [h,p(i),c,stats] = ttest(data);
    tval(i) = stats.tstat;
end


figure(1);
subplot(2,1,1);
plot(stdev, tval, 'bs'),title('T Vs stdev'),xlabel('standard deviation'),ylabel('T-Value');
subplot(2,1,2);
plot(stdev, p, 'bs'),title('P Vs stdev'),xlabel('standard deviation'),ylabel('Probability');

figure(2);
plot(tval, p, 'bs'),title('T Vs P'),xlabel('T-Value'),ylabel('Probability');