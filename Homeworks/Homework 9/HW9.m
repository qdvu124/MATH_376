close all;
format long;
% Question 2 c
    f = @(x) x.^3 + 4.001 * x.^2 + 4.002 * x + 1.101;
    g = @(x) -0.0718125 + 0.18825 .* (x + 0.75) + 2.509 .* (x + 0.75) .* (x + 0.5) + 0.978666666 .* (x + 0.75) .* (x + 0.5) .* (x + 0.25);
    xsamp = [-0.75, -0.5, -0.25, 0];
    ysamp = [-0.0718125, -0.02475, 0.3349375, 1.101];
    x = linspace(-1, 1, 1000);
    plot(x, f(x));
    hold on;
    grid on;
    plot(x, g(x));
    plot(xsamp, ysamp, 'ko');
    hold off;

    close all;
    f = @(x) -207.306 * x.^3 + 184.138 * x.^2 - 49.7747 * x + 3.9639;
    g = @(x) 0.62049958 - 9.0448626 .* (x - 0.1) + 59.753695 .* (x - 0.1) .* (x - 0.2) - 207.30635 .* (x - 0.1) .* (x - 0.2) .* (x - 0.3);
    xsamp = [0.1, 0.2, 0.3, 0.4];
    ysamp = [0.62049958, -0.28398668, 0.00660096, 0.2484244];
    x = linspace(0, 1, 1000);
    plot(x, f(x));
    hold on;
    grid on;
    plot(x, g(x));
    plot(xsamp, ysamp, 'ko');
    hold off;
    
% Question 4
    close all;
    L1 = @(x) ((x-6) .* (x-10) .* (x-13) .* (x-17) .* (x-20) .* (x-28))/(6 * 10 * 13 * 17 * 20 * 28);
    L2 = @(x) (x .* (x-10) .* (x-13) .* (x-17) .* (x-20) .* (x-28))/(6 * -4 * -7 * -11 * -14 * -22);
    L3 = @(x) (x .* (x-6) .* (x-13) .* (x-17) .* (x-20) .* (x-28))/(10 * 4 * -3 * -7 * -10 * -18);
    L4 = @(x) (x .* (x-6) .* (x-10) .* (x-17) .* (x-20) .* (x-28))/(13 * 7 * 3 * -4 * -7 * -15);
    L5 = @(x) (x .* (x-6) .* (x-10) .* (x-13) .* (x-20) .* (x-28))/(17 * 11 * 7 * 4 * -3 * -11); 
    L6 = @(x) (x .* (x-6) .* (x-10) .* (x-13) .* (x-17) .* (x-28))/(20 * 14 * 10 * 7 * 3 * -8);  
    L7 = @(x) (x .* (x-6) .* (x-10) .* (x-13) .* (x-17) .* (x-20))/(28 * 22 * 18 * 15 * 11 * 8);
    % For first sample
        f = @(x) 6.67 .* L1(x) + 17.33 .* L2(x) + 42.67 .* L3(x) + 37.33 .* L4(x) + 30.10 .* L5(x) + 29.31 .* L6(x) + 28.74 .* L7(x);
        g = @(x) 6.67 ...
        + 1.776667 .* (x) ...
        + 0.455833 .* (x) .* (x - 6) ...
        - 0.124240 .* (x) .* (x - 6) .* (x - 10) ...
        + 0.013487 .* (x) .* (x - 6) .* (x - 10) .* (x - 13) ...
        - 9.6928e-4 .* (x) .* (x - 6) .* (x - 10) .* (x - 13) .* (x - 17) ...  
        + 4.0948e-5 .* (x) .* (x - 6) .* (x - 10) .* (x - 13) .* (x - 17) .* (x - 20);
        xsamp = [0, 6, 10, 13, 17, 20, 28];
        ysamp = [6.67, 17.33, 42.67, 37.33, 30.10, 29.31, 28.74];
        x = linspace(-1, 30, 1000);
        plot(x, f(x));
        hold on;
        grid on;
        plot(x, g(x));
        plot(xsamp, ysamp, 'ko');
        hold off;
   % For second sample
        close all;
        f = @(x) 6.67 .* L1(x) + 16.11 .* L2(x) + 18.89 .* L3(x) + 15.00 .* L4(x) + 10.56 .* L5(x) + 9.44 .* L6(x) + 8.89 .* L7(x);
        g = @(x) 6.67 ...
        + 1.5733 .* (x) ...
        - 0.08783 .* (x) .* (x - 6) ...
        - 0.01517 .* (x) .* (x - 6) .* (x - 10) ...
        + 2.556e-3 .* (x) .* (x - 6) .* (x - 10) .* (x - 13) ...
        - 2.008e-4 .* (x) .* (x - 6) .* (x - 10) .* (x - 13) .* (x - 17) ...  
        + 8.3671e-6 .* (x) .* (x - 6) .* (x - 10) .* (x - 13) .* (x - 17) .* (x - 20);
        xsamp = [0, 6, 10, 13, 17, 20, 28];
        ysamp = [6.67, 16.11, 18.89, 15, 10.56, 9.44, 8.89];
        x = linspace(-1, 30, 1000);
        plot(x, f(x));
        hold on;
        grid on;
        plot(x, g(x));
        plot(xsamp, ysamp, 'ko');
        hold off;
        
