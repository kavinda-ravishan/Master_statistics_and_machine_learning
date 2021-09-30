clc, clear, close all;

x = [
    8  6.58;
    8  5.76;
    8  7.71;
    8  8.84;
    8  8.47;
    8  7.04;
    8  5.25;
    8  5.56;
    8  7.91;
    8  6.89;
    19 12.50;
    ];

x1 = x(:,1);
x2 = x(:,2);

corr_p = corr(x1, x2, 'type', 'p');
corr_s = corr(x1, x2, 'type', 's');

avg_x1 = mean(x1);
avg_x2 = mean(x2);

num = sum((x1-avg_x1).*(x2-avg_x2));
den = (sum((x1-avg_x1).^2)*sum((x2-avg_x2).^2))^(0.5);

corr_p_2 = num/den;

fprintf('Pearson correlation : %f, %f\n', corr_p, corr_p_2);

x1_rank = tiedrank(x1);
x2_rank = tiedrank(x2);

avg_x1 = mean(x1_rank);
avg_x2 = mean(x2_rank);

num = sum((x1_rank-avg_x1).*(x2_rank-avg_x2));
den = (sum((x1_rank-avg_x1).^2)*sum((x2_rank-avg_x2).^2))^(0.5);

corr_s_2 = num/den;

fprintf('Spearman correlation : %f, %f\n', corr_s, corr_s_2);

