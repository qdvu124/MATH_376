clear all;
format long;

% Question 7
syms x
A = [1 2 3 x; 4 5 x 6; 7 x 8 9; x 10 11 12];
p = (det(A) - 1000);
% p = x^4 - 202*x^2 + 1404*x - 3475
x = linspace(-40, 40, 1000);
f = @(x) x.^4 - 202*x.^2 + 1404*x - 3475;

% figure
% plot(x, f(x));
% grid on;

% We want to be exact up to 6 decimal places in the solution, so we would want a
% tolerance of 10^-6

x1 = bisectM_while(f, -20, 10, 30, 1e-6);
% -17.188498
% Final determinant is correct up to 1 decimal place compared to second
% last determinant
x2 = bisectM_while(f, -1, 12, 30, 1e-6);
% 9.708298
% Final determinant is correct up to 0 decimal place compared to second
% last determinant
f(-17.188498) + 1000
f(9.708298) + 1000