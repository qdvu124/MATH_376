function [xm] = secantM(f, x0, x1, n, TOL)
    xm(1) = x0;
    xm(2) = x1;
    fprintf('n \t approximation \n');
    fprintf('%d \t %12.8f \t %12.8f\n', 0, xm(1), f(xm(1)))
    fprintf('%d \t %12.8f \t %12.8f\n', 1, xm(2), f(xm(2)))
    for i = 3:n
        xm(i) = xm(i - 1) - f(xm(i - 1)) * (xm(i - 1) - xm(i-2)) / (f(xm(i - 1)) - f(xm(i - 2)));
        fprintf('%d \t %12.8f \t %12.8f\n', i - 1, xm(i), f(xm(i)))
        absE = abs(xm(i) - xm(i-1));
        if (absE < TOL)
            break;
        end
    end
end