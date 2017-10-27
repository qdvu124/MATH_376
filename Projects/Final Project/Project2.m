clear all;
close all;
format long;

% Project 2
% Part a
    rho = 1.23;
    V = 40;
    D = 0.005;
    mu = 1.79e-5;
    % Gives Re = 1.374301675977654e+04
    Re = rho * V * D / mu;
    
% Part b
    eps = 0.0015e-3; % Given in millimeters
    f = @(x) 1 ./ (sqrt(x)) + 2 * log10(eps / (3.7 * D) + 2.51 ./ (Re .* sqrt(x)));
    x = linspace(0.008, 0.08, 1000);
    plot(x, f(x));
    grid on;
    % From the estimation, it looks like the root is somewhere around 0.029
    
% Part c
    close all;
    bisectM(f, 0.008, 0.8, 50, 1e-8);
    falsePositionM(f, 0.008, 0.8, 50, 1e-8);
    
% Part d
    df =  @(x) (-1) ./ (2 *x * sqrt(x)) + 2 * (log10(exp(1)) * 1 / (eps / (3.7 * D) + 2.51 ./ (Re .* sqrt(x))) * (-2.51) ./ (2 * Re * x * sqrt(x)));
    NewtonsM(f, df, 0.008, 50, 1e-8);
    NewtonsM(f, df, 0.08, 50, 1e-8);
    
% Part e
    options = optimset('Display','iter', 'TolX', 1e-8);
    fzero(f, 0.008, options);
    fzero(f, 0.08, options);
    
% Part f
    % This function does not work
    g = @(x) (-1 ./ (2 * log10(eps / (3.7 * D) + 2.51 ./ (Re .* sqrt(x))))).^2;
    fixedpointM(g, 0.008, 50, 1e-8);
    fprintf('\n');
    fixedpointM(g, 0.08, 50, 1e-8);