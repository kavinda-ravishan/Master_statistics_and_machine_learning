%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202006 
% 
%  SECTION: The t-test family
%    VIDEO: Permutation testing
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% 

%% simulate two distributions

% number of trials
N = 100;

% dataset "A"
r = randn(N,1);
r(r>0) = log(1+r(r>0));
dataA = 26-r*10;

% get histogram values for later comparison
[yA,xA] = hist(dataA,20);


% dataset "B"
r = randn(N,1);
r(r>0) = log(1+r(r>0));
dataB = 30-r*10;

% get histogram values for later comparison
[yB,xB] = hist(dataB,20);


figure(1), clf, hold on
stem(xA,yA,'b','linew',3)
stem(xB,yB,'r','linew',3)
legend({'Data "A"';'Data "B"'})

%% mix trials together

% concatenate trials
alldata = cat(1,dataA,dataB);

% condition labels
conds = cat(1,ones(N,1),2*ones(N,1));

obsval = mean(alldata(conds==2)) - mean(alldata(conds==1));
%% and now a distribution of null hypothesis values

nPerms = 100:100:5000;
zVal = zeros(1, size(nPerms,2));

%%
for i=1:size(nPerms,2)
    permdiffs = zeros(nPerms(i),1);

    for permi=1:nPerms(i)
        fconds = randperm(N*2);
        fconds(fconds<N+1) = 1;
        fconds(fconds>1) = 2;
        permdiffs(permi) = mean(alldata(fconds==2)) - mean(alldata(fconds==1));
    end

    zVal(i) = ( obsval-mean(permdiffs) ) / std(permdiffs);
    clc,disp(i*100/size(nPerms,2));
end

zValMean = mean(zVal);

%%
figure(2);

subplot(2,1,1);
histogram(zVal), hold on;
plot([zValMean zValMean],get(gca,'ylim'),'m','linew',5), hold off;
title(['Mean Z-Value : ' num2str(zValMean) ', p-value : ' num2str(1-normcdf(abs(zValMean)))]);
xlabel('Z-Value');
ylabel('Count');

subplot(2,1,2);
plot(nPerms, zVal, 'ko'),hold on;
plot([min(nPerms) max(nPerms)], [1 1]* zValMean , 'r', 'linew', 2),hold off;
xlabel('Number of permutations per test');
ylabel('Z-Value');


