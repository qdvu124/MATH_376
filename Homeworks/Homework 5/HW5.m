clear all;
clc;
close all;

format long;
% Question 2
    % Part b
        g = @(x) x.^3 - 6 * x.^2 + 12 * x - 6;
        TOL = 1e-3;
        n = 30;

        % Diverges
        fixedpointM(g, 0.9, n, TOL);
        % Converges to 2
        fixedpointM(g, 1.1, n, TOL);
        % Diverges
        fixedpointM(g, 3.1, n, TOL);
    % Part c
        x = linspace(0.5,3.5,1000);
        y = @(x) x;
        plot(x, g(x));
        hold on;
        grid on;
        plot(x, y(x));
        hold off;

clear all;
close all;
% Question 3
    f = @(x) 3.1 * x * (1 - x);
    MAXITER = 80;
    TOL = 1e-4;
    fixedpointM(f, 0.6, MAXITER, TOL);
    % Even though the gues is close enough to the actual value, the
    % estimation fluctuates and does not converge to xR
    
clear all;
close all;
% Question 5
    % Part a
        % I expect the method to converge faster than the bisection
        % method. We can in fact verify:
        f = @(x) x .^ 2 - 0.24;
        TOL = 1e-10;
        n = 40;
        % Finishes at 30th iteration 
        bisectM(f, -0.3, 0.2 , n, TOL);
        % Finishes at 25th iteration
        fixedpointM(f, 0, n, TOL);
    % Part b
        % By the discussion in question 4, A = |g'(xR)| = |2 * (-0.2)| = 0.4.
        % We know that the bisection method converge with rate 0.5, and since
        % 0.4 < 0.5, the fixed point method converges faster for this
        % particular case
