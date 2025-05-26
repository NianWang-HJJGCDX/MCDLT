function [y,W]=MCDLT(Avd,c,NITER,Z, alpha, beta,eta)

[n,~]=size(Avd);
[~, o] = size(Avd);
P = ones(1,o);
W = zeros(n,n);
for d=1:o
    W=W+P(1,d)*Avd{1,d};
end
W = W/o;

for iter =1:NITER
    J = solveJ(P, Avd, alpha, beta);
    %solve S
    S = solveS(W,J,alpha);
    %solve W
    [y, W] = solveW(S,c,eta);
    %solve P
    Pold = P;
    norm_WS = cellfun(@(x)(norm(W-x,'fro')^2), Avd, 'UniformOutput', true); 
    P = selec_min(norm_WS,Z); 
    if norm(P-Pold,'fro')^2 ==0 % output in advance if the graph selection is unchanged
        break;
    end;
end
function vec = selec_min(WS,Z)
    vec = zeros(1,size(WS,2));
    for i =1:Z
        col = find(WS==min(WS));
        vec(col) = 1;
        WS(col)=1000000000;
    end
end
end
