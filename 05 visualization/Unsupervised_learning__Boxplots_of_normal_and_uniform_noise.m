%%
clc;
close all;
clear;
%%
% genarate data
N = 100;
data1 = randn(N,1);
data2 = rand(N,1);
%%
% show box plot
figure(1), clf
boxplot([data1, data2])
