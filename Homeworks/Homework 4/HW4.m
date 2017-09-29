clear all;
format long;

% Testing for written part
f = @(x) x.^2 - x - 3;
secantM(f, 1.7, 1.67, 30, 1e-6);

clear all;
f = @(x) -x.^3 - cos(x);
secantM(f, -1.5, -1.52, 30, 1e-6);

clear all;
f = @(x) x.^2 - 6;
secantM(f, 3, 2, 30, 1e-6);
falsePositionM(f, 3, 2, 30, 1e-6);

% Computational part
clear all;
close all;

% Question 5
f = @(x) 7 .* sin(x) .* exp(-x) - 1;
x = linspace(0.170, 0.1702, 1000);
plot (x, f(x));
grid on;
% a) Graphically, the least positive root of the equation is at around 0.17018

% b)
df = @(x) 7 .* exp(-x) .* (cos(x) - sin(x));
NewtonsM(f, df, 0.3, 30, 1e-6);
% For Newton's method: 0.17017999 after 4 approximations
secantM(f, 0.5, 0.4, 30, 1e-6);
% For secant method: 0.17017999 after 7 approximations

% c)
% We see that both Newton's and secant method converges to the solution. However the Newton's method converges faster

clear all;
close all;
% Question 6. We let the methods run for n = 12 since the first two aren't
% really 'iterations' but rather given values
f = @(x) tan(pi * x) - 6;
x = linspace(0, 2, 100);
plot(x, f(x));
grid on;
% a) 0.44753906 
bisectM(f, 0, 0.48, 12, 1e-6);
% b) Diverges
secantM(f, 0, 0.48, 12, 1e-6);
% c) 0.44412066 
falsePositionM(f, 0, 0.48, 12, 1e-6);
% The secant method diverges since starting from the 4th and 5th iteration,
% the two approximation lies on the same side wrt the root, leading to
% divergence

% The bisection method converges surely to the solution

% The first few iterations for the false position method are identical to
% those of the secant method, however extra care is taken to make sure that
% the two approximations never lie on the same side of the root we are
% looking for. Therefore this method is also convergent. However since it
% took a while to stablize, within 10 iterations it is not as effective as
% the bisection method

clear all;
close all;
% Question 7

f = @(h) 1.125 * (sqrt((1 + h./0.8) / (2 + h./0.8))) * 8 * sqrt(9.81) * (2/3)^(3/2) * h ^ (3/2) - 1.3;
secantM(f, 0.1, 0.4, 30, 1e-5);
falsePositionM(f, 0.1, 0.4, 30, 1e-5);
% Secant method returns Hh = 0.23352017 after 5 iterations. H = 1.03352017
% Method of false position returns Hh = 0.23351973 after 7 iterations. H = 1.03351973
% The secant method converges faster in this case.