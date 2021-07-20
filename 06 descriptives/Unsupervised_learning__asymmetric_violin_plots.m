%%
clc, clear, close all;

%%
n = 1000;

data1 = exp( randn(n,1) ).^(1/2);

data2 = randn(n,1);
min2 = min(data2);
data2 = data2-min2;

[y1,x1] = histcounts(data1,'BinMethod','fd');
x1 = (x1(1:end-1)+x1(2:end))/2';
y1 = y1./max(y1);

[y2,x2] = histcounts(data2,'BinMethod','fd');
x2 = (x2(1:end-1)+x2(2:end))/2';
y2 = y2./max(y2);

dataR1 = tiedrank(data1)./n;
IQR1 = data1([dsearchn(dataR1,.25) dsearchn(dataR1,.75)]);

dataR2 = tiedrank(data2)./n;
IQR2 = data2([dsearchn(dataR2,.25) dsearchn(dataR2,.75)]);
%%
figure(1);
subplot(211),plot(x1,y1);
subplot(212),plot(x2,y2);
%%
figure(2);
patch([y1 -y2(end:-1:1)] , [x1 x2(end:-1:1)], 'm','facealpha',.5),hold on;

% plot other descriptive stats
plot([0 0],IQR1,'k','linew',3)
plot(0,mean(data1),'ks','markerfacecolor','r','markersize',12)
plot(0,median(data1),'ko','markerfacecolor','g','markersize',10);

% plot other descriptive stats
plot([0 0],IQR2,'k','linew',3)
plot(0,mean(data2),'ks','markerfacecolor','r','markersize',12)
plot(0,median(data2),'ko','markerfacecolor','g','markersize',10);

hold off;

legend({'Distribution';'IQR';'Mean';'Median'},'box','off')
title('Violin plot')
ylabel('Data values')