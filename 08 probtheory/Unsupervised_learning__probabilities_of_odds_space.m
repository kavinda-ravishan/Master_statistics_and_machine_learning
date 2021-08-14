clc, clear, close all;

m = 1:1:10;
n = 1:1:11;

[M, N] = meshgrid(m, n);
P = M./(M+N);
contourf(M, N, P);
pcolor(M, N, P);
%shading interp
title('P')
xlabel('m')
ylabel('n')
colorbar;