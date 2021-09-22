close all; clear; clc

N = 1000;     % time points
M =   20;     % channels
nMat = 20;
% time vector (radian units)
t = linspace(0,6*pi,N);
noice = 1;
% relationship across channels (imposing covariance)
chanrel = sin(linspace(0,2*pi,M))';

dataMat = zeros(nMat ,M, N);

for i=1:nMat
    % create the data
    data = bsxfun(@times,repmat( sin(t),M,1 ),chanrel);
    data = data + randn(M,N)*noice;
    dataMat(i,:,:) = data;
end

% Get data mean
dataMean = squeeze(mean(dataMat,1));
% Get corr mat for mean data
dataMeanCorrMat = corrcoef(dataMean');

% Get corr mat for each data mat
dataCorrMat = zeros(nMat,M,M);

for i=1:nMat
    dataCorrMat(i,:,:) = corrcoef(squeeze(dataMat(i,:,:))');
end
dataCorrMeanMat = squeeze(mean(dataCorrMat));

figure(1), clf

subplot(1,2,1);
plot(t,bsxfun(@plus,squeeze(dataMat(1,:,:)),(1:M)'*4))
set(gca,'ytick',[],'xlim',t([1 end]))
xlabel('Time (a.u.)')
ylabel('Channel')

subplot(1,2,2);
plot(t,bsxfun(@plus,dataMean,(1:M)'*4))
set(gca,'ytick',[],'xlim',t([1 end]))
xlabel('Time (a.u.)')
ylabel('Channels mean')

figure(2), clf

subplot(1,2,1)
imagesc(dataMeanCorrMat)
axis image
set(gca,'clim',[-1 1])
title('Mean Data correlation matrix')

subplot(1,2,2)
imagesc(dataCorrMeanMat)
axis image
set(gca,'clim',[-1 1])
title('Data Mean correlation matrix')

