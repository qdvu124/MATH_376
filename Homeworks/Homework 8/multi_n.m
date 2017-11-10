function [x] = multi_n(initial)
% This is hard-coded, and will only work for this problem
    x = zeros(1, 2);
    for i = 1:2
        x(i) = initial(i);
    end
    
    df1x = @(x, y) 2 * x - 1;
    df1y = @(x, y) 1;
    df2x = @(x, y) (-2 .* x + 5 .* y);
    df2y = @(x, y) (1 + 5 .* x);
    f1 = @(x, y) y + x.^2 -x - 0.75;
    f2 = @(x, y) y + 5 * x * y - x.^2;
    
    for i=1:30
        A = [df1x(x(1), x(2)), df1y(x(1), x(2)); df2x(x(1), x(2)), df2y(x(1), x(2))];
        b = [-f1(x(1), x(2)); -f2(x(1), x(2))];
        res = A\b;
        x = x + res';
        disp(x);
    end