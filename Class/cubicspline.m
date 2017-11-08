clear all;

xdata = [0 2 4 7 10 12];
ydata = [20 20 12 7 6 6];

yval = spline(xdata, ydata, 1.5);

xx = linspace(min(xdata), max(xdata), 500);
yy = spline(xdata, ydata, xx);

plot(xdata, ydata, 'ko')