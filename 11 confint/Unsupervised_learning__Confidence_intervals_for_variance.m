%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202006 
% 
%  SECTION: Confidence intervals
%    VIDEO: Bootstrapping confidence intervals
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% simulate data

popN = 1e7; % lots and LOTS of data!!

% the data (note: non-normal!)
population = (4*randn(popN,1)).^2;

% we can calculate the exact population std
popStd = std(population);

% let's see it
figure(1), clf
subplot(211)
% only plot every 1000th sample
plot(population(1:1000:end),'ks')
xlabel('Data index'), ylabel('Data value')

subplot(212)
histogram(population,'BinMethod','fd')
ylabel('Count'), xlabel('Data value')

%% draw a random sample

% parameters
samplesize = 40;
confidence = 95; % in percent

% compute sample std
randSamples = randi(popN,samplesize,1);
sampledata  = population(randSamples);
samplemean  = mean(sampledata);
sampleStd   = std(population(randSamples)); % used later for analytic solution


%%% now for bootstrapping
numBoots  = 1000;
bootStds = zeros(numBoots,1);

% resample with replacement
for booti=1:numBoots
    bootStds(booti) = std( randsample(sampledata,samplesize,true) );
end

% find confidence intervals
confint(1) = prctile(bootStds,(100-confidence)/2);
confint(2) = prctile(bootStds,100-(100-confidence)/2);

%% graph the outcomes

figure(2), clf, hold on

% start with a histogram of the resampled std
[y,x] = histcounts(bootStds,40);
y=y./max(y);
x = (x(1:end-1)+x(2:end))/2;
bar(x,y)

% then the same stuff as in the previous code-video...
patch(confint([1 1 2 2]),[0 1 1 0],'g','facealpha',.5,'edgecolor','none')
plot([1 1]*popStd,[0 1.5],'k:','linew',2)
plot([1 1]*sampleStd,[0 1],'r--','linew',3)
set(gca,'xlim',[popStd-20 popStd+20],'ytick',[])
xlabel('Data values')
legend({'Empirical distribution';[ num2str(confidence) '% CI region' ];'True std';'Sample std'},'box','off')

%% compare against the analytic confidence interval

% compute confidence intervals
citmp = (1-confidence/100)/2;
confint2 = sampleStd + tinv([citmp 1-citmp],samplesize-1) * sampleStd/sqrt(samplesize);

fprintf('\n Empirical: %g - %g',round(confint,2))
fprintf('\n Analytic:  %g - %g\n',round(confint2,2))

%% done.
