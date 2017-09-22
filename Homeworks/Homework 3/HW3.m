clear all;
close all;
clc;

% Question 1
f = @(x) x.^3 + x - 4
TOL = 1e-3;
bisectM(f, 1, 4, 30, TOL);
% 1.378
clear all;

% Question 4
f = @(x) 0.5 + 0.25*x.^2 - (x * sin(x)) - cos (x * 2) / 2;
df = @(x) x ./ 2 - x * cos(x) - sin(x) + sin(2*x);

TOL = 1e-5;
% We can see hat even though at the 12th iteration, f(x) ~ 0, however the
% accuracy is still not under 1e-5
NewtonsM(f, df, pi ./ 2, 30, TOL);
% The approximations converge more slowly, and doesn't stop until the 19th
NewtonsM(f, df, 5 .* pi, 30, TOL);
% The approximations do not converge at all
NewtonsM(f, df, 10 .* pi, 60, TOL);

clear all;
% Question 7
l = 89;
h = 49;
D = 55;
B1 = 11.5 * pi / 180;
a = 33 * pi / 180;

A = l * sin(B1);
B = l * cos(B1);
C = (h + 0.5 * D) * sin(B1) - 0.5 * D * tan(B1);
E = (h + 0.5 * D) * cos(B1) - 0.5 * D;

% 0.0254 != 0
A * sin(a) * cos(a) + B * (sin(a)).^2 - C * cos(a) - E * sin(a)

clear all;

l = 89;
h = 49;
D = 30;
B1 = 11.5 * pi / 180;

A = l * sin(B1);
B = l * cos(B1);
C = (h + 0.5 * D) * sin(B1) - 0.5 * D * tan(B1);
E = (h + 0.5 * D) * cos(B1) - 0.5 * D;

f = @(a) A .* sin(a) .* cos(a) + B .* (sin(a)).^2 - C .* cos(a) - E .* sin(a);
%x = linspace(0, pi, 1000);
%plot(x, f(x));
%grid on;
TOL = 1e-5;
bisectM(f, 0, 1, 60, TOL);
% a ~ 0.57891 rad ~ 33.2 degrees

clear all;

% Question 8
format long;
syms x y;
sol = solve(x * y - y == log(203302/179323), x^2 * y - x * y == log(226542/203302));
k = -log(nthroot(double(sol.x), 10));
% k = 0.014800624964976
c = -(double(sol.y));
% c = 0.912262916225994
P = 179323 / (exp(-c));
% P = 4.465054316721075e+05
Pt = @(t) P * exp(-c * exp(-k * t));
Pt(30);
% 2.487074786391903e+05. This is a pretty good approximation, actual is
% 249633
Pt(60)
% 3.067673443950788e+05. Population is declining