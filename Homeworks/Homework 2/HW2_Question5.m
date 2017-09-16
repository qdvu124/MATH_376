clear all;
format long;

% Question 5

x = linspace(-1, 3, 1000);
f=@(x) x.^3 + x - 1;

figure;
plot(x, f(x), 'k', 'linewidth', 3);
xlabel('x');
grid on;

% [xm] = bisectM_while(fun, xleft, xright, n, TOL)
xR = bisectM_while(f, 0, 1, 30, 1e-8);
