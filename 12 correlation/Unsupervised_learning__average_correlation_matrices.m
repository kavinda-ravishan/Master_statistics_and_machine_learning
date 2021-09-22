close all; clear; clc

N = 1000;     % time points
M =   20;     % channels

% time vector (radian units)
t = linspace(0,6*pi,N);
noice = 1;
% relationship across channels (imposing covariance)
chanrel = sin(linspace(0,2*pi,M))';

dataMat = zeros(20 ,M, N);

for i=1:20
    % create the data
    data = bsxfun(@times,repmat( sin(t),M,1 ),chanrel);
    data = data + randn(M,N)*noice;
    dataMat(i,:,:) = data;
end

dataMean = squeeze(mean(dataMat,1));
%%
figure(1), clf
plot(t,bsxfun(@plus,squeeze(dataMat(1,:,:)),(1:M)'*4))
set(gca,'ytick',[],'xlim',t([1 end]))
xlabel('Time (a.u.)')
ylabel('Channel')

figure(2), clf
plot(t,bsxfun(@plus,dataMean,(1:M)'*4))
set(gca,'ytick',[],'xlim',t([1 end]))
xlabel('Time (a.u.)')
ylabel('Channel')

%%

