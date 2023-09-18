function mask = compute_mask(lambda,d,kern)
% mask = compute_mask(lambda,d,kern)
% INPUT:    lambda 1x1 positive real, bandwidth
%           d 1x1 integer, d>=0, polynomial degree for regression
%           kern handle function, kern:(-1,1)->[0,1]
%            or string with valid kernel name. +info: help compute_weights
% OUTPUT:   mask 1xN real matrix, subdivision mask
%   Copyright (c) 2023 Sergio López-Ureña and Dionisio F. Yáñez

%% Checks
assert(~isinteger(lambda),'lambda cannot be an integer');
assert(lambda > 0,'lambda must be positive');
assert(d+1 <= 2*floor((lambda+1)/2),'d+1 <= 2*floor((lambda+1)/2) must be fulfilled');

%% Odd mask
n2m1 = 2*ceil((lambda-1)/2)-1;
x = (-n2m1:2:n2m1)';
assert(lambda<n2m1+2)
X = x.^(0:d);
w = compute_weights(x/lambda,kern);
W = diag(w);
e1 = eye(d+1,1);
a1 = W*X*((X'*W*X)\e1);

%% Even mask
n2m2 = 2*ceil(lambda/2)-2;
x = (-n2m2:2:n2m2)';
assert(lambda<n2m2+2)
X = x.^(0:d);
w = compute_weights(x/lambda,kern);
W = diag(w);
a0 = W*X*((X'*W*X)\e1);

%% Collect
mask = zeros(1,length(a0)+length(a1));
if length(a0) > length(a1)
    mask(1:2:end)=a0;
    mask(2:2:end-1)=a1;
else
    mask(1:2:end)=a1;
    mask(2:2:end-1)=a0;
end