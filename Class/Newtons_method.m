clear all; clc;

format long;

x = linspace(-1,3, 1000);
f=@(x) exp(-x) - x;
fder=@(x) -exp(-x) - 1;

plot(x, f(x), 'k', 'linewidth', 3);
xlabel('x');
grid on;

%[xm] = bisectM(fun, xleft, xright, n, TOL)
TOL = 1e-4;
xR = NewtonsM(f, fder, 0, 20, TOL);