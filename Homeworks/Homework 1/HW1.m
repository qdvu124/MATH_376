clear all;
% Question 4

% Part a
% Create a 3 by 5 matrix with elements being numbers from 1 to 5 (first row), 6 to 10 (second row), and 11 to 15 (third row)
W = [1:5; 6:10; 11:15]
% sizes(W) creates an error. size(W) prints the dimensions of W (3 by 5)
size(W)
% Changes the element on the second row, fourth column to be 33
W(2,4) = 33
% Returns a new matrix which is the intersection of the first two rows and the last 2 columns of W
W(1:2, 4:5)
% Returns a new column matrix which is the fourth column
W(:, 4)
% Changes all elements on the third row to their negative counterparts
W(3,:)=-W(3,:)

% Part b
% Creates a vector of natural numbers from 1 to 12, increasing by 1 in each step
x = 1:12
% Creates a vector of numbers from 1 to 3, incrementing each number by 0.2 in each step
x = 1:.2:3
% Creates a vector of natural numbers for 4 to 0, decreasing by 1 in each step
x = 4:-1:0
% Creates a vector where each element is the corresponding element in x, multiplied by 2 then add 1
y = 2 * x + 1
% Creates a vector with 10 equally spaced elements, with the first element being 0 and the last being pi
theta = linspace(0, pi, 10)

% Part c
% Empty vector
M = []
% Calculate each element of M. Element at index i =  i ^ 2
for i = 1:5, M(i) = i ^ 2, end
% Same result. However with the . to denote that the actual element inside the vector is squared instead of the vector itself
Mvectorize = (1:5).^2

% Question 5
% Part a
xa = linspace(-3, 3, 1000);
fxa = abs(xa.^2 - 1);

xb = linspace(-4, 4, 1000);
fxb = sqrt(abs(xb));

xc = linspace(-2, 2, 1000);
fxc = 1 ./ (10 * (xc.^2) + 1);

xd = linspace(-200, 200, 1000);
fxd = 1 ./ (0.001 * (xd.^2) + 1);

figure
subplot(2, 2, 1);
plot(xa, fxa);
xlabel('x');
ylabel('fx');
title('f(x) = |x^2 - 1|');

subplot(2, 2, 2);
plot(xb, fxb);
xlabel('x');
ylabel('fx');
title('f(x) = sqrt|x|');

subplot(2, 2, 3);
plot(xc, fxc);
xlabel('x');
ylabel('fx');
title('f(x) = 1/(10x^2 + 1)');

subplot(2, 2, 4);
plot(xd, fxd);
xlabel('x');
ylabel('fx');
title('f(x) = 1/(0.001x^2 + 1)');

% Question 6
theta =  linspace(0, 2 * pi, 500);
a = 2;
b = 3;
x0 = 1;
y0 = 3;
x = x0 + a * cos(theta);
y = y0 + b * sin(theta);

figure
plot(x,y);

% When the number of angular divisions is small, the ellipse become a polygon.
% We do not have enough points to make the ellipse smooth
plotEllipse(5, 6, 0, 0, 9);

% Question 7
x = 0.1;

% First computation
sum = 1000;
for i = 1:10000
    sum = sum - x;
end
% 1.5882e-10
abs(sum)

% Second computation
sum = 10000;
for i = 1:100000
    sum = sum - x;
end
% 1.8848e-08
abs(sum)

% Third computation
sum = 100000;
for i = 1:1000000
    sum = sum - x;
end
% 1.3329e-06
abs(sum)

% Question 8
A = [1 2; -1 1];
B = [2 0; 0 2];
C = [2 0 -13; 0 0 -1];
D = [1 2; 2 3; -1 0];
x = [1; 0];
y = [0; 1];
z = [1; 2; -1];

% Part a: [3 2; -1 3]
A + B
% Part b: Error, Matrix dimensions must agree
% 2 * A - D
% Part c: [3; -4]
3 * x - 4 * y
% Part d: [1, -1]
A * x
% Part e: [2, -2]
B * (x - y)
% Part f: Error: Inner matrix dimensions must agree
% C * y
% Part g: [1; 2; -1]
D * x
% Part h: Error: Inner matrix dimensions must agree
% D * z + y
% Part i: [2 4; -2 2]
A * B
% Part j: [4 0 -26; 0 0 -2]
B * C
% Part k: [15 4; 1 0]
C * D

% Question 9
%{
    The first graph converges to 0
    The second graph converges to some values between 0.3 and 0.35
    The third graph fluctuates at first but eventually converges to a value
    The fourth graph oscillates in 2-cycles
    The fifth graph oscillates inn 4-cycles
    The sixth graph exhibits chaotic behaviour
%}
uvalues = [0.8 1.5 2.8 3.2 3.5 3.65]
max = 30;
x = zeros(1,max);
n = 1:max;
figure
for i = 1:6
    u = uvalues(i);
    x(1) = u * 0.5 * 0.5;
    
    for j = 2:max
       x(j) = u * x(j-1) * (1 - x(j-1));
    end
    subplot(3, 2, i)
    plot(n, x, 'k*--')
    xlabel('n');
    ylabel('xn');
    title(u, 'fontsize', 15);
end

function plotEllipse(a, b, x0, y0, npoints)
   theta = linspace(0, 2 * pi, npoints)
    x = x0 + a * cos(theta);
    y = y0 + b * sin(theta);
    figure
    plot(x,y);
end
