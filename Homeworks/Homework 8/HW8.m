format long;
close all;

% Question 4
    % Part i
        A = [3, -1, 1; 3, 6, 2; 3, 3, 7];
        b = [1, 0 ,4]';
        initial = [0, 0, 0];
        Jacobi(A, b, initial, 30, 1e-3);
        GaussSeidel(A, b, initial, 30, 1e-3);
    % Part ii
        A = [4, -1, 0, 0 ,0 ,0; -1, 4, -1, 0, 0, 0; 0, -1, 4, 0, 0, 0; 0, 0, 0, 4, -1, 0; 0, 0, 0, -1, 4, -1; 0, 0, 0, 0, -1, 4];
        b = [0, 5, 0, 6, -2, 6]';
        initial = [0, 0, 0 , 0, 0, 0];
        Jacobi(A, b, initial, 30, 1e-3);
        GaussSeidel(A, b, initial, 30, 1e-3);
% Question 5
    % Part a
        f = @(x) -x.^2 + x + 0.75;
        g = @(x) x.^2 ./ (1 + 5*x);
        x = linspace(-3, 3, 1000); 
        plot(x, f(x));
        grid on;
        hold on;
        plot(x, g(x));
        hold off;
        % Initial guesses: -0.5, -0.18, 1.3
    % Part b
        % i Using the Newton's method
        multi_n([-0.5, 0]); % Converges to x = -0.585273796433824, y= -0.177819213225885
        multi_n([-0.18, 0.5]); % Converges to x = -0.186791609393509, y = 0.528317285266674
        multi_n([1.3, 0.36]); % Converges to x = 1.372065405827332, y = 0.239501927959210
        
        % ii Using see multi_newton.m for fsolve solution
