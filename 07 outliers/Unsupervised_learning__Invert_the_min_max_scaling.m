%%
clc, clear, close all;
%%
N = 5;
data = log(rand(N,1))*200+100;
%%
a = 10;
b = 60;

dataS = a + ( (data-min(data))/(max(data)-min(data)) )*(b-a);
%%
dataI = ((dataS - a)*(max(data)-min(data))/(b-a))+min(data);
%%
[data, dataI]