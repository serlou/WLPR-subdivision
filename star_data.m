function [x0,y0,f0] = star_data(sigma)
% [x0,y0,f0] = star_data(sigma)
% INPUT:    sigma 1x1 matrix, noise magnitude in the initial data.
%           sigma = 0 by default
% OUTPUT:   x0 1x50 matrix, x-coordinates of the curve
%           y0 1x50 matrix, y-coordinates of the curve
%           f0 1x50 complex matrix, curve points in the complex plane
%   Copyright (c) 2023 Sergio López-Ureña and Dionisio F. Yáñez

if nargin < 1
    sigma = 0;
end
t0 = (0:49)*pi/25;
x0 = 4*cos(t0) + cos(4*t0);
y0 = 4*sin(t0) - sin(4*t0);
x0 = x0 + sigma*randn(1,length(x0));
y0 = y0 + sigma*randn(1,length(y0));
f0 = x0 + 1i*y0;