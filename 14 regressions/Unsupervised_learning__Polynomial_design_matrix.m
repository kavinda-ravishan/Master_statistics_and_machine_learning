clc, clear, close all;

% generate the data

n  = 30;
x  = linspace(-2,4,n);
y1 = x.^2 + randn(1,n);
y2 = x.^3 + randn(1,n);

%%% plot the data
figure(1), clf, hold on
plot(x,y1,'ko','markersize',10,'markerfacecolor','r','linew',2),hold on;
plot(x,y2,'ko','markersize',10,'markerfacecolor','g','linew',2);

X1 = [ones(1,n); x; x.^2]';
beta1 = (X1' * X1)^(-1)*X1' * y1';
y1hat = X1*beta1;

X2 = [ones(1,n); x; x.^2; x.^3]';
beta2 = (X2' * X2)^(-1)*X2' * y2';
y2hat = X2*beta2;

plot(x,y1hat,'r','linew',2);
plot(x,y2hat,'g','linew',2),hold off;
legend({'Quadratic','Cubic','Quadratic','Cubic'});