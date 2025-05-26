clc;
clear;

currentFolder = pwd;
addpath(genpath(currentFolder));
NITER=5;
load('iris'); %,73,84.75,82,83,84.75,84.75,
c = length(unique(Y));
k =10;
o =15;
Z=5;
alpha=100; beta=1000;  % for most data sets,this setting can obtain the best results
[Ad,eta] = constructA_d(X, k, o); 
[y,W] = MCDLT(Ad,c,NITER,Z, alpha, beta,eta);
Dw = diag(sum(W)); % check the doubly stochastic property of graph, i.e., the degree matrix is an identity matrix
result = ClusteringMeasure_new(Y, y')
W(W>0)=1;
imshow(W,[]); colormap parula;  % visualize the learned graph
