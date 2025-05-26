function S = solveS(W,J, alpha)

[n,~] = size(J{1});
z = length(J);
S = J;
for z_=1:z
    PP = W + alpha * J{z_};
    tempS = zeros(n,n);
    for i=1:n
        ad = PP(i,:)/(1+alpha);
        tempS(i,:) = EProjSimplex_new(ad);
    end;
    S{z_} = tempS;
end



