%solve(10)
function [x, ft] = EProjSimplex_new(v, k)

%
%% Problem
%
%  min  1/2 || x - v||^2
%  s.t. x>=0, 1'x=1
%

if nargin < 2
    k = 1;
end

ft=1;
n = length(v);

v0 = v-mean(v) + k/n;
%vmax = max(v0);
vmin = min(v0);
if vmin < 0
    f = 1;
    lambda_m = 0;
    while abs(f) > 10^-10
        v1 = v0 - lambda_m;
        posidx = v1>0;
        npos = sum(posidx);% v1 中大于0的元素个数
        g = -npos;
        f = sum(v1(posidx)) - k;% v1中大于零的元素之和 -k
        lambda_m = lambda_m - f/g;% lambda_m+=(v1中大于零的元素之和 -k)/(v1中大于0的元素个数)
        ft=ft+1;                  % lambda_m+=(v1中大于零的元素的均值)-k/(v1中大于0的元素个数)
        if ft > 100
            x = max(v1,0);
            break;
        end
    end
    x = max(v1,0);

else
    x = v0;
end