%   Copyright (c) 2023 Sergio López-Ureña and Dionisio F. Yáñez

%% parameters
sigma = 0.25;   % Noise magnitude in the initial data
d = 2;          % Polynomial degree in the regression problem.
                % Note: d=2*n and d=2*n+1 provide the same results.
lambda = 9.5;   % Bandwidth, positive real, not integer.
                % Must fulfill d+1 <= 2*floor((lambda+1)/2)
kern = 'sedi';  % Kernel, string or handle function. +info: help compute_weights
iter = 5;       % iter>=1. Subdivision iterations

%% Define data and subdivide
[x0,y0,f0] = star_data(sigma);
x = WPLR_subdivision(x0,d,iter,lambda,kern);
y = WPLR_subdivision(y0,d,iter,lambda,kern);
f = x + 1i*y;

%% Plot results
figure(1)
clf;
hold on
box on
plot(f,'k', 'LineWidth', 2.5);
axis([-7,7,-7,7])
axis square
plot(f0, 'bo', 'LineWidth', 1.5, 'MarkerSize', 4);