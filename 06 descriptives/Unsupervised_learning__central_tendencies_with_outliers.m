%%
clc, clear, close all;
%%
N1 = 1000;
N2 = round(N1*0.1);
data1 = randn(N1,1);
%%
data2 = 3*randn(N2,1)+80;

[y1,x1] = histcounts(data1, 10);
x1 = (x1(1:end-1)+x1(2:end))/2;

[y2,x2] = histcounts(data2, 10);
x2 = (x2(1:end-1)+x2(2:end))/2;

dataMean = mean([data1;data2]);
dataMedian = median([data1 ; data2]);

figure(1);
subplot(211), hold on
plot(x1,y1,'b',x2,y2,'b');
plot([dataMean dataMean], [0 max(y1)], 'b--')
plot([dataMedian dataMedian], [0 max(y1)], 'r--'),hold off;
xlim([-10 100]);

%%
data2 = 3*randn(N2,1)+20;

[y1,x1] = histcounts(data1, 10);
x1 = (x1(1:end-1)+x1(2:end))/2;

[y2,x2] = histcounts(data2, 10);
x2 = (x2(1:end-1)+x2(2:end))/2;

dataMean = mean([data1;data2]);
dataMedian = median([data1 ; data2]);

figure(1);
subplot(212), hold on
plot(x1,y1,'b',x2,y2,'b');
plot([dataMean dataMean], [0 max(y1)], 'b--')
plot([dataMedian dataMedian], [0 max(y1)], 'r--'),hold off;
xlim([-10 100]);