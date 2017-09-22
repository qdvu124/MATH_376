clear all;

format long;

x = linspace(-1,3, 1000);
f=@(x) x.^3 + x - 4;
2
plot(x, f(x), 'k', 'linewidth', 3);
xlabel('x');
grid on;

%[xm] = bisectM(fun, xleft, xright, n, TOL)
fun = f;
xleft = 1;
xright = 4;
n = 30;
TOL = 1e-3;

xR = bisectM(fun, xleft, xright, n, TOL);