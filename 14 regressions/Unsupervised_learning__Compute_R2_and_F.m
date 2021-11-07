clc, clear, close all;

data = [
    5	47
    5.5	53
    6	52
    6	44
    7	39
    7	49
    7.5	50
    8	38
    8.5	43
    9	40
];


X = [ones(10, 1) data(:,1)];
y = data(:, 2);

betaCoeff = (X' * X)^(-1) * X' * y;

yhat = X * betaCoeff;
%%
plot(data(:, 1), y, 'or', 'markerface', 'r'), hold on;
plot(data(:, 1), yhat, 'ob--', 'markerface', 'b'), hold off;
%%

SSe = sum((y - yhat).^2); % SSerror
SSt = sum((y - mean(y)).^2); % SStotal

R2 = 1 - (SSe / SSt);
%%

k = 2; % Number of Beta coeff
N = size(data, 1); % Number of data points

SSm = sum((yhat - mean(y)).^2); % SSmodel
F = (SSm / (k-1))/(SSe / (N-k));
pval = 1 - fcdf(F, k-1, N-k);

fprintf('R^2 = %.2f\n', R2);
fprintf('F(%i, %i) = %.2f\n', k-1, N-k, F);
fprintf('p = %.3f\n', pval);