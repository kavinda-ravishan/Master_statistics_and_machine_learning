%%
clc;
clear;
close all;

%%
n = 1000;
data = exp( randn(n,1)/2 );

%%
k = 40;
[y,x] = histcounts(data, 40);
x = (x(1:end-1)+x(2:end))/2;
y = (y*100)/sum(y);
%%
%plot(x,y,'s-','linew',2,'markersize',12,'markerfacecolor','k');
bar(x,y)