%%
clc, clear, close all;

%%

x = 0:0.1:5;
y1 = x;
y2 = exp(x);

%%
figure(1);
plot(x,y1,'s-','linew',1,'markersize',4,'markerfacecolor','k'),hold on;
plot(x,y2,'o-','linew',1,'markersize',4,'markerfacecolor','k'),hold off;
xlabel('X');
ylabel('Y');
legend({'y = x';'y = e^x'},'box','off','fontsize',20);

%%
figure(2);
semilogy(x,y1,'s-','linew',1,'markersize',4,'markerfacecolor','k'),hold on;
semilogy(x,y2,'o-','linew',1,'markersize',4,'markerfacecolor','k'),hold off;
xlabel('X');
ylabel('Y');
legend({'y = x';'y = e^x'},'box','off','fontsize',20);