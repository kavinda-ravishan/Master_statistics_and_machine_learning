x = -10:0.1:10;
b = 0.5;
sig = 1 ./ (1 + exp(-b*x));

plot(x,sig);