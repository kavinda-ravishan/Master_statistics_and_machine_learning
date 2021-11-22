clc, clear, close all;

N = 10;

x = linspace(1, 10, N)' + randn(N, 1);
y1 = x + randn(N, 1);
y2 = x + randn(N, 1);

plot(x, y1, 'ro', 'markerfacecolor', 'r'), hold on;
plot(x, y2, 'bo', 'markerfacecolor', 'b'), hold on;

pterms1 = polyfit(x,y1,1);
yHat1 = polyval(pterms1,x);
plot(x, yHat1, 'mo:', 'markersize', 10), hold on;

pterms2 = polyfit(x,y1,10);
yHat2 = polyval(pterms2,x);
plot(x, yHat2, 'ms', 'markersize', 10), hold off;

SSe = sum((y1 - yHat1).^2);
SSt = sum((y1 - mean(y1)).^2);
R211 = 1 - (SSe / SSt)

SSe = sum((y2 - yHat1).^2);
SSt = sum((y2 - mean(y2)).^2);
R212 = 1 - (SSe / SSt)


SSe = sum((y1 - yHat2).^2);
SSt = sum((y1 - mean(y1)).^2);
R221 = 1 - (SSe / SSt)

SSe = sum((y2 - yHat2).^2);
SSt = sum((y2 - mean(y2)).^2);
R222 = 1 - (SSe / SSt)
