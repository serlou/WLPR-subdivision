function f = WPLR_subdivision(f,d,iter,lambda,kern)
% f = WPLR_subdivision(f,d,iter,lambda,kern)
% INPUT:    f 1xN matrix, data to be refined
%           d 1x1 integer, d>=0. Polynomial degree for regression
%           iter 1x1 integer, iter>0. Number of iterations
%           lambda 1x1 positive real, bandwidth 
%           kern handle function, kern:(-1,1)->[0,1]
%            or string with valid kernel name. +info: help compute_weights
% OUTPUT:   f 1xM matrix, refined data
%   Copyright (c) 2023 Sergio López-Ureña and Dionisio F. Yáñez
% Read the following paper to get more information about these subdivision
% schemes:
% "Subdivision schemes based on weighted local polynomial regression.
% A new technique for the convergence analysis"
% Sergio López-Ureña and Dionisio F. Yáñez. 2023.
% https://arxiv.org/abs/2309.03500

mask = compute_mask(lambda,d,kern);
for i=1:iter
    f1 = zeros(1,2*length(f));
    f1(1:2:end-1) = f;
    f = cconv(f1,mask);
end
