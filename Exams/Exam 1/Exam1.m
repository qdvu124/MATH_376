clear all;
clear clc;
close all;

format long;

% Question 1
    A = [2 1 -1 1 -3; 1 0 2 -1 1; 0 -2 -1 1 -1; 3 1 -4 0 5; 1 -1 -1 -1 1];
    disp(A);
    b = [7 2 -5 6 3]';
    disp(b);
    Gaussian(A, b);
    
    % Answer: x1 = 1.918128654970760
    % x2 = 1.964912280701754
    % x3 = -0.988304093567251
    % x4 = -3.192982456140350
    % x5 = -1.134502923976608
    
% Question 2
    v = 625;
    T = 4 + 273.15; % Conversion to Kelvin
    p = 110;
    theta = 4 * pi / 180; % Conversion to radians
    betaLower = 2 * pi / 180;
    betaUpper = 88 * pi / 180;
    k = 1.4;
    R = 287;
    M = v / sqrt(k * R * T);
    
    f = @(x) 2 .* cot(x) .* ((M.^2 * (sin(x)).^2 - 1) ./ ((k + cos(2*x)).*(M.^2) + 2)) - tan(theta);
    x = linspace(betaLower, betaUpper, 1000);
    plot(x, f(x));
    hold on;
    grid on;
    % From the graph given, we see that the solution lies between 0.1 and 0.2
    % In fact, ~0.084
    
    TOL = 1e-6;
    FalsePosition(f, 0.1, 0.2, 30, TOL);
    % The method converges after 3 iterations to give beta = 0.08392170 
    fprintf('\n');
    % I found g(x) by finding an expression for sin^2(beta) from f(x), and 
    % then the equation becomes beta = asin(sqrt(epxression)) = g(x)
    g = @(x) asin(sqrt(((tan(theta) .* tan(x)) / 2 .* ((k + cos(2 .* x)) * M.^2 + 2) + 1) / M.^2));
    plot(x, g(x));
    plot(x, x);
    hold off;
    FixedPoint(g, 0.1, 30, TOL);
    % The method converges after 14 iterations to give beta = 0.08392253
    % Using the beta found using the false position method, pa = 1.003953826032124e+05
    pa = p .* (2 * k / (k + 1) * (M * sin(0.08392170)).^2 - (k-1)/(k+1))
    % Using the beta found using the fixed point method, pa = 1.003973641655791e+05
    pa = p .* (2 * k / (k + 1) * (M * sin(0.08392253)).^2 - (k-1)/(k+1))
    