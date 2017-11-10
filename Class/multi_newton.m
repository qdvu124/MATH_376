function multi_newton
[x, fx] = fsolve(@fun, [1.5; 2.5])

function f=fun(x)
f = [2 * x(1) + x(1) * x(2) - 10; x(2) + 3 * x(1)* x(2)^2 - 57]