function [y, W] = solveW(J, c, eta)

[n,~] = size(J{1});
z = length(J);
zr = 10e-11;
rho = 1.1;
mu = 1;
lambda = zeros(n);
W0 = zeros(n,n);
for v=1:z
    W0=W0+J{v};
end
PP = W0;
W = (W0+W0')/2;
D0 = diag(sum(W));
L0 = D0 - W;
NITER = 300;
[F, ~, evs]=eig1(L0, c, 0);
for iter = 1:NITER
    R = L2_distance_1(F',F');  
    Z = PP+ mu*W'-1/2*eta*R'+1/2*lambda'-1/2*lambda;
    tempW = zeros(n,n);
    for i=1:n
        ad = Z(i,:)/(z+mu);
        tempW(i,:) = EProjSimplex_new(ad);
    end;
    W = tempW;
    % Update lambda
    h = W-W';
    lambda = lambda+mu*h;
    % Update mu
    mu = rho*mu;
    W = (W+W')/2;
    Dw = diag(sum(W));
    L = Dw-W;
    F_old = F; % store F temporaly
    [F, ~, ev]=eig1(L, c, 0);
    evs(:,iter+1) = ev;
    I = eye(n);
    condDS = Dw-I;
    flag = sum(logical(diag(condDS)<0.0001));
    fn1 = sum(ev(1:c));
    fn2 = sum(ev(1:c+1));
    if fn1 > zr
        eta = 2*eta;
    elseif fn2 < zr
        eta = eta/2;
        F = F_old;
    elseif fn1 < 0.00000000001 & fn2 > 0.00000000001 & flag == n
        break;
    end; 
end;

[clusternum, y]=graphconncomp(sparse(W)); y = y';
if clusternum ~= c
    sprintf('Can not find the correct cluster number: %d', c)
end;


