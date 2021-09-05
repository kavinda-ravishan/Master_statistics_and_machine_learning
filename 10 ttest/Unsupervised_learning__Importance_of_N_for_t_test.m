clc, clear, close all;

mean1 = 1.2;
mean2 = 1;
pval_thresh = 0.05;

N = 10:1:200;
num_exps = 100;

tstats = zeros(num_exps, size(N,2));
tval_thresh = zeros(1, size(N,2));

for e = 1:1:num_exps
    for i=1:1:size(N,2)
        data1 = mean1 + randn(N(i), 1);
        data2 = mean2 + randn(N(i), 1);
        [h,p,ci,stats] = ttest2(data1, data2, 'tail', 'both', 'vartype', 'equal');
        tstats(e, i) = stats.tstat;
    end
    clc,disp([num2str((e*100)/num_exps) '%']);
end

for i=1:1:size(N,2)
    df = (2*N(i))-2;
    tval_thresh(i) = tinv(1-pval_thresh, df);
end

plot(N, tstats, 'color', [0, 0, 0, 0.05]),hold on;
plot(N, mean(tstats, 1), 'color', 'black', 'linew', 2),hold on;
plot(N, tval_thresh, 'color', 'r', 'linew', 2),xlabel('Sample size'),ylabel('T-test value'),hold off;
