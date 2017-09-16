clear all;
format long;

% Question 6
%{ 
    a) Plot the two ellipses on the same figure and zoom in on the plot to
    estimate the intersection 
%}

theta = linspace(0, 2 * pi, 1000);
x1 = 3 + 2 * cos(theta);
y1 = 1 + 3 * sin(theta);
x2 = 1 + 5 * cos(theta);
y2 = -2 + sqrt(13) * sin(theta);

figure;
plot(x1, y1);
hold on;
plot(x2, y2);
hold off;
grid on;
xlabel('x');
ylabel('y');
title("Question 6");

% There are two intersections, roughly (1.042, 1.605) and (4.930, 0.223)

%{ 
    b) Use the bisection method to find the roots
%}

x1 = linspace(-2, 2, 1000);
x2 = linspace(3, 7, 1000);
f1=@(x) ((x - 1).^2) / 25 + ((3 + 3 / 2 * sqrt(-5 + 6 * x - x.^2)).^2) / 13 - 1;
f2=@(x) ((x - 1).^2) / 25 + ((3 - 3 / 2 * sqrt(-5 + 6 * x - x.^2)).^2) / 13 - 1;

figure;
plot(x1, f1(x1));
hold on;
plot(x2, f2(x2));
hold off;
grid on;

x1 = bisectM_while(f1, 1, 2, 30, 1e-6);
x2 = bisectM_while(f2, 4, 5, 30, 1e-6);
% Using the bisection method we obtain the first x-coordinate of 1.04115009 
% and the second is 4.93243504 

f1 = @(x) 1 + (3 / 2) * sqrt(-5 + 6 * x - x.^2);
f2 = @(x) 1 - (3 / 2) * sqrt(-5 + 6 * x - x.^2);
y1 = f1(1.04115009);
y2 = f2(4.93243504);

% y1 = 1.605426145544798
% y2 = 0.226816104406299

%{ 
    c) Estimate how good the results are
%}

f1 = @(x,y) (x - 3).^2 / 4 + (y - 1).^2 / 9;
f2 = @(x,y) (x - 1).^2 / 25 + (y + 2).^2 / 13;

f1(1.04115009, 1.605426145544798)
% 1.000000000000000, Eabs = Erel = 0;
f2(4.93243504, 0.226816104406299) 
% 1.000001041663811, Eabs = 0.000001041663811, Erel = 0.000001041663811