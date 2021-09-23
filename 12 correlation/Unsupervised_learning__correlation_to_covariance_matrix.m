close all; clear; clc

N = 1000;     % time points
M =   4;     % channels

t = linspace(0,6*pi,N);

chanrel = sin(linspace(0,2*pi,M))';

data = bsxfun(@times,repmat( sin(t),M,1 ),chanrel);
data = data + randn(M,N);

dataCovMat = cov(data');

dataCorrMat = corrcoef(data');

stdDiag = diag(std(data,0,2));

stdDiag*dataCorrMat*stdDiag
dataCovMat

stdDiagInv = inv(stdDiag);
stdDiagInv*dataCovMat*stdDiagInv
dataCorrMat

