clc, clear, close all
%%
N = 1000;
udist1 = (99*rand(N,1))+1;
udist2 = (99*rand(N,1))+1;

%%
avg = zeros(N*N,1);

n = 1;
for i=1:N
    for j=1:N
        avg(n) = (udist1(i)+udist2(j))/2;
        n=n+1;
    end
end

%%
[y,x] = hist(avg);
bar(x,y)