% Question 5
    close all;
    xsamp = [1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003];
    ysamp = [67.052, 68.008, 69.803, 72.024, 73.4, 72.063, 74.669, 74.487, 74.065, 76.777];
    matrix = DividedDif(xsamp, ysamp);
    disp(matrix);
    f = @(x) matrix(1, 1)...
        + matrix(1, 2) .* (x - 1994)...
        + matrix(1, 3) .* (x - 1994) .* (x - 1995)...
        + matrix(1, 4) .* (x - 1994) .* (x - 1995) .* (x - 1996)...
        + matrix(1, 5) .* (x - 1994) .* (x - 1995) .* (x - 1996) .* (x - 1997)...
        + matrix(1, 6) .* (x - 1994) .* (x - 1995) .* (x - 1996) .* (x - 1997) .* (x - 1998)...
        + matrix(1, 7) .* (x - 1994) .* (x - 1995) .* (x - 1996) .* (x - 1997) .* (x - 1998) .* (x - 1999)...
        + matrix(1, 8) .* (x - 1994) .* (x - 1995) .* (x - 1996) .* (x - 1997) .* (x - 1998) .* (x - 1999) .* (x - 2000)...
        + matrix(1, 9) .* (x - 1994) .* (x - 1995) .* (x - 1996) .* (x - 1997) .* (x - 1998) .* (x - 1999) .* (x - 2000) .* (x - 2001)...
        + matrix(1, 10) .* (x - 1994) .* (x - 1995) .* (x - 1996) .* (x - 1997) .* (x - 1998) .* (x - 1999) .* (x - 2000) .* (x - 2001) .* (x - 2002);
    x = linspace(1990, 2005, 1000);
    plot(x, f(x));
    hold on;
    grid on;
    plot(xsamp, ysamp, 'ko');
    % Gives -1.951646134000001e+12
    f(2010);
    % The Runge's phenomenon occurs in this example, as the
    % function does fluctuate greatly outside the interpolating interval
    
    % This is not a good model of the data. Since the y values are too
    % close to each other, it is hard to say that the function we are
    % looking for is a polynomial. If it is a polynomial, then it will
    % change rapidly outside of our given intervals, which does not make
    % sense as oil production cannot grow polynomially faster or slower in
    % normal circumstances.
    f = @(x) matrix(1, 1)...
        + matrix(1, 2) .* (x - 1994)...
        + matrix(1, 3) .* (x - 1994) .* (x - 1995);
    plot(x, f(x));
    % Gives 75.910000000000039e6, pretty accurate
    f(1998);
    % The Runge's phenomenon goes away, since we are now using a
    % lower-order polynomial to interpolate the data points
    
    
    
    
    