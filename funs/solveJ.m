function J = solveJ(P, Avd, alpha, beta, W)

[n,~] = size(Avd{1});
d= length(Avd);

z = length(find(P>0));
sX = [n, n, z];
vec_ones = ones(z,1);

if nargin<5
   W0 = zeros(n,n);
   z_= 1;
    for d_=1:d
        W0=W0+P(1,d_)*Avd{1,d_};
        if P(1,d_)==1
           S{1,z_}=Avd{1,d_};
           z_ = z_+1;
        end
    end
end
W = (W0+W0')/2/z;

for v =1:z
    QQ{v} = S{v};
end
Q_tensor = cat(3,QQ{:,:});
[myj, ~] = wshrinkObj_weight_lp(Q_tensor(:), vec_ones*beta./2./alpha,sX, 0,3,1);
J_tensor = reshape(myj, sX);
for v=1:z
    J{v} = J_tensor(:,:,v);
end

end




