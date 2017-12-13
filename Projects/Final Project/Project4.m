clear clc;
close all;

depth = [0, 2.3, 4.9, 9.1, 13.7, 18.3, 22.9, 27.2];
temp = [22.8, 22.8, 22.8, 20.6, 13.9, 11.7, 11.1, 11.1];

an = spline_natural(depth, temp);
size(an)
hold on;
grid on;
for i=1:7
    xspace = linspace(depth(i), depth(i+1), 100);
    curx = depth(i);
    f = @(x) temp(i) + an(3 * (i - 1) + 1) .* (x - curx) ...
    + an(3 * (i - 1) + 2) .* (x - curx).^2 ...
    + an(3 * (i - 1) + 3) .* (x - curx).^3;
    plot(xspace, f(xspace));
end
for i=1:7
    xspace = linspace(depth(i), depth(i+1), 100);
    curx = depth(i);
    f = @(x) an(3 * (i - 1) + 1) ...
    + 2 * an(3 * (i - 1) + 2) .* (x - curx) ...
    + 3 * an(3 * (i - 1) + 3) .* (x - curx).^2;
    plot(xspace, f(xspace));
end
for i=1:7
    xspace = linspace(depth(i), depth(i+1), 100);
    curx = depth(i);
    f = @(x)2 * an(3 * (i - 1) + 2) ...
    + 6 * an(3 * (i - 1) + 3) .* (x - curx);
    plot(xspace, f(xspace));
end
title('Graph of temperature against depth, as well as its first and second derivatives');
plot(depth, temp, 'ko');

% The graph shows that the thermocline should lie between the 4th and the
% 5th data point.
f = @(x) 2 * an(3 * 3 + 2) ...
    + 6 * an(3 * 3 + 3) .* (x - depth(4));
bisectM(f, 9.1, 13.7, 30, 1e-6);

thermocline = 11.3463673830;

alpha = 0.01;
rho = 1;
C = 1;

% Function for the gradient
f = @(x) an(3 * 3 + 1) ...
    + 2 * an(3 * 3 + 2) .* (x - depth(4)) ...
    + 3 * an(3 * 3 + 3) .* (x - depth(4)).^2;

%  -1.6141 Celcius/m
gradient = f(thermocline);

% 1.614055517555187e-04
flux = - alpha * rho * C * gradient / 100