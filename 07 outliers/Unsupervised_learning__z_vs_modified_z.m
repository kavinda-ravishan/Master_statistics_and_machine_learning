clc, clear, close all;

zscorethresh = 3;

N = 400;
%data = randn(N,1);
data = rand(N,1).^4;

% for i=0:10
%     index = ceil(rand(1)*400);
%     data(index) = data(index).^2;
% end

mean = mean(data);
std = std(data);
dataZ = (data - mean)./std;

dataMed = median(data);
dataMAD = mad(data,1);
norm = norminv(0.75);
dataMz = (norm*(data - dataMed))./dataMAD;

outliersZ = find(abs(dataZ)>zscorethresh);
outliersMz = find(abs(dataMz)>zscorethresh);

figure(1)
subplot(211),hold on;
plot(dataZ,'s'),grid on;
plot(get(gca,'xlim'),[1 1]*zscorethresh,'--','color','r');
plot(get(gca,'xlim'),[-1 -1]*zscorethresh,'--','color','r');
plot(outliersZ,dataZ(outliersZ),'rx','linew',3,'markersize',5);
title('z-score');

subplot(212),hold on;
plot(dataMz,'s'),grid on;
plot(get(gca,'xlim'),[1 1]*zscorethresh,'--','color','r');
plot(get(gca,'xlim'),[-1 -1]*zscorethresh,'--','color','r');
plot(outliersMz,dataMz(outliersMz),'rx','linew',3,'markersize',5);
title('special z-score');